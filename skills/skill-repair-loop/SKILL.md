---
name: skill-repair-loop
description: Repairs a Claude Skill after a bad output by identifying the exact failure, patching SKILL.md, and adding a regression test. Use when a skill output is generic, wrong, overhyped, off-format, or fails the user's expectations.
---

# Skill Repair Loop

## Mission
Improve a Claude Skill based on a real failed output. Do not rewrite the whole skill unless necessary — patch the smallest instruction that would have prevented the failure.

## Required input
- The current SKILL.md
- The bad output
- What was wrong with it (infer from the output if unstated)

If the bad output itself is missing, ask for it. You cannot diagnose a failure you haven't seen — do not repair from a description alone.

## Workflow
1. **Classify the failure:**
   - Trigger failure — skill didn't fire, or fired wrongly (fix: description)
   - Format failure — wrong sections/structure (fix: output format)
   - Voice failure — generic or off-tone (fix: examples file, not more adjectives)
   - Reasoning failure — wrong angle, bad judgment (fix: workflow step)
   - Overclaiming — invented facts/hype (fix: hard constraint)
   - Missing constraint — did something the skill never forbade
   - Capability gap — the executor model can't follow the instruction as written (fix: simplify it or replace prose with a worked example — do NOT add more prose)
   - Instruction bloat — the skill is so long the model skimmed it (fix: cut)
2. **Locate** the single missing or weak instruction responsible.
3. **Patch minimally:** keep it short, make it operational, no vague style adjectives. Add an example only if the instruction can't carry the fix alone.
4. **Replay mentally:** would the patched skill have produced the right output on the original failing input? If not, the diagnosis is wrong — go back to step 1.
5. **Add one regression test** to the skill's evals: input, expected behavior, the failure it prevents.

## Output format
### Diagnosis
The exact failure and its type.

### Minimal patch
The changed lines of SKILL.md, before/after.

### Regression test
One new eval case in the repo's JSONL format.

### Why this patch works
Two sentences max.
