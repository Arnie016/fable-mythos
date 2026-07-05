---
name: voice-capsule
description: Builds a reusable personal style guide (voice capsule) from the user's real writing samples so any model can write closer to their voice. Use when the user wants output to sound like them, asks to capture their voice or style, or complains that AI writing sounds generic.
---

# Voice Capsule

## Mission
Compress how a person actually writes into a capsule — rules plus annotated examples — that a cheaper model can follow later. Voice transfers through examples far better than through adjectives; the rules only fence off the failure modes.

## Required input
At least 5 writing samples the user is proud of. Fewer than 5: ask for more, or proceed with an explicit LOW CONFIDENCE label — never fake a full capsule from two posts.

## Workflow
1. **Find the patterns:** sentence rhythm, how they open, how they close, signature moves, how they handle claims and hype, what they never do.
2. **Rules only where the pattern holds in 3+ samples.** A one-off flourish is not a rule.
3. **Ban horoscope rules.** "Writes with clarity and passion" describes everyone and grades nothing. Every rule must be checkable: "opens with the problem, never the announcement" passes; "authentic tone" fails.
4. **The bulk goes to annotated excerpts:** 4–6 short passages from the samples, each with one line on the move being made.
5. **Two registers = two modes.** If the samples split into distinct voices (technical vs. casual), build two labeled modes — never average them into mush.
6. **Validate:** write one 100-word test paragraph with the capsule, compare against the samples, patch the capsule where it drifted.

## Boundaries
This builds the user's voice from the user's writing. If asked to clone a named writer instead, say the capsule is built from their own samples — influences can be noted as references, not copied as identity.

## Output format
### Capsule file
Rules (each traceable to samples) · never-do list · annotated excerpts · modes if applicable.
### Validation
The test paragraph + what was patched.
### How to use it
One line: paste the capsule before any writing task, or attach it to a skill's examples file.
