module github.com/devopsfaith/krakend-ce

replace github.com/devopsfaith/krakend => ../krakend

go 1.12

require (
	github.com/Masterminds/sprig v2.16.0+incompatible
	github.com/PuerkitoBio/goquery v1.4.0 // indirect
	github.com/andybalholm/cascadia v1.0.0 // indirect
	github.com/catalinc/hashcash v0.0.0-20161205220751-e6bc29ff4de9 // indirect
	github.com/clbanning/mxj v1.8.4 // indirect
	github.com/codegangsta/negroni v1.0.0 // indirect
	github.com/coreos/etcd v3.3.13+incompatible // indirect
	github.com/coreos/go-systemd v0.0.0-20181012123002-c6f51f82210d // indirect
	github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f // indirect
	github.com/devopsfaith/bloomfilter v0.0.0-20190317200532-4687d0b9aa2a
	github.com/devopsfaith/flatmap v0.0.0-20200601181759-8521186182fc // indirect
	github.com/devopsfaith/krakend v1.1.2-0.20200930142252-7c9d4ace4128
	github.com/devopsfaith/krakend-amqp v1.1.1-0.20200703170727-f0e7ebe619af
	github.com/devopsfaith/krakend-botdetector v0.0.0-20200729112051-82f1b8f8fdfe
	github.com/devopsfaith/krakend-cel v0.0.0-20200908134208-7162c125376d
	github.com/devopsfaith/krakend-circuitbreaker v0.0.0-20200703180246-3ea7a4c22c3b
	github.com/devopsfaith/krakend-cobra v0.0.0-20200317174411-3518505e8cd2
	github.com/devopsfaith/krakend-consul v0.0.0-20190130102841-7623a4da32a1
	github.com/devopsfaith/krakend-cors v0.0.0-20200615164006-ad82a58ac55d
	github.com/devopsfaith/krakend-etcd v0.0.0-20190425091451-d989a26508d7
	github.com/devopsfaith/krakend-flexibleconfig v0.0.0-20190408143848-fc4ef2b4d5cf
	github.com/devopsfaith/krakend-gelf v0.0.0-20181019222239-59c0250b1c60
	github.com/devopsfaith/krakend-gologging v0.0.0-20190131142345-f3f256584ecc
	github.com/devopsfaith/krakend-httpcache v0.0.0-20181030153148-8474476ff874
	github.com/devopsfaith/krakend-httpsecure v0.0.0-20191009151918-298638962e76
	github.com/devopsfaith/krakend-jose v1.1.1-0.20200927132843-c4142bb4e22c
	github.com/devopsfaith/krakend-jsonschema v0.0.0-20200611142303-11a34c8149c3
	github.com/devopsfaith/krakend-lambda v0.0.0-20201005114349-3d7d5730c1fa
	github.com/devopsfaith/krakend-logstash v0.0.0-20190131142205-17f4745d3502
	github.com/devopsfaith/krakend-lua v1.1.2-0.20200909152058-1b4e6c9afb8f
	github.com/devopsfaith/krakend-martian v0.0.0-20191207191841-92e3287c36d9
	github.com/devopsfaith/krakend-metrics v1.1.0
	github.com/devopsfaith/krakend-oauth2-clientcredentials v1.1.0
	github.com/devopsfaith/krakend-opencensus v1.1.1-0.20200707175954-c3b3652bb365
	github.com/devopsfaith/krakend-pubsub v0.0.0-20200728135630-1781054836a5
	github.com/devopsfaith/krakend-ratelimit v1.1.1-0.20200309135238-076143483904
	github.com/devopsfaith/krakend-rss v0.0.0-20200914123253-f81cced96000
	github.com/devopsfaith/krakend-usage v0.0.0-20181025134340-476779c0a36c
	github.com/devopsfaith/krakend-viper v0.0.0-20200605164302-854fa4ff4a66
	github.com/devopsfaith/krakend-xml v0.0.0-20200824111110-baa61b333b05
	github.com/gin-gonic/gin v1.6.3
	github.com/go-contrib/uuid v1.2.0
	github.com/gogo/protobuf v1.2.0
	github.com/golang/protobuf v1.4.3
	github.com/google/btree v1.0.0 // indirect
	github.com/google/martian v2.1.1-0.20190517191504-25dcb96d9e51+incompatible
	github.com/gorilla/websocket v1.4.0 // indirect
	github.com/gregjones/httpcache v0.0.0-20190611155906-901d90724c79 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.0.0 // indirect
	github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0 // indirect
	github.com/hashicorp/go-msgpack v0.5.3 // indirect
	github.com/hashicorp/go-rootcerts v1.0.0 // indirect
	github.com/hashicorp/go-sockaddr v1.0.1 // indirect
	github.com/hashicorp/go-uuid v1.0.1 // indirect
	github.com/influxdata/influxdb v1.7.4 // indirect
	github.com/influxdata/platform v0.0.0-20190117200541-d500d3cf5589 // indirect
	github.com/jonboulle/clockwork v0.1.0 // indirect
	github.com/kpacha/opencensus-influxdb v0.0.0-20181102202715-663e2683a27c // indirect
	github.com/letgoapp/krakend-consul v0.0.0-20190130102841-7623a4da32a1 // indirect
	github.com/letgoapp/krakend-influx v0.0.0-20190214142340-d2fc9466bb3a
	github.com/mmcdole/gofeed v1.0.0-beta2 // indirect
	github.com/mmcdole/goxpp v0.0.0-20170720115402-77e4a51a73ed // indirect
	github.com/op/go-logging v0.0.0-20160315200505-970db520ece7 // indirect
	github.com/pelletier/go-toml v1.3.0 // indirect
	github.com/sirupsen/logrus v1.3.0 // indirect
	github.com/soheilhy/cmux v0.1.4 // indirect
	github.com/spf13/afero v1.2.2 // indirect
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/viper v1.3.2 // indirect
	github.com/tmc/grpc-websocket-proxy v0.0.0-20190109142713-0ad062ec5ee5 // indirect
	github.com/tmthrgd/atomics v0.0.0-20180217065130-6910de195248 // indirect
	github.com/tmthrgd/go-bitset v0.0.0-20180106085139-4d1be735fbfb // indirect
	github.com/tmthrgd/go-bitwise v0.0.0-20170218093117-01bef038b6bd // indirect
	github.com/tmthrgd/go-byte-test v0.0.0-20170223110042-2eb5216b83f7 // indirect
	github.com/tmthrgd/go-hex v0.0.0-20180828131331-d1fb3dbb16a1 // indirect
	github.com/tmthrgd/go-memset v0.0.0-20180828131805-6f4e59bf1e1d // indirect
	github.com/tmthrgd/go-popcount v0.0.0-20180111143836-3918361d3e97 // indirect
	github.com/unrolled/secure v0.0.0-20171102162350-0f73fc7feba6 // indirect
	github.com/xeipuuv/gojsonschema v1.2.1-0.20200424115421-065759f9c3d7 // indirect
	github.com/xiang90/probing v0.0.0-20190116061207-43a291ad63a2 // indirect
	google.golang.org/protobuf v1.25.0
	gopkg.in/Graylog2/go-gelf.v2 v2.0.0-20180326133423-4dbb9d721348 // indirect
)
