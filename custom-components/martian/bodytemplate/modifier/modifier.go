// Package modifier exposes a request modifier for generating bodies
// from the querystring params
package modifier

import (
	"bytes"
	"compress/gzip"
	"compress/zlib"
	"encoding/json"
	"errors"
	"github.com/devopsfaith/krakend-ce/custom-components/datadog/pb"
	"github.com/devopsfaith/krakend/logging"
	"github.com/golang/protobuf/proto"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"strconv"
	"text/template"
)

type Config struct {
	UrlKeysToExtract        []string `json:"url_keys_to_extract"`
	Template                string   `json:"template"`
	EndpointContentType     string   `json:"endpoint_content_type"`
	EndpointContentEncoding string   `json:"endpoint_content_encoding"`
	BackendContentEncoding  string   `json:"backend_content_encoding"`
	ContentType             string   `json:"content_type"`
}

type BodyTemplateModifier struct {
	urlKeysToExtract        []string
	template                *template.Template
	endpointContentType     string
	endpointContentEncoding string
	backendContentEncoding  string
	contentType             string
}

func (m *BodyTemplateModifier) ModifyRequest(req *http.Request) error {
	query := req.URL.Query()

	var reader io.ReadCloser
	var err error
	logger, err := logging.NewLogger("DEBUG", os.Stdout, "")
	logger.Debug("BodyTemplateModifier")
	if m.endpointContentEncoding != "" {
		logger.Debug("endpointContentEncoding")
		if m.endpointContentEncoding == "gzip" {
			logger.Debug("endpointContentEncoding: gzip")
			reader, err = gzip.NewReader(req.Body)
		} else if m.endpointContentEncoding == "deflate" {
			logger.Debug("endpointContentEncoding: deflate")
			reader, err = zlib.NewReader(req.Body)
		} else {
			return errors.New("endpoint_content_encoding is not allowed")
		}

		if err != nil {
			return err
		}
		defer reader.Close()
	} else {
		logger.Debug("endpointContentEncoding: empty")
		reader = req.Body
	}

	body, err := ioutil.ReadAll(reader)
	if err != nil {
		return err
	}

	buf := new(bytes.Buffer)
	endpointContentType := "application/json"
	if m.endpointContentType != "" {
		endpointContentType = m.endpointContentType
	}
	if endpointContentType == "application/x-protobuf" {
		bodyProtobuf := pb.TracePayload{}
		err = proto.Unmarshal(body, &bodyProtobuf)
		if err != nil {
			logger.Debug("Error decoding Protobuf Request:", err)
		}
		err = m.template.Execute(buf, bodyProtobuf)
	} else if endpointContentType == "application/json" {
		var bodyJson interface{}
		err = json.Unmarshal(body, &bodyJson)
		if err != nil {
			logger.Debug("Error decoding Json Request:", err)
			if e, ok := err.(*json.SyntaxError); ok {
				logger.Debug("syntax error at byte offset %d", e.Offset)
			}
			logger.Debug("Json Request: %q", string(body))
			return err
		}
		err = m.template.Execute(buf, bodyJson)
	} else {
		return errors.New("endpoint_content_type is not allowed")
	}

	if err != nil {
		return err
	}
	logger.Debug("Json New Request: %q", buf.String())

	var bufZip bytes.Buffer
	var g io.WriteCloser
	if m.backendContentEncoding != "" {
		if m.backendContentEncoding == "deflate" {
			g = zlib.NewWriter(&bufZip)
			req.Header.Set("Content-Encoding", "deflate")
		} else if m.backendContentEncoding == "gzip" {
			g = gzip.NewWriter(&bufZip)
			req.Header.Set("Content-Encoding", "gzip")
		} else {
			return errors.New("backend_content_encoding is not allowed")
		}

		if _, err = g.Write(buf.Bytes()); err != nil {
			return err
		}
		g.Close()
	} else {
		_, err = buf.WriteTo(&bufZip)
	}

	for _, k := range m.urlKeysToExtract {
		query.Del(k)
	}

	if m.contentType != "" {
		req.Header.Set("Content-Type", m.contentType)
	} else {
		req.Header.Set("Content-Type", "application/json; charset=UTF-8")
	}

	req.Body = ioutil.NopCloser(&bufZip)
	req.URL.RawQuery = query.Encode()

	return nil
}

func FromJSON(b []byte) (*BodyTemplateModifier, error) {
	cfg := &Config{}
	if err := json.Unmarshal(b, cfg); err != nil {
		return nil, err
	}

	tmpl, err := template.New("bodytemplate_modifier").Funcs(template.FuncMap{
		"Int64ToString": func(value int64) string {
			return strconv.FormatInt(value, 10)
		},
	}).Parse(cfg.Template)
	if err != nil {
		return nil, err
	}

	return &BodyTemplateModifier{
		endpointContentType:     cfg.EndpointContentType,
		endpointContentEncoding: cfg.EndpointContentEncoding,
		backendContentEncoding:  cfg.BackendContentEncoding,
		urlKeysToExtract:        cfg.UrlKeysToExtract,
		template:                tmpl,
	}, nil
}
