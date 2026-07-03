# Fable Mythos

**Claude Skills that replace giant prompts.**

Stop pasting the same 2,000-word prompt. Write it once as a Skill, run it on cheaper models, and when the output misses — patch the exact failure, not the vibe.

The loop:

1. Write a short, reusable Skill.
2. Run it on a cheaper model (Sonnet / Haiku — save the frontier model for authoring).
3. Read the failed output.
4. Patch the one instruction that would have prevented it.
5. Add a regression test.
6. Repeat.

Prompts are temporary. Skills compound.

## Install a skill

```bash
git clone https://github.com/Arnie016/fable-mythos
cd fable-mythos
./scripts/install-skill.sh linkedin-signal-posts
```

Then in Claude Code:

```
/linkedin-signal-posts
I built an IB Theory of Knowledge GPT for teachers at my school...
```

## Skills

| Skill | What it does |
|---|---|
| [`linkedin-signal-posts`](skills/linkedin-signal-posts/) | Turns messy project notes into high-signal LinkedIn posts — no "thrilled to announce", no fake humility, proof over hype. |
| [`skill-repair-loop`](skills/skill-repair-loop/) | The engine. Takes a failed skill output, finds the exact instruction failure, patches the SKILL.md, and adds a regression test so it never repeats. |

## Why Skills, not prompts

- A prompt is typed once and forgotten. A Skill is a file that keeps working after you close the tab.
- Skills load only when triggered — zero context cost until the moment you need them.
- Expensive models are for **authoring** workflows. Cheap models are for **running** them. The economics only work if the Skill survives contact with the cheaper model — which is exactly what the repair loop is for.

## The repair loop is the product

Most prompt libraries are write-only: someone dumps 50 prompts, nobody knows if any of them work. Every skill in this repo ships with:

- **evals/** — test inputs with expected behavior: normal, messy, edge, and adversarial cases
- **examples** — before/after outputs, annotated
- **a repair path** — when it fails on a real input, `/skill-repair-loop` patches it and adds the regression test

See [examples/linkedin-before-after.md](examples/linkedin-before-after.md) for what the difference looks like.

## Repo structure

```
fable-mythos/
├── skills/
│   ├── linkedin-signal-posts/   # SKILL.md + examples.md
│   └── skill-repair-loop/       # SKILL.md
├── evals/                       # test cases + scoring rubric
├── examples/                    # before/after demos
└── scripts/                     # install-skill.sh
```

## Contributing

PRs welcome, with one rule: a new skill needs at least 3 eval cases and 1 before/after example. No write-only prompt dumps.

## License

MIT
