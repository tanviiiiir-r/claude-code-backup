# Deployment Runbook

**One-Person Dev Team - Production Deployment**

---

## Pre-Deployment Checklist

- [ ] All tests passing (`/test --all`)
- [ ] Security scan clean (`/security-scan`)
- [ ] Database migrations reviewed
- [ ] Rollback plan ready
- [ ] Monitoring confirmed
- [ ] No uncommitted changes
- [ ] Backup completed (if DB changes)

---

## Standard Deployment

### 1. Deploy to Staging
```bash
/deploy staging
```

### 2. Verify Staging
```bash
/monitor --live
# Wait 5 minutes, verify:
# - Error rate < 0.1%
# - Response time < 200ms
# - All health checks pass
```

### 3. Deploy to Production
```bash
/deploy production --strategy=canary
```

### 4. Monitor Production
```bash
/monitor --live
# Watch for 30 minutes:
# - Error rates
# - Response times
# - Resource usage
```

---

## Emergency Deployment (Hotfix)

**Use only for critical production issues**

1. **Create hotfix branch**
   ```bash
   git checkout -b hotfix/critical-fix
   ```

2. **Make minimal fix**
   - Only the fix, no refactoring
   - Add tests if possible

3. **Fast-track deployment**
   ```bash
   /deploy production --strategy=rolling
   ```

4. **Monitor closely**
   ```bash
   /monitor --live
   ```

---

## Rollback Procedures

### Automatic Rollback (Failsafe)
Deploy agent auto-rolls back if:
- Error rate > 1%
- Health checks fail for 60 seconds
- Response time > 500ms for 5 minutes

### Manual Rollback
```bash
# Check current version
kubectl get deployment app -o jsonpath='{.spec.template.spec.containers[0].image}'

# Rollback
deploy-agent rollback production
# or
kubectl rollout undo deployment/app

# Verify rollback
/monitor
```

### Database Rollback
**WARNING: Data loss possible**
```bash
# Restore from backup
pg_restore backup_20260422_143000.sql

# Or run down migration
alembic downgrade -1
```

---

## Troubleshooting

### Deployment Fails
1. Check logs: `kubectl logs deployment/app --tail=100`
2. Check events: `kubectl get events --sort-by='.lastTimestamp'`
3. Verify config: `kubectl describe deployment/app`

### Health Checks Fail
1. Check container: `docker ps -a`
2. View logs: `docker logs container_id`
3. Shell in: `docker exec -it container_id sh`
4. Test endpoint: `curl http://localhost:8080/health`

### Database Migration Fails
1. **Don't panic** - Transaction should rollback
2. Check migration: `alembic current`
3. View logs: Application + Database
4. Fix migration, test locally
5. Re-deploy

---

## Post-Deployment

### Verification
- [ ] Smoke tests pass
- [ ] Error rate normal
- [ ] Response times normal
- [ ] Key user flows work
- [ ] Monitoring active

### Communication
- Update deployment log
- Notify stakeholders (if needed)
- Update status page (if public incident)

---

## Deployment Log Template

```markdown
## Deployment YYYY-MM-DD HH:MM

**Version:** vX.Y.Z
**Environment:** production
**Deployer:** (your name)
**Strategy:** canary/blue-green/rolling

### Changes
- Feature A
- Bugfix B

### Pre-Deployment
- [ ] Tests pass
- [ ] Security scan clean
- [ ] Staging verified

### Results
- Status: success/rollback
- Duration: Xm Ys
- Issues: none/see below

### Notes
Any issues, observations, follow-ups
```
