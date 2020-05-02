FROM golang:1.14.2-alpine AS builder

# Set necessary environmet variables needed for our image
ENV GO111MODULE on
ENV CGO_ENABLED 0
ENV GOOS linux
ENV GOARCH amd64

# Add args
ARG PROJ_ENV=production
ENV PROJ_ENV ${PROJ_ENV}
ARG PORT=3000
ENV PORT ${PORT}

# Move to working directory /build
WORKDIR /build

# Copy and download dependency using go mod
COPY src/go.mod .
COPY src/go.sum .

RUN go mod download

# Copy the code into the container
COPY src/main.go .

# Build the application
RUN go build -o main .

# Move to /dist directory as the place for resulting binary folder
WORKDIR /dist

# Copy binary from build to main folder
RUN cp /build/main .

# Build a small image
FROM scratch

COPY --from=builder /dist/main /

# Command to run
ENTRYPOINT ["/main"]