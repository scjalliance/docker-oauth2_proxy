FROM golang

MAINTAINER Dusty Wilson "dusty.wilson@scjalliance.com"

RUN mkdir -p /go/src/github.com/scjalliance/oauth2_proxy
 && git clone -b feature-customfooter https://github.com/scjalliance/oauth2_proxy.git /go/src/github.com/scjalliance/oauth2_proxy

RUN go get -d -v github.com/scjalliance/oauth2_proxy
RUN go install -v github.com/scjalliance/oauth2_proxy

VOLUME /conf

EXPOSE 4180

CMD ["oauth2_proxy", "-config", "/conf/oauth2_proxy.cfg"]
