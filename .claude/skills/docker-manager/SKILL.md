---
name: docker-manager
user-invocable: true
---

Docker operations.

Build:
  DOCKER_BUILDKIT=1 docker build -t app:$VERSION .

Run (production):
  docker run -d --name app --restart unless-stopped \
    --memory 512m --cpus 1.0 \
    --health-cmd "curl -f http://localhost:8080/health" \
    -p 8080:8080 app:$VERSION

Security:
  - Non-root user
  - Multi-stage builds
  - Scan: trivy image app:$VERSION
  - No secrets in image