# Before / after — video-prompt-director

**Input:** "cyberpunk alley chase, a hacker girl running from two drones, rainy, for Seedance"

## Before (no skill)

> Cinematic masterpiece, 8k, a cyberpunk hacker girl with neon hair runs through a rainy alley chased by drones, camera dollies in while panning and craning up over the rooftops as she slides under a gate, dramatic lighting, trending on artstation, hyperrealistic, epic

One prompt, three camera moves, zero continuity. The model picks one move at random, the girl's hair changes color mid-shot, and the gate slide never happens.

## After (with skill)

**Character block (verbatim in every shot):**
`a young woman with short teal hair, black rain-slick jacket, silver backpack, mid-20s`

**Shot 1** — `a young woman with short teal hair, black rain-slick jacket, silver backpack, mid-20s sprints toward camera through a narrow neon-lit alley, puddles splashing. Camera: medium shot, dolly backward. Lighting: magenta and cyan signage reflecting off wet asphalt, night. Style: Blade Runner 2049 street level, anamorphic flare. Ends on: her glancing over her shoulder.`

**Shot 2** — `two matte-black quadcopter drones with red scanning lights weave between fire escapes in the same neon alley, rain streaking through their searchlights. Camera: low-angle tracking shot. Lighting: same magenta-cyan palette. Style: Blade Runner 2049, anamorphic flare. Opens on: the direction she glanced.`

**Check note:** Seedance tends to add extra drones — count them in output. **Fallback for shot 1:** static wide with her running through frame, if the dolly stutters.

## What changed
One move per shot, the character described identically wherever she appears, shots that open on the previous shot's closing frame — and no incantations doing nothing.
