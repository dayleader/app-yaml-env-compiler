FROM golang:1.13

# Set the current working directory inside the container.
WORKDIR /go/src/app

# copy go.mod <optimization>
COPY go.mod .

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed.
RUN /usr/go/bin/go mod download

# Copy the source from the current directory to the Working Directory inside the container.
COPY . .

# Build the Go app.
RUN /usr/go/bin/go build cmd/main.go