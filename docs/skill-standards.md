# Skill standards

What every skill in this repo ships with, and why. `/skill-author` enforces these; contributions are reviewed against them.

## The package

A skill is four things, or it's a prompt dump:

1. **`skills/<name>/SKILL.md`** — under 60 lines of body. The description does the triggering (name the task and 3–4 phrasings a user would type); the body does the workflow.
2. **`evals/<name>.jsonl`** — at least 4 cases: normal, messy real-world, edge, and one adversarial where the user asks for something the skill should resist. Fields: `id`, `type`, `input`, `expected`, `failure_to_prevent`.
3. **`examples/<name>-*.md`** — at least one input → ideal output, annotated with *why* it's right. Voice and bulk reference material also live at the skill level (`skills/<name>/examples.md`), loaded on demand.
4. **A repair path** — when it fails on a real input, `/skill-repair-loop` patches the exact instruction and adds the failure as a regression case to the JSONL.

## Writing rules

- **Every workflow step must be falsifiable.** "Be thoughtful" can't fail, so it isn't a step. "Pick ONE angle; never merge several stories" can fail, so it teaches.
- **Rule precedence is stated in the skill:** explicit user requests beat style rules. Skills that lecture users lose users.
- **One skill, one job.** Two jobs = two skills.
- **No personality preambles.** "You are a world-class expert" is zero operational content in one line.
- **Test with the executor, not the author.** Run evals with the model that will use the skill daily: `./scripts/run-evals.sh <name> sonnet`. A skill only the frontier model can follow has failed its purpose here.

## The lifecycle

Author (frontier model, once) → run on the executor model → read the failures → repair → regression test → repeat. Skills don't get good from being written well; they get good from surviving contact with the cheaper model.
