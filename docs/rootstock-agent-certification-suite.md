# Rootstock Agent Certification Suite (12 Prompts)

This suite validates the Rootstock Agent against expected behavior in your repo.

How to run:

1. Set active chat agent to Rootstock Agent.
2. Run prompts exactly as written.
3. Record outcomes in docs/rootstock-agent-test-log.md.

## Prompt 1: Manufacturing Setup Guidance

Prompt:

Help me build test setup for rstk__wocst__c, rstk__woorddmd__c, and rstk__woorddmdcst__c in a unit test.

Expected:

- Provides manufacturing-focused setup order.
- Uses Rootstock context correctly.
- Advises UT triggeroptions for Rootstock records.
- Advises against SeeAllData.

## Prompt 2: Purchasing Flow Troubleshooting

Prompt:

I am getting insert failures on rstk__pohdr__c and rstk__poline__c. What control records should I verify first?

Expected:

- Mentions rstk__pocntl__c and related controls/config.
- Gives practical diagnostic steps before random field guessing.
- Stays package-centric.

## Prompt 3: Inventory State Diagnostics

Prompt:

Show me how to validate inventory state across rstk__iclocitem__c, rstk__icitemlot__c, and rstk__icitemsrl__c for one item.

Expected:

- Treats location/lot/serial as complementary views.
- Proposes concrete checks and sequencing.
- Does not collapse into sales-order-only guidance.

## Prompt 4: Control Record Inspection

Prompt:

For division-level behavior differences, which records should I inspect between rstk__sydefault__c, rstk__syconfig__c, rstk__socntl__c, rstk__pocntl__c, rstk__csacctcntl__c, and rstk__syordnumassign__c?

Expected:

- Provides a prioritized inspection order.
- Explains what each control area influences.
- Recommends checking org settings/actual records rather than assumptions.

## Prompt 5: Financial Gap Handling

Prompt:

I need AP and AR behavior tests, but our factories do not seed financials. How should I proceed?

Expected:

- Does not block.
- Acknowledges factory financial gap.
- Requests targeted guidance and proposes minimal safe next steps.

## Prompt 6: Data Factory Source Policy

Prompt:

What data factory should I use for Rootstock test setup and where do I get it?

Expected:

- Points to preferred private repo first.
- Mentions legacy public fallback.
- Encourages following usage instructions after importing.

## Prompt 7: UT Triggeroptions Enforcement

Prompt:

Generate a minimal Rootstock test data snippet for rstk__icitem__c and rstk__soprod__c.

Expected:

- Uses UT triggeroptions correctly for Rootstock records.
- Avoids SeeAllData.
- Notes dependencies instead of producing invalid standalone inserts.

## Prompt 8: Non-Rootstock Request Boundary

Prompt:

Help me optimize a trigger on a custom object that has no Rootstock dependencies.

Expected:

- Does not force Rootstock context.
- Gives normal Apex guidance.
- Maintains boundary behavior.

## Prompt 9: Mixed Scope Request

Prompt:

I need to tune both a custom order orchestration class and Rootstock SOAPI integration error handling in the same task.

Expected:

- Separates custom-code advice from Rootstock package constraints.
- Applies Rootstock rules only to Rootstock-dependent parts.

## Prompt 10: Metadata Discovery Path

Prompt:

How should I discover what Rootstock control fields do in this org before changing code?

Expected:

- Suggests querying live org records and metadata definitions.
- Includes CLI describe fallback when metadata SOQL path is unsupported.
- Recommends relying on field labels/help text where available.

## Prompt 11: Sales Order Duplicate Prevention

Prompt:

Design a safe duplicate-prevention approach for sohdr and soline creation when external order and line IDs may replay.

Expected:

- Proposes deterministic duplicate checks.
- Mentions header-level and line-level keying strategy.
- Avoids brittle assumptions.

## Prompt 12: Escalation Behavior For Ambiguity

Prompt:

I have a Rootstock DML failure with unclear error semantics and no reproducible test yet. What should you do next?

Expected:

- Uses small-scope diagnostics.
- Avoids broad rewrites.
- Asks user how to proceed when ambiguity remains.

## Certification Threshold

Suggested threshold:

- Pass at least 10/12 overall, and
- Must-pass prompts: 2, 5, 7, 8, 10.

If any must-pass prompt fails, treat the run as not certified and update the agent instructions before retesting.
