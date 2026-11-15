# ASTROLENZA — Product and interaction specification

## Product intent

ASTROLENZA is a visor-first mission-intelligence prototype that frames crew physiology, suit life-support telemetry and mission context as a coupled astronaut–suit–environment system. The operator should be able to move from a plain-language fault message to the affected crew member, suit region, supporting measurements and bounded diagnostic reasoning without losing mission context.

## Information architecture

### Mission

The primary visor surface presents crew/mission context, key telemetry, suit visual context and short plain-text notifications. Notifications should be legible, non-modal and actionable without obscuring the operator's primary view.

### Suit

The suit surface supports spatial inspection of suit regions and the measurements or synthetic faults associated with each region. Attending a message should route to this view and focus the affected region.

### Intelligence

The intelligence view should expose supporting evidence, competing fault hypotheses, uncertainty, the supported time-to-threshold projection and the next-best observation. It should not present a model ranking as a calibrated real-world probability.

## Notification lifecycle

- **Attend:** route to crew member, Suit view and implicated region.
- **Escalate:** raise command priority and record escalation.
- **Resolve:** execute a mapped simulated recovery action.
- **Close:** dismiss the message thread while preserving the underlying active fault.
- **Terminate:** close the thread and record termination while preserving the underlying active fault.

## Data and model boundaries

The v19 demonstration contains 13 synthetic direct channels and an inferred thermal state. Blood pressure is not a v19 runtime input. No live NASA API or suit hardware feed is connected. The current inference is a bounded model-based pipeline; there is no active external LLM diagnosis service.

## Design principles

- Preserve the existing visor visual identity and spatial suit metaphor.
- Prefer clear hierarchy, subtle transitions and low-clutter surfaces.
- Use plain-language mission messages with explicit operator control.
- Make evidence and uncertainty inspectable.
- Separate message dismissal from fault clearance.
- Distinguish measured/simulated channels from inferred states and future scope.
- Keep the product explicitly within research-demonstration boundaries until independently validated.
