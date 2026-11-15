# ASTROLENZA v19 — Verification scope

## Local browser smoke tests recorded in handover

The QA report records testing with Chromium 144:

- Visor mounted at 1600×900 with no browser JavaScript exceptions.
- No external React or ReactDOM runtime dependency remained in the visor.
- Mobile visor rendered at 390×844 with no horizontal overflow.
- Randomized synthetic mission messages appeared during a timed browser run.
- Manual fault injection created a mission message.
- Escalate changed the message to command priority.
- Attend selected the affected crew member and opened Suit view with the associated region focused.
- Attend → Resolve completed the mapped simulated recovery.
- Close and Terminate removed the message thread without browser errors; source inspection confirmed neither invokes fault resolution or mutates the simulated Engine fault record.
- Seven-slide briefing loaded; next-slide navigation and presenter-notes toggle were exercised.
- Seven-page 16:9 PDF export was inspected.
- HTML briefing rendered at 390×844 without horizontal overflow.
- `node --check` passed for extracted visor JavaScript.

## Important limitations

These are local smoke tests, not formal verification, medical validation, reliability qualification, human-factors certification or safety certification. Crew, suit, environmental telemetry and mission events are synthetic. Blood pressure is not a v19 runtime channel. No live NASA API, OSDR, ALSDA, RadLab, DONKI or hardware adapter is connected. Fault ranking and hazard projections are not calibrated for medical or operational use.

The time-to-hazard projection is conditional and currently limited to supported pressure and thermal-margin cases. CO₂ informs threshold alerts and fault reasoning but has no independent countdown model.

For a reproducible release, rerun the complete manual and automated checks against the exact commit being published and attach the results to the release.
