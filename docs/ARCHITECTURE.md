# Architecture overview

## Conceptual pipeline

```text
Synthetic sensor and mission signals
                |
                v
      Signal quality / noise model
                |
                v
     State estimation and residuals
      (Kalman-style per channel)
                |
                v
     Fault signature comparison
                |
                v
   Bayesian-style hypothesis ranking
                |
                v
 Conditional hazard projection / VOI
                |
                v
     Human operator presentation
                |
                v
 Attend / Escalate / Resolve / Close / Terminate
```

## Three operator views

- **Mission:** crew and environment context with synthetic telemetry and randomized mission messages.
- **Suit:** spatial inspection of suit regions and associated synthetic measurements.
- **Intelligence:** supporting evidence, competing fault hypotheses, uncertainty, supported hazard projections and next-best observations.

## Evidence and state boundaries

Thirteen direct synthetic channels are generated in v19. `TCORE` is inferred. Blood pressure is outside the v19 runtime. No hardware sensor, external API or NASA data adapter is active.

## Operator controls

Attend routes to the affected crew member and suit region; Escalate raises command priority; Resolve invokes a mapped simulated recovery; Close and Terminate end the message thread without clearing the underlying fault. All actions are demonstration controls, not commands to external systems.

See [Data Provenance & AI Method](DATA_PROVENANCE_AND_AI_METHOD.md) and [Verification Scope](VERIFICATION_SCOPE.md).
