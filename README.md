# React + FastAPI Codespaces Starter

A simple full-stack starter for GitHub Codespaces with:

- React frontend (Vite)
- FastAPI backend
- Dockerfiles for each service
- docker-compose for local/container deployment
- devcontainer config for Codespaces

## Run in GitHub Codespaces

Open the repository in GitHub Codespaces. The devcontainer will:

- start the workspace container
- install frontend and backend dependencies
- forward ports 3000 and 8000

Then start the apps:

```bash
# terminal 1
cd backend
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload

# terminal 2
cd frontend
npm run dev -- --host 0.0.0.0 --port 3000
```

## Run with Docker Compose

```bash
docker compose up --build
```

Frontend: http://localhost:3000
Backend: http://localhost:8000
API docs: http://localhost:8000/docs

## Deploy as containers

Each app has its own Dockerfile, so you can deploy them independently to most container platforms.
