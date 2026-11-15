# ASTROLENZA — Visor Mission Intelligence

**A visor-first astronaut–suit–environment safety-twin research prototype.**

ASTROLENZA explores how crew physiology, suit life-support telemetry and mission context can be interpreted as one coupled system. The v19 demonstration combines synthetic telemetry, signal estimation, probabilistic fault reasoning, conditional hazard projections and an operator-controlled mission-message lifecycle.

> **Research prototype only.** All v19 telemetry, alerts, fault injections and recovery actions are simulated. ASTROLENZA is not NASA-certified or endorsed, is not medically validated, is not a medical device, and must not be used for clinical care, EVA, flight or operational decisions.

## Publication status

The repository's documentation and engineering framework are now published: product specification, architecture, NASA data provenance and AI-method disclosure, verification boundaries, contribution/security guidance, issue templates and a GitHub Pages workflow.

**The v19 executable and visual release payload (standalone visor HTML, seven-slide presentation, PDF exports, previews and QA imagery) is staged separately and has not yet been committed to this repository.** Until those assets appear in the repository tree, this is a documentation and release-structure publication—not a complete runnable source mirror. Do not enable GitHub Pages yet.

## Project documentation

- [Product and interaction specification](docs/PRODUCT_SPEC.md)
- [System architecture](docs/ARCHITECTURE.md)
- [Data provenance and AI analytical method](docs/DATA_PROVENANCE_AND_AI_METHOD.md)
- [Verification scope and limitations](docs/VERIFICATION_SCOPE.md)
- [Publishing runbook](docs/PUBLISHING.md)
- [v19 release notes](RELEASE_NOTES_v19.md)
- [Contribution guidelines](CONTRIBUTING.md)
- [Security policy](SECURITY.md)
- [Project and asset rights notice](LICENSE-NOTICE.md)

## What v19 currently simulates

The visor model contains 13 direct synthetic channels: suit pressure, oxygen partial pressure, carbon-dioxide partial pressure, coolant flow, pump RPM, skin temperature, coolant temperature differential, heart rate, respiration, SpO₂, battery state, movement load and radiation rate. Core temperature (`TCORE`) is inferred from the thermal/workload model rather than directly sensed.

**Blood pressure is not a v19 runtime channel.** It is part of the broader longitudinal crew-health concept and must not be represented as live or simulated visor telemetry.

No external telemetry is connected. NASA standards, research archives and APIs are references for design context, data discovery and future validation—not live feeds to this application.

## Analytical method

The current runtime uses a bounded, explainable model-based pipeline, not a conversational LLM diagnosing astronauts:

1. Generate noisy synthetic time-series and fault injections.
2. Apply Kalman-style state estimation with innovation and sensor-trust checks.
3. Compare residual patterns against candidate Gaussian fault signatures.
4. Normalize nominal and fault hypotheses into Bayesian-style rankings.
5. Project conditional time-to-threshold for supported pressure and thermal-margin cases.
6. Rank the next-best measurement using value-of-information / entropy-reduction logic.
7. Present evidence and suggested observations for a human operator.

Posterior percentages are rankings over a synthetic candidate model, not calibrated field probabilities. Hazard projections are conditional indicators, not guaranteed countdowns. CO₂ contributes to threshold alerts and fault inference, but v19 does not provide an independent CO₂ time-to-hazard forecast.

## Operator message lifecycle

- **Attend** routes to the affected crew member, opens Suit view and focuses the implicated region.
- **Escalate** raises command priority and records escalation.
- **Resolve** runs a mapped simulated recovery action.
- **Close / Terminate** ends the message thread without automatically clearing the underlying fault.

These actions do not command real suit hardware.

## NASA reference lineage

NASA materials inform requirements mapping and research context. The v19 build does not connect to OSDR, ALSDA, RadLab, DONKI or any NASA telemetry service. The Ames Life Sciences Data Archive is correctly named **ALSDA** and is integrated into NASA's Open Science Data Repository (OSDR). See [Data Provenance & AI Method](docs/DATA_PROVENANCE_AND_AI_METHOD.md).

## Intended release layout

- `01_Submission_Demo/` — final HTML briefing, PDF exports and montage.
- `02_Final_Visor_Prototype/` — standalone v19 visor, usage notes and previews.
- `03_Source_and_Engineering_Notes/` — build specification and preserved v11/v16/v18 milestones.
- `04_Visual_Evidence/` — visor views, slide renders and QA evidence.
- `docs/` — architecture, product specification, provenance, QA and publication guidance.
- `.github/workflows/` — static GitHub Pages publication workflow.

## Local run

Once the v19 HTML payload is committed, the visor requires no build step and can be opened directly in a modern browser. The briefing is also distributed as standalone HTML and PDF.

## Rights and disclaimer

Verify ownership and redistribution rights for photography, suit artwork, logos, fonts and embedded media before publication or reuse. No blanket open-source licence is granted; see [LICENSE-NOTICE.md](LICENSE-NOTICE.md). NASA source references do not imply NASA endorsement. ASTROLENZA is an independent research prototype.
