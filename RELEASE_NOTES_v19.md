# ASTROLENZA v19 — Release notes

**Release date:** 15 November 2026  
**Release type:** research demonstration / standalone HTML prototype

## Highlights

- Standalone visor application without external React/ReactDOM runtime dependencies.
- Mission, Suit and Intelligence views with spatial suit-region inspection.
- Randomized synthetic mission messages with Attend, Escalate, Resolve, Close and Terminate actions.
- Message-thread dismissal is separated from underlying simulated fault clearance.
- Bounded model-based inference pipeline documented: signal estimation, sensor-trust checks, fault-signature ranking, conditional hazard projection and value-of-information ranking.
- Seven-slide HTML briefing and PDF export with presenter notes and NASA references.
- NASA Ames archive terminology corrected to ALSDA; external sources are described as references rather than live feeds.

## Runtime boundaries

- 13 direct synthetic channels; `TCORE` is inferred.
- Blood pressure is not a v19 runtime channel.
- No external NASA API, OSDR, ALSDA, RadLab, DONKI or hardware sensor adapter is connected.
- Posterior scores are not calibrated real-world probabilities.
- Time-to-hazard is conditional and limited to supported pressure and thermal-margin cases; it is not a guaranteed countdown.
- CO₂ contributes to alerts and fault reasoning, but no independent CO₂ time-to-hazard forecast is produced in v19.

## Verification

See [Verification Scope](docs/VERIFICATION_SCOPE.md). Handover checks are browser smoke tests and syntax checks only; they are not formal verification, medical validation, reliability qualification or safety certification.

## Package

The release bundle contains the current visor and presentation, PDF exports, milestone archives, engineering notes, visual evidence, QA renders, documentation and checksum manifest. The full executable and media payload must be committed before this repository is considered a complete v19 publication.
