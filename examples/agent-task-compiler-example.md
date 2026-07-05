# Example — agent-task-compiler

**Input:** "Build me a flashcard web app with spaced repetition. React, no backend, localStorage is fine."

## Output (excerpt)

**Original ask (verbatim):** "Build me a flashcard web app with spaced repetition. React, no backend, localStorage is fine."

**Spec — what done looks like:** A single-page React app where a user creates decks of cards, reviews due cards daily, and the review interval per card grows or shrinks based on self-graded recall. All state persists in localStorage across refreshes. Out of scope: accounts, sync, mobile app, importing Anki decks.

**Contract (5 of 18 assertions):**
- A01. Creating a card and refreshing the page: the card is still there.
- A02. A card graded "again" reappears in the same session; graded "easy" it is not due for at least 3 days.
- A03. The review queue shows only due cards, and shows "done for today" when empty — not a blank screen.
- A07. 500 cards in localStorage: deck list renders in under 1 second.
- A12. Malformed localStorage data (corrupted by hand) does not white-screen the app; it recovers with an error notice.

**Tasks (first 4 of 9):**

| # | Task | Acceptance | Depends on |
|---|------|-----------|------------|
| 1 | Data layer: card/deck models + localStorage persistence with corruption recovery | A01, A12 | — |
| 2 | Deck CRUD UI | A01, A03 | 1 |
| 3 | Spaced-repetition scheduler (SM-2 simplified), pure functions + unit tests | A02 | 1 |
| 4 | Review session UI wired to scheduler | A02, A03 | 2, 3 |

**Parked:** deck sharing (out of scope), keyboard shortcuts (nice-to-have, revisit after A-contract passes).

## Why this works
Every task is one agent session, every acceptance criterion points at a contract ID a second agent could verify, and the corruption case (A12) exists because contracts that only describe the happy path grade broken demos as done.
