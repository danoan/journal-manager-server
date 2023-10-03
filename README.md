# journal-manager-server

This project contains an Alpine image with necessary dependencies to create a
nodejs http-server to serve [journal-manager](https://github.com/danoan/journal-manager) journals.

## Instructions

```bash
docker-compose up -d --build
```

A http-server will start at `localhost:5961`. The project assumes that the journal-manager
journals are stored at `~/Journals`.

