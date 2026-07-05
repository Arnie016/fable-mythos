# Fable Mythos

**Claude Skills that replace giant prompts — with the evals and repair loop to keep them honest.**

Stop pasting the same 2,000-word prompt. Write it once as a Skill, run it on cheaper models, and when the output misses — patch the exact failure, not the vibe.

The loop:

1. Write a short, reusable Skill.
2. Run it on a cheaper model (Sonnet / Haiku — save the frontier model for authoring).
3. Read the failed output.
4. Patch the one instruction that would have prevented it.
5. Add a regression test.
6. Repeat.

Prompts are temporary. Skills compound.

## Install

```bash
git clone https://github.com/Arnie016/fable-mythos
cd fable-mythos
./scripts/list-skills.sh                        # see what's available
./scripts/install-skill.sh linkedin-signal-posts
```

Then in Claude Code: `/linkedin-signal-posts` followed by your messy notes.

## The skills

| Skill | What it does |
|---|---|
| [`linkedin-signal-posts`](skills/linkedin-signal-posts/) | Messy project notes → high-signal LinkedIn post. No "thrilled to announce", proof over hype. |
| [`video-prompt-director`](skills/video-prompt-director/) | Scene idea → shot-by-shot prompts for Seedance/Veo/Higgsfield. One camera move per shot, characters that don't get recast. |
| [`agent-task-compiler`](skills/agent-task-compiler/) | Vague project idea → sprint spec, contract of testable assertions, agent-sized tasks with acceptance criteria. |
| [`voice-capsule`](skills/voice-capsule/) | Your real writing samples → a portable style guide any model can follow. Examples over adjectives. |
| [`skill-author`](skills/skill-author/) | A repeated workflow → a new skill to this repo's standard, evals included. The platform grows itself. |
| [`skill-repair-loop`](skills/skill-repair-loop/) | The engine. Failed output → exact instruction failure → minimal patch → regression test. |

## Run the evals

Every skill ships with eval cases — normal, messy, edge, and adversarial. Run them against the model that will actually execute the skill:

```bash
./scripts/run-evals.sh linkedin-signal-posts sonnet
```

Outputs land in `evals/runs/<skill>/`. Score against each case's `expected` field (and [evals/rubric.md](evals/rubric.md) where one exists); anything that misses goes to `/skill-repair-loop` with the bad output attached. A skill only the frontier model can follow has failed its purpose.

## Why skills, not prompts

- A prompt is typed once and forgotten. A skill is a file that keeps working after you close the tab.
- Skills load only when triggered — zero context cost until the moment you need them.
- Expensive models are for **authoring** workflows; cheap models are for **running** them. The economics only work if the skill survives contact with the cheaper model — which is exactly what the evals and repair loop are for.

See [examples/](examples/) for before/after demos of what the difference looks like, [docs/skill-standards.md](docs/skill-standards.md) for what every skill here must ship with, and [docs/token-economics.md](docs/token-economics.md) for where the tokens actually go — the economics that make the loop worth running.

## Contributing

Use `/skill-author` — it produces the whole package to standard. The rule stands: a new skill needs at least 4 eval cases (one adversarial) and 1 annotated example. No write-only prompt dumps.

Sibling repo: [fable5--goals-gpt5.5xhigh](https://github.com/Arnie016/fable5--goals-gpt5.5xhigh) — 10 superprompts + 100 agent-ready goals for ChatGPT connectors, Codex, and MCP agents.

## License

MIT
