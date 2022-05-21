#!/bin/sh
set -x

# update deps
go mod tidy

go build -v -a -tags netgo -o release/linux/amd64/drone-docker ./cmd/drone-docker
ls -l release/linux/amd64/drone-docker

# for deps scanning
go list -m all > go.list
ls -l go.list

