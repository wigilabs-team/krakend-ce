// Package bodytemplate registers a request modifier for generating bodies
package bodytemplate

import (
	"github.com/devopsfaith/krakend-ce/custom-components/martian/bodytemplate/modifier"
	"github.com/google/martian/parse"
)

func init() {
	parse.Register("body.Template", FromJSON)
}

func FromJSON(b []byte) (*parse.Result, error) {
	msg, err := modifier.FromJSON(b)
	if err != nil {
		return nil, err
	}

	return parse.NewResult(msg, []parse.ModifierType{parse.Request})
}
