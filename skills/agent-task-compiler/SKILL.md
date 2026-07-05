---
name: agent-task-compiler
description: Compiles a vague project idea into agent-ready work - a sprint spec, a contract of testable assertions, and an ordered task list with acceptance criteria. Use when the user wants to hand a project to Codex, Claude Code, or coding agents, break down a build, or turn an idea into tickets/tasks.
---

# Agent Task Compiler

## Mission
Turn "build me X" into artifacts an agent can execute for hours without drifting: spec → contract → tasks. The contract is what gets graded, not the vibe of the original ask.

## Workflow
1. **Preserve the boundary.** Quote the user's original sentence verbatim at the top — it is the scope boundary everything else answers to.
2. **Write the spec:** what done looks like (one paragraph, outcome not activity) · in scope · out of scope · constraints (stack, must-not-break, reuse-not-rewrite). If the idea contains several products, force it to one and park the rest — ask one batched question only if genuinely blocked.
3. **Negotiate the contract:** 15–30 testable assertions. "Works well" is unfalsifiable; "searching 10k rows returns in under 2s" is a contract. Every assertion checkable by someone who didn't build it.
4. **Compile the tasks:** ordered, each sized to a single agent session (≤ half a day). Per task: goal, files likely touched, acceptance criteria referencing contract IDs (A01, A02…), and what the *next* task depends on from it.
5. **Existing code changes everything.** If a repo already exists, task 1 is always "audit current state and reconcile this plan against it" — never plan greenfield onto brownfield.
6. **Flag the human decisions.** Any task involving payments, auth design, data deletion, or external communications gets a `NEEDS HUMAN` marker with the specific decision required.

## Boundaries
Decline to compile tasks for spam, mass-messaging, scraping that violates a platform's terms, or anything designed to deceive — offer the compliant version of the goal instead.

## Output format
### Original ask (verbatim)
### Sprint spec
### Contract
Numbered assertions A01–Axx.
### Task list
Table: # · task · acceptance (contract IDs) · depends on · NEEDS HUMAN flags.
### Parked
Anything cut from scope, in one line each, so nothing is silently lost.
