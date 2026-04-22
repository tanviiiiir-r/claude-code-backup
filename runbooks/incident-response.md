# Incident Response Runbook

**One-Person Dev Team - Production Incident Response**

---

## Severity Levels

### SEV-1: Critical
- Service completely down
- Data loss or corruption
- Security breach
- **Response:** Immediate, drop everything

### SEV-2: Major
- Major feature broken
- Significant performance degradation
- Workaround exists but painful
- **Response:** Within 1 hour

### SEV-3: Minor
- Non-critical bug
- Edge case issue
- Cosmetic problem
- **Response:** During business hours

---

## Incident Response Process

### 1. Detect
```bash
# Get alerted by:
/monitor --alerts

# Or notice:
- Error rate spike
- User complaints
- Monitoring alerts
- Failed health checks
```

### 2. Assess
```bash
# Check system status
/monitor

# View recent errors
/logs --errors --last=30m

# Identify scope:
# - Which services affected?
# - How many users?
# - What functionality?
```

### 3. Mitigate (STOP THE BLEEDING)

**If rollback available:**
```bash
/deploy rollback production
```

**If need to scale:**
```bash
kubectl scale deployment app --replicas=5
```

**If need to disable feature:**
```bash
# Use feature flags
curl -X POST /admin/features/broken-feature/disable
```

### 4. Fix
- Root cause analysis
- Implement fix
- Test fix
- Deploy fix

### 5. Monitor
```bash
/monitor --live
# Watch metrics for 30+ minutes
```

### 6. Document
- Create incident report
- Update runbooks
- Schedule post-mortem (if SEV-1/2)

---

## Common Scenarios

### Database Connection Pool Exhausted
**Symptoms:** Error rate spike, slow responses  
**Diagnosis:**
```bash
/logs --pattern="connection pool"
```
**Mitigation:**
```bash
# Increase pool size temporarily
kubectl set env deployment/app DB_POOL_SIZE=50
```
**Fix:**
- Add connection pool monitoring
- Implement query timeout
- Add circuit breaker

### Memory Leak
**Symptoms:** Gradual memory increase, OOM kills  
**Diagnosis:**
```bashn/monitor --metrics
```
**Mitigation:**
```bashn# Restart container
kubectl rollout restart deployment/app
```
**Fix:**
- Profile memory usage
- Fix leak
- Add memory limits

### DDoS Attack
**Symptoms:** Traffic spike, resource exhaustion  
**Diagnosis:**
```bashn# Check logs for patterns
/logs --pattern="429\|403"
```
**Mitigation:**
```bashn# Enable rate limiting
# Enable WAF rules
# Scale up
kubectl scale deployment app --replicas=10
```
**Fix:**
- Implement rate limiting
- Add DDoS protection
- Set up alerts

### Dependency Failure
**Symptoms:** Errors calling external service  
**Diagnosis:**
```bashn/logs --service=external-api
```
**Mitigation:**
```bashn# Enable circuit breaker
# Fall back to cached data
# Queue requests for later
```
**Fix:**
- Add retry logic
- Implement circuit breaker
- Cache critical data

---

## Incident Report Template

```markdown
# Incident Report: [Title]

**Severity:** SEV-1/2/3  
**Duration:** HH:MM - HH:MM  
**Impact:** X% of users, Y feature affected

## Summary
One sentence description

## Timeline
- HH:MM - Issue detected
- HH:MM - Mitigation applied
- HH:MM - Root cause identified
- HH:MM - Fix deployed
- HH:MM - Resolved

## Root Cause
Detailed explanation

## Impact
- Users affected:
- Features broken:
- Data loss:

## Resolution
What fixed it

## Lessons Learned
What to improve

## Action Items
- [ ] Fix X
- [ ] Add monitoring for Y
- [ ] Update runbook
```

---

## Emergency Contacts

| Service | Contact | When to Use |
|---------|---------|-------------|
| Cloud provider | Support portal | Infrastructure issues |
| Database | On-call | DB failures |
| Domain registrar | Support | DNS issues |

---

## Recovery Priorities

1. **User safety** - Protect user data
2. **Service availability** - Get it running
3. **Data integrity** - Ensure no corruption
4. **Feature completeness** - All features working
5. **Performance** - Back to normal speed
