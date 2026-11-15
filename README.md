# ASTROLENZA — Visor Mission Intelligence

**A visor-first astronaut–suit–environment safety-twin research prototype.**

ASTROLENZA explores how crew physiology, suit life-support telemetry and mission context can be interpreted as one coupled system. The v19 demonstration combines synthetic telemetry, signal estimation, probabilistic fault reasoning, conditional hazard projections and an operator-controlled message lifecycle.

> **Research prototype only.** All v19 telemetry, alerts, fault injections and recovery actions are simulated. ASTROLENZA is not NASA-certified or endorsed, is not medically validated, and must not be used for clinical care, EVA, flight or operational decisions.

## Explore
- [Standalone visor](02_Final_Visor_Prototype/ASTROLENZA_Visor_v19.html)
- [Seven-slide HTML briefing](01_Submission_Demo/ASTROLENZA_Mission_Intelligence_Briefing_v19.html)
- [Briefing PDF](01_Submission_Demo/ASTROLENZA_Mission_Intelligence_Briefing_v19.pdf)
- [Data provenance and AI method](docs/DATA_PROVENANCE_AND_AI_METHOD.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Verification scope](docs/VERIFICATION_SCOPE.md)

## What v19 simulates
The visor models 13 direct synthetic channels: suit pressure, oxygen partial pressure, carbon-dioxide partial pressure, coolant flow, pump RPM, skin temperature, coolant temperature differential, heart rate, respiration, SpO₂, battery state, movement load and radiation rate. Core temperature is inferred rather than directly sensed. **Blood pressure is not a v19 runtime channel.**

No external telemetry is connected. NASA standards and research archives are references for design context and future validation, not live feeds.

## Analytical pipeline
1. Synthetic noisy time-series and fault injection.
2. Kalman-style state estimation and sensor-trust checks.
3. Candidate fault-signature comparison.
4. Bayesian-style hypothesis rankings.
5. Conditional time-to-threshold projections for supported pressure and thermal-margin cases.
6. Value-of-information ranking for the next measurement.
7. Human-operator review and action.

Scores are not calibrated real-world probabilities. Hazard projections are conditional indicators, not guaranteed countdowns. The runtime is a bounded model-based inference pipeline, not a conversational LLM. CO₂ contributes to alerts and fault inference; v19 does not independently forecast CO₂ time-to-hazard.

## Message lifecycle
Attend routes to the affected crew member and suit region; Escalate raises command priority; Resolve performs a mapped simulated recovery; Close and Terminate end the message thread without clearing the underlying fault. None of these actions controls real hardware.

## Repository structure
- `01_Submission_Demo/` — briefing, PDF exports and montage
- `02_Final_Visor_Prototype/` — standalone visor and previews
- `03_Source_and_Engineering_Notes/` — build specification and preserved milestones
- `04_Visual_Evidence/` — visor views, slide renders and QA evidence
- `docs/` — architecture, provenance, QA and publication guidance

See [RELEASE_NOTES_v19.md](RELEASE_NOTES_v19.md), [CONTRIBUTING.md](CONTRIBUTING.md), [SECURITY.md](SECURITY.md) and [LICENSE-NOTICE.md](LICENSE-NOTICE.md). Confirm redistribution rights for all embedded media before reuse. No blanket open-source licence is granted. ASTROLENZA is independent and not affiliated with NASA.
