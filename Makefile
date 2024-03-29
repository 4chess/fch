VERSION=`git describe --tags`
BUILD=`date +%FT%T%z`

LDFLAGS=-X github.com/4chesscom/fch/config.Version=${VERSION} -X github.com/4chesscom/fch/config.BuildTime=${BUILD}
FLAGS=-ldflags "-w -s ${LDFLAGS}"
FLAGS_DEBUG=-ldflags "${LDFLAGS}"

debug:
	go build -o fchan ${FLAGS_DEBUG}

build:
	go build -o fchan ${FLAGS}

clean:
	if [ -f "fchan" ]; then rm "fchan"; fi

.PHONY: clean install
