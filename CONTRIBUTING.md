# Contributing

Thank you for helping improve ASTROLENZA. The current release is a research prototype; changes should improve traceability, usability, reproducibility and technical honesty without overstating operational readiness.

## Before opening a change

- Open an issue describing the problem, rationale and affected view or subsystem.
- Keep changes focused and preserve the visor-first product direction.
- Use synthetic fixtures; do not introduce live medical, crew or mission data without an approved data agreement and handling plan.
- Preserve the distinction between measured/simulated channels and inferred states (for example, `TCORE`). Do not imply blood pressure is a v19 runtime channel.
- Update provenance, model boundaries, screenshots and changelog entries when behavior or sources change.

## Local checks

- Open the standalone visor HTML in a modern Chromium-based browser.
- Exercise Mission, Suit and Intelligence navigation.
- Exercise Attend, Escalate, Resolve, Close and Terminate; confirm Close/Terminate do not silently clear an active fault.
- Check desktop and narrow mobile layout (390 px wide reference).
- Run a JavaScript syntax check on extracted inline scripts after source changes.
- Open the HTML briefing, navigate all seven slides, test speaker notes and compare the PDF export.
- Regenerate `MANIFEST.sha256` after changing packaged files.

## Pull requests

Include intent, files changed, tests performed, screenshots for material UI changes, and any changed data-source claims. Separate demonstrated functionality from planned functionality. Never add secrets, credentials, actual astronaut health records or unapproved telemetry.
