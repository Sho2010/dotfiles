#!/bin/bash

go install github.com/golang/lint/golint@latest
go install github.com/rakyll/gotest@latest
go install github.com/rogpeppe/godef@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/guru@latest
go install golang.org/x/tools/gopls@latest
