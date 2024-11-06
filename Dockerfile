FROM golang:1.23

WORKDIR /app

COPY . .
RUN go mod download && go mod verify
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel-app

CMD ["/parcel-app"]

# docker build -t zukhra/parcel-app-repo:v1 .