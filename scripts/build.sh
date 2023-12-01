#!/bin/bash

set -e

echo "Building the Go application..."

go build -o my-gin-app main.go

echo "Build completed successfully."
