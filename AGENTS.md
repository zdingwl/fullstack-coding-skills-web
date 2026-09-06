# AGENTS.md

## Project purpose
This repository is the Web edition of a full-stack software-development prompt/skill library for browser-based AI assistants.

## Architecture rules
- Keep prompt content in `prompts/modules/` and `prompts/recipes/`.
- Keep `index.html` focused on presentation, search, loading, preview and copy interactions.
- Do not duplicate full Skill bodies inside `index.html`.
- `catalog.json` is the source of truth for what appears in the Web UI.
- Root files `WEB_MASTER_PROMPT.md`, `PROJECT_CONTEXT_TEMPLATE.md` and `HANDOFF_PROMPTS.md` are first-class user-facing artifacts.

## Prompt file convention
Each professional Skill should contain:
1. a Markdown title;
2. original Skill id / trigger description;
3. `## 可复制提示词`;
4. one fenced `text` block containing the copyable prompt.

Recipes should contain one title and one fenced `text` block.

## Development workflow
1. Read `README.md`, `catalog.json` and the affected prompt files first.
2. Keep changes minimal and scoped to the requested behavior.
3. If adding/removing/renaming a Skill or Recipe, update `catalog.json` in the same change.
4. For UI changes, preserve keyboard accessibility, responsive layout and copy behavior.
5. Do not introduce a framework or build tool unless the requirement clearly benefits from it.
6. Do not add external CDN dependencies for basic functionality.

## Verification
Run a local static HTTP server, for example:

```bash
python -m http.server 8080
```

Then verify:
- `index.html` loads without console errors;
- all catalog cards render;
- search and category filters work;
- every Preview action loads its Markdown file;
- every Copy action copies the fenced prompt body;
- master/context/handoff buttons work;
- mobile layout remains usable.

If browser execution is unavailable, do not claim these checks passed. Verify file paths and JSON syntax at minimum and state the browser checks as not executed.
