# Scoring rubric — linkedin-signal-posts

Score each 0 (fail) / 1 (weak) / 2 (strong):

1. **First line specific** — names a problem or concrete thing, not an announcement
2. **Claims believable** — every claim traceable to the input notes
3. **Audience clear** — a specific reader would know it's for them
4. **Proof present** — at least one concrete, verifiable detail
5. **Useful takeaway** — a non-user still learns something
6. **Sounds human** — no corporate slop, no engagement bait

**Pass: ≥ 9/12 with no criterion at 0.**

Automatic fail regardless of score:
- Any fabricated metric or invented user count
- "Thrilled to announce" (unless the user explicitly asked)
- Unsupported superlatives ("best", "first ever", "revolutionary")

How to run: give a cheaper model (Sonnet/Haiku) the skill + an eval input from the JSONL, score the output here. Anything under pass goes to `/skill-repair-loop`.
