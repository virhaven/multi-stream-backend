# multi-stream-backend

Go HTTP server for the multi-stream project.

## Development

Start the server with live reload:

```bash
go tool air
```

Air rebuilds and restarts the server when Go files change. The dev port is set in `.air.toml`:

```toml
full_bin = "PORT=8085 ./tmp/main"
```

Change `8085` there to use a different port in dev.

## Running without Air

```bash
go run .
```

Defaults to port `8085`. Override with the `PORT` environment variable:

```bash
PORT=9000 go run .
```

Or build and run the binary:

```bash
go build -o ./tmp/main .
PORT=9000 ./tmp/main
```

## Configuration

| Variable | Default | Description        |
| -------- | ------- | ------------------ |
| `PORT`   | `8085`  | HTTP listen port   |

## Endpoints

| Method | Path      | Description          |
| ------ | --------- | -------------------- |
| GET    | `/health` | Health check (JSON)  |

Example:

```bash
curl http://localhost:8085/health
```

# Production build

```bash
docker compose -f compose.prod.yaml up --build
```
