FROM golang:1.15-alpine as build

WORKDIR /go/src

COPY ./go .
RUN go build  -ldflags "-w" /go/src/main.go

FROM scratch
WORKDIR /app
COPY --from=build /go/src/main .
CMD ["./main"]