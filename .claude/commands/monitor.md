---
name: monitor
description: Check production health and metrics
description: |
  Query production status, error rates, and key metrics.
  Shows dashboards and alerts.
user-invocable: true
argument-hint: [--live] [--alerts] [--logs] [--metrics]
---

# Monitor Command

Check production health and status.

## Usage

```
/monitor                    # Quick health check
/monitor --live            # Live monitoring (updates every 5s)
/monitor --alerts          # Show active alerts
/monitor --logs            # Recent error logs
/monitor --metrics         # Detailed metrics
```

## Health Checks

### Quick Status
```
🏥 PRODUCTION HEALTH

Services:
  ✅ API          (200ms avg)
  ✅ Database     (5ms avg)
  ✅ Cache        (2ms avg)
  ✅ Worker       (processing)

Metrics (last hour):
  Requests:      45,230
  Error rate:    0.02% ✅
  Response p95:  145ms ✅
  CPU:           42% ✅
  Memory:        58% ✅

Alerts:
  🟢 No active alerts
```

### Live Mode
```
📊 LIVE METRICS (refreshing every 5s)

┌─────────────────────────────────────────────────────┐
│  Requests/sec: 45   │  Error rate: 0.01%  ✅       │
│  Response p95: 132ms │  CPU: 38%          ✅       │
│  Memory: 55%         │  DB connections: 12/20     │
└─────────────────────────────────────────────────────┘

Recent logs:
  14:32:15  INFO  Request completed 200 /api/users
  14:32:14  INFO  Request completed 200 /api/items
  14:32:14  WARN  Slow query detected (850ms)
```

## Metrics Tracked

| Metric | Target | Alert Threshold |
|--------|--------|-----------------|
| Error rate | < 0.1% | > 0.5% |
| Response p95 | < 200ms | > 500ms |
| CPU usage | < 70% | > 85% |
| Memory usage | < 75% | > 90% |
| DB connections | < 80% | > 95% |
| Queue depth | < 100 | > 1000 |

## Commands Used

```bash
# Check service status
kubectl get pods

# Query metrics
curl https://api.datadoghq.com/api/v1/query

# View logs
gcloud logging read "resource.type=cloud_run_revision" --limit=20

# Check errors
sentry-cli issues list --status unresolved
```

## Integration

Works with:
- Datadog
- Prometheus/Grafana
- New Relic
- Sentry
- CloudWatch
- Google Cloud Monitoring
