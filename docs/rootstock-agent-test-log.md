# Rootstock Agent Test Log

Use this log to validate behavior of the Rootstock Agent in repeatable passes.

## Metadata

- Date:
- Tester:
- Workspace:
- Agent file: .github/agents/Rootstock Agent.agent.md
- Active org (if relevant): team@altoconsultants.ca.ybera.rspilot
- Agent version note (optional):

## Pass/Fail Criteria (Global)

Mark each test against these core criteria where applicable:

- [ ] Uses Rootstock package context only when request is Rootstock-related.
- [ ] Avoids forcing Rootstock context on non-Rootstock requests.
- [ ] Advises against SeeAllData for Rootstock tests.
- [ ] Recommends using one of the two approved Rootstock data factories for Rootstock-touching development.
- [ ] Uses UT trigger options for Rootstock test record creation:
  - rstk__triggeroptions__c = 'UT'
  - rstkf__triggeroptions__c = 'UT'
- [ ] Covers broader ERP domains (manufacturing, purchasing, inventory, controls), not just sales orders.
- [ ] Handles uncovered/financial setup gaps without blocking and requests targeted user guidance.
- [ ] Distinguishes package constraints from custom-code constraints.

## Test Case Template

Copy this block per test if you want full detail.

### TC-XX: <Short Name>

- Prompt:
- Expected behavior:
- Actual behavior:
- Pass/Fail:
- Notes:

---

## Execution Log

| ID | Prompt Summary | Domain | Expected Outcome | Actual Outcome | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| TC-01 |  |  |  |  |  |  |
| TC-02 |  |  |  |  |  |  |
| TC-03 |  |  |  |  |  |  |
| TC-04 |  |  |  |  |  |  |
| TC-05 |  |  |  |  |  |  |
| TC-06 |  |  |  |  |  |  |
| TC-07 |  |  |  |  |  |  |
| TC-08 |  |  |  |  |  |  |
| TC-09 |  |  |  |  |  |  |
| TC-10 |  |  |  |  |  |  |
| TC-11 |  |  |  |  |  |  |
| TC-12 |  |  |  |  |  |  |

## Summary

- Total tests: 12
- Passed:
- Failed:
- Key regressions:
- Suggested agent updates:
