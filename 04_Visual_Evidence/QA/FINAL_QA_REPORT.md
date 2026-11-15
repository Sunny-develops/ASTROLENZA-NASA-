# ASTROLENZA v19 — Final build QA

## Browser verification recorded in handover

The handover QA report records Chromium 144 checks:

- Visor mounted at 1600×900 with zero browser JavaScript exceptions.
- No external React or ReactDOM script dependency remained in the visor.
- Mobile visor rendered at 390×844 with no horizontal overflow.
- Randomized synthetic mission message appeared during a timed browser run.
- Manual fault injection created a mission message.
- Escalate changed the message card to command-priority state.
- Attend selected the affected crew member and opened Suit with the associated region focused.
- Attend → Resolve completed the mapped simulated recovery.
- Close and Terminate removed the thread without browser errors; handler inspection confirmed neither invokes fault resolution or mutates the simulated Engine fault record.
- Seven-slide briefing loaded; slide navigation and presenter-notes toggle were exercised.
- Seven-page 16:9 PDF export was inspected.
- HTML briefing rendered at 390×844 without horizontal overflow.
- `node --check` passed for extracted visor JavaScript.

## Scope boundaries

These are local browser smoke tests, not formal verification, medical validation, reliability qualification or safety certification. All data and events are synthetic. Blood pressure is not a v19 runtime channel. No live NASA APIs, OSDR, ALSDA, RadLab, DONKI or hardware adapter is connected. Posterior scores and hazard projections are not medically or operationally calibrated. Time-to-hazard is conditional and currently limited to supported pressure and thermal-margin cases; CO₂ informs alerts and fault reasoning but has no independent countdown model.

This report records the prior handover's QA results. Re-run the checks against the exact Git commit after the executable files are published.
