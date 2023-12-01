# Start from the official Golang base image
FROM golang:latest AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum to download dependencies
COPY go.mod go.sum ./

# Download and install Go module dependencies
RUN go mod download

# Copy the entire project to the working directory
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o my-gin-app .

# Start from a smaller base image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the binary from the builder image
COPY --from=builder /app/my-gin-app .

# Expose the port that the application will run on
EXPOSE 8080

# Command to run the executable
CMD ["./my-gin-app"]
