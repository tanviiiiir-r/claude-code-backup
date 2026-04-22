---
name: deploy
description: Deploy to staging or production with safety checks
description: |
  Handles full deployment pipeline with testing, security scans,
  and automatic rollback on failure.
user-invocable: true
argument-hint: [environment] [--strategy=canary|blue-green|rolling]
---

# Deploy Command

Safe deployment to staging or production.

## Usage

```
/deploy staging                    # Deploy to staging
/deploy production                 # Deploy to production
/deploy production --strategy=canary  # Canary deployment
/deploy --dry-run                  # Preview changes
```

## Deployment Pipeline

### 1. Pre-Deployment Checks
- [ ] Git working directory clean
- [ ] Tests passing
- [ ] Security scan clean
- [ ] Database migrations reviewed
- [ ] Previous deployment healthy

### 2. Build
- [ ] Build Docker image
- [ ] Tag with version
- [ ] Push to registry
- [ ] Security scan image

### 3. Deploy to Staging
- [ ] Deploy to staging environment
- [ ] Run smoke tests
- [ ] Verify health checks
- [ ] Run integration tests

### 4. Deploy to Production
- [ ] Deploy to production (canary/rolling/blue-green)
- [ ] Monitor error rates
- [ ] Verify health endpoints
- [ ] Check key metrics

### 5. Post-Deployment
- [ ] Monitor for 30 minutes
- [ ] Compare metrics to baseline
- [ ] Notify team
- [ ] Update deployment log

## Deployment Strategies

### Canary (Default for Production)
```
Deploy to 5% → Monitor (5 min) → 25% → Monitor → 50% → Monitor → 100%
```

### Blue-Green
```
Build green environment → Test → Switch traffic → Monitor
```

### Rolling
```
Instance 1 → Verify → Instance 2 → Verify → ...
```

## Safety Features

- **Auto-rollback** on health check failure
- **Canary deployment** to limit blast radius
- **DB backup** before migrations
- **Feature flags** for gradual rollout
- **Circuit breaker** for downstream failures

## Output

```
🚀 DEPLOYMENT STARTED
   Environment: production
   Version: v1.2.4
   Strategy: canary

📋 PRE-DEPLOYMENT CHECKS
   ✅ Working directory clean
   ✅ Tests passing (142/142)
   ✅ Security scan clean
   ✅ Migrations reviewed
   ✅ Previous deployment healthy

🔨 BUILD
   ✅ Docker image built (2m 15s)
   ✅ Pushed to registry
   ✅ Tagged v1.2.4

🧪 STAGING DEPLOYMENT
   ✅ Deployed to staging
   ✅ Smoke tests passed
   ✅ Health checks OK
   ✅ Integration tests passed

🚀 PRODUCTION DEPLOYMENT
   ✅ Canary 5% deployed
   ✅ Error rate: 0.01% (baseline: 0.01%)
   ✅ Response time: 120ms (baseline: 125ms)
   ✅ Promoted to 25%
   ✅ Promoted to 50%
   ✅ Promoted to 100%

✅ DEPLOYMENT SUCCESSFUL
   Duration: 8m 42s
   URL: https://app.example.com
   Health: https://app.example.com/health

📊 POST-DEPLOYMENT MONITORING (30 min)
   Error rate: 0.01% ✅
   Response time p95: 118ms ✅
   CPU usage: 45% ✅
   Memory usage: 60% ✅
```

## Rollback

If issues detected:
```
⚠️ ANOMALY DETECTED
   Error rate: 5.2% (threshold: 1%)
   
🔄 INITIATING ROLLBACK
   Previous version: v1.2.3
   Rolling back...
   
✅ ROLLBACK COMPLETE
   Restored to v1.2.3
   All metrics normal
```

## Configuration

Create `.claude/deploy.yml`:
```yaml
environments:
  staging:
    url: https://staging.example.com
    strategy: rolling
    auto_rollback: true
    
  production:
    url: https://app.example.com
    strategy: canary
    canary_percentages: [5, 25, 50, 100]
    canary_wait_minutes: 5
    auto_rollback: true
    
deployment:
  build_command: "docker build -t app:$VERSION ."
  test_command: "pytest tests/"
  smoke_test: "curl https://$ENV.example.com/health"
  health_check: "curl -f https://$ENV.example.com/health"
  
rollback:
  command: "kubectl rollout undo deployment/app"
  metrics:
    error_rate_threshold: 1.0
    response_time_threshold: 200
```
