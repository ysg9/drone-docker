#!/bin/sh
set -x

# to fix CVE-2019-11840
go get golang.org/x/crypto

go mod tidy
go build -v -a -tags netgo -trimpath -o release/linux/amd64/drone-docker ./cmd/drone-docker
ls -l release/linux/amd64/drone-docker

# for deps scanning
go list -m all > go.list
ls -l go.list

