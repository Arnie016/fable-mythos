# Token economics

The repo's thesis in one line: expensive models author reusable artifacts once, cheap models execute them daily. This page is the practical version — where tokens actually go, and the levers that matter, roughly in order of impact.

## 1. Tier the models
Authoring skills, contracts, rubrics, architecture: frontier model. Running them — drafting, formatting, triage: Sonnet or Haiku. A frontier model producing a one-off output is the most expensive way to use it; the skills in this repo exist so that spend amortizes.

## 2. Stop re-deriving context
Every session that rediscovers your build commands, conventions, and project state pays for the rediscovery. A `CLAUDE.md` / `AGENTS.md` under 150 lines per repo is the highest-ROI file you can write. State that must survive sessions goes on disk — progress notes, contracts, logs. Chat history compacts and rots; files don't.

## 3. Index, don't dump
Pasting whole files or repos into context is the classic burn. Search first, read the narrow range, let tools fetch on demand. Bulk reference material belongs in a skill's reference files — loaded only when the skill actually triggers.

## 4. Output discipline
Output tokens cost several times what input tokens do. Ask for diffs, not full files; decisions, not essays. One "be concise" line in a context file compounds across hundreds of responses.

## 5. One job per session
Long sessions drift, and drift is paid for in re-explained context. When a run goes sideways, restarting with a clean contract usually beats patching iteration nine — the restart rule is also a cost rule.

## 6. Caching cuts both ways
Repeated context inside a provider's cache window is cheap; the same context revisited sporadically is full price. Batch related questions into one sitting instead of five sessions that each re-upload the world.

## The snake-oil test
Every "save 90% of your tokens" trick — compression proxies, render-your-code-as-images, magic wrapper tools — gets the same test before adoption: run a week of *your* real workload with and without it, count the tokens **and** the quality regressions, keep it only if both numbers survive. Most don't. The levers above are boring precisely because they're the ones that do.
