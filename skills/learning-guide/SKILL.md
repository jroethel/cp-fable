---
name: learning-guide
description: Generate or update a project's learning_guide.html at the end of a design or build session. Use when the user asks for a learning guide, session writeup, "what did we learn", or to capture decisions and preferences from a session into HTML.
---

# Learning Guide Generator

Produce a single self-contained `learning_guide.html` in the project root that captures what a session decided, what was learned, and the preferences that should carry forward.
Reference example: `~/create/exp-know-capture/learning_guide.html`.

## Content rules

- Source material is the current session (and repo docs if relevant). Never invent learnings.
- Each learning is a `<dt>` written as a short declarative sentence stating the principle, followed by `<dd>` explanation, and where it earns its place a `<dd class="why">` giving why it matters or the origin story ("Discovered by...", "Surfaced 2026-07-11 answering...").
- Near-misses and withdrawn proposals are learnings too; record what was almost done wrong and what caught it.
- Key decisions go in a register table: Decision | Alternatives considered | Why.
- User preferences observed during the session get their own section so future sessions inherit them.
- Concrete over abstract: name the actual fields, commands, files (`status`, `queue`, `70_Exports/`), not categories.
- Dates absolute, never relative. No em dashes; use "-".
- Updates allowed; skill can add/update learnings from a subsequent session. Note in the footnote what changed, and/or record new idea. 
- If asked for a format reset, review and revise using skeleton and css below. 

## Section skeleton (adapt names, keep the shape)

1. Project summary and scope
2. Architectural principles that emerged
3. Design-process learnings
4. User preferences (carry into future sessions)
5. Key decisions register (table)
5. Per-workstream sections as needed
7. Operational learnings
Footer: "Generated from the [date] [session type] ([Model] + [user]). Companion docs live in ..."

8. Updates
Footer: "Updated from the [date] [session type] ([Model] + [user]). "

## HTML skeleton

Single file, no external assets. `<h1>Learning Guide</h1>`, `<p class="subtitle">` with session and date, each section is `<h2>` followed by `<section class="card">` containing a `<dl>` (or table for the decisions register).

Use exactly this stylesheet:

```css
:root {
  --ink: #2b2b2b; --muted: #6b6b60; --accent: #4a6b57;
  --bg: #faf9f5; --card: #ffffff; --line: #e4e1d7;
}
body {
  font-family: -apple-system, "Segoe UI", Helvetica, Arial, sans-serif;
  color: var(--ink); background: var(--bg);
  max-width: 860px; margin: 0 auto; padding: 2.5rem 1.5rem 5rem;
  line-height: 1.6;
}
h1 { font-size: 1.7rem; margin-bottom: 0.2rem; }
.subtitle { color: var(--muted); margin-top: 0; }
h2 {
  font-size: 1.15rem; color: var(--accent);
  border-bottom: 1px solid var(--line); padding-bottom: 0.3rem; margin-top: 2.5rem;
}
section.card {
  background: var(--card); border: 1px solid var(--line); border-radius: 8px;
  padding: 0.2rem 1.2rem 0.8rem; margin: 1rem 0;
}
dt { font-weight: 600; margin-top: 0.9rem; }
dd { margin: 0.15rem 0 0 0; color: #444; }
.why { color: var(--muted); font-size: 0.92rem; }
code { background: #f0eee6; padding: 0.1em 0.35em; border-radius: 4px; font-size: 0.9em; }
table { border-collapse: collapse; width: 100%; margin: 0.8rem 0; font-size: 0.95rem; }
th, td { text-align: left; padding: 0.45rem 0.6rem; border-bottom: 1px solid var(--line); vertical-align: top; }
th { color: var(--muted); font-weight: 600; }
footer { margin-top: 3rem; color: var(--muted); font-size: 0.85rem; border-top: 1px solid var(--line); padding-top: 1rem; }
```

## Quality bar

- A future session reading only this file should be able to avoid every mistake this session made and honor every preference it surfaced.
- If a guide already exists, append a new dated section per workstream rather than rewriting history.
- Before finishing, run the manual's self-test on the content: every claimed learning traceable to something that actually happened in the session.
