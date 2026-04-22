---
name: docker-manager
description: Manage Docker containers, images, and deployments
description: |
  Build, run, and deploy Docker containers.
  Production-ready container management.
user-invocable: true
argument-hint: [action] [container/image]
---

# Docker Manager Skill

Production Docker container management.

## Actions

### Build
```python
Skill(skill="docker-manager", args="{\"action\": \"build\", \"tag\": \"myapp:v1.2.3\"}")

# Optimized multi-stage build
DOCKER_BUILDKIT=1 docker build \
  --target production \
  --tag myapp:v1.2.3 \
  --build-arg VERSION=1.2.3 \
  .
```

### Run
```python
Skill(skill="docker-manager", args="{\"action\": \"run\", \"container\": \"myapp\"}")

# Production run
docker run -d \
  --name myapp \
  --restart unless-stopped \
  --memory 512m \
  --memory-swap 512m \
  --cpus 1.0 \
  --health-cmd "curl -f http://localhost:8080/health" \
  --health-interval 30s \
  --env-file .env \
  -p 8080:8080 \
  myapp:v1.2.3
```

### Deploy
```python
Skill(skill="docker-manager", args="{\"action\": \"deploy\", \"registry\": \"gcr.io/project/myapp\"}")

# Push to registry
docker tag myapp:v1.2.3 gcr.io/project/myapp:v1.2.3
docker push gcr.io/project/myapp:v1.2.3
```

## Production Dockerfile Template

```dockerfile
# Stage 1: Build
FROM python:3.11-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

# Stage 2: Production
FROM python:3.11-slim AS production

# Security: Run as non-root
RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /app

# Copy dependencies from builder
COPY --from=builder /root/.local /home/appuser/.local
ENV PATH=/home/appuser/.local/bin:$PATH

# Copy application
COPY --chown=appuser:appuser src/ ./src/

# Security: Switch to non-root
USER appuser

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

EXPOSE 8080

# Use exec form for proper signal handling
CMD ["python", "-m", "src.main"]
```

## Security Best Practices

1. **Non-root user** - Never run as root
2. **Minimal base image** - Use slim/alpine
3. **No secrets** - Use env vars, not build args
4. **Health checks** - Always define
5. **Read-only filesystem** - Where possible
6. **Scan images** - Trivy/Clair before deploy

## Commands

```bash
# Build with cache
DOCKER_BUILDKIT=1 docker build -t app:latest .

# Scan image
trivy image app:latest

# Push to registry
docker push registry/app:tag

# Check running containers
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

# View logs
docker logs -f container_name

# Update container (zero downtime)
docker-compose up -d --no-deps --build service_name
```

## Output

```yaml
docker:
  image: "myapp:v1.2.3"
  size: "124MB"
  layers: 12
  
security_scan:
  tool: "trivy"
  vulnerabilities:
    critical: 0
    high: 1
    medium: 3
  status: "pass"
  
container:
  name: "myapp-prod"
  status: "running"
  health: "healthy"
  uptime: "3d 4h"
  memory: "256MB / 512MB"
  cpu: "23%"
  
deployment:
  registry: "gcr.io/project/myapp:v1.2.3"
  pushed: true
  digest: "sha256:abc123..."
```
