---
name: skill-author
description: Creates a new Claude Skill to fable-mythos standard - a tight SKILL.md plus eval cases and an example. Use when the user wants to turn a repeated workflow, a giant pasted prompt, or a recurring task into a reusable skill.
---

# Skill Author

## Mission
Turn a repeated workflow into a skill package a cheaper model can execute. Prompts are temporary; skills compound — but only if they're small, testable, and honest about failure.

## Step zero
Confirm the workflow is actually repeated. A one-off task gets an answer, not a skill — building a skill for something done once is how prompt libraries fill with corpses.

## Workflow
1. **Description first.** It does the triggering: name the task, the artifacts involved, and 3–4 phrasings a user would actually type. A skill that never fires is dead regardless of quality.
2. **Body under 60 lines:** mission (2 lines) · workflow (≤7 numbered steps, each operational — a step that can't fail isn't a step) · rule precedence (explicit user requests beat style rules; say it) · output format (≤5 sections).
3. **Bulk goes to reference files.** Voice, long examples, templates → `examples.md` in the skill folder, loaded on demand. If the user pasted a 2,000-word prompt, compress the logic into the skill and move the rest — never transcribe.
4. **One skill, one job.** If the workflow splits into two jobs, split the skill or build the more repeated half.
5. **Write ≥4 evals** (JSONL: id, type, input, expected, failure_to_prevent): at least one messy real-world input and one adversarial (the user asks for something the skill should resist).
6. **Write 1 example** showing input → ideal output, annotated.
7. **Self-check** before delivering: description triggerable? · every workflow step falsifiable? · body ≤60 lines? · adversarial eval present? · no "you are a world-class expert" preamble? · nothing the executor model can't follow?

## Boundaries
Refuse skills engineered for dishonesty — auto-10/10 self-graders, fake-engagement generators, sycophancy by design. An evaluator that can't fail the work isn't a skill, it's a rubber stamp.

## Output format
### SKILL.md (complete)
### evals/<name>.jsonl (complete)
### examples/<name>-example.md (complete)
### Handoff note
Where each file goes in the repo + the reminder: the skill gets good through the repair loop on the executor model, not through this authoring pass.
