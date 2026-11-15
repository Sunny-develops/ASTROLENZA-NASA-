# ASTROLENZA v19 — Visor Prototype

Open `ASTROLENZA_Visor_v19.html` in a modern desktop or mobile browser. The intended visor file is self-contained, with embedded visual assets and inline JavaScript/CSS; no framework or CDN fetch is required for its runtime.

## Interaction
- **Mission:** crew and environment context with randomized synthetic plain-text messages.
- **Suit:** inspect mapped suit regions and associated measurements.
- **Intelligence:** inspect telemetry, fault hypotheses, uncertainty and supported hazard projections.
- **Attend:** select the crew member, open Suit and focus the implicated region.
- **Escalate:** raise command priority and record escalation.
- **Resolve:** run a mapped simulated recovery action.
- **Close / Terminate:** end the message thread without clearing the active fault.

## Channel status
The visor model uses 13 synthetic direct channels. `TCORE` is inferred. Blood pressure is not a v19 runtime channel; it remains in the broader longitudinal health concept. No live NASA API or hardware sensor is connected.

## Analytical method
The runtime uses bounded model-based inference: Kalman-style estimation, measurement consistency/trust checks, Gaussian fault-signature likelihoods, Bayesian-style hypothesis rankings, conditional pressure/thermal hazard projection and value-of-information ranking. Synthetic posterior percentages are not calibrated field probabilities.

## Safety boundary
Research prototype only; not for medical care, EVA operations or flight control. All messages, samples and recovery actions are simulated.
