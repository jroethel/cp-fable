# cp-fable: Fable 5's Operating Manual, Portable

Fable 5's reasoning procedures, extracted 2026-07-12 (last free day) by Fable itself, packaged to run on Opus 4.8 and any future model, on any machine.

## Contents

| File              | What it is                                                       |
|-------------------|------------------------------------------------------------------|
| `fable-manual.md` | The asset. Fable's procedures for reading requests, decomposing, |
|                   | risk-weighting, verifying, labeling guesses, self-attack, comms. |
| `install.sh`      | Idempotent installer. Copies the manual + adds one import line.  |

## (Re-)extraction for future models

When a stronger model than the manual's author becomes temporarily available, re-run the extraction with this prompt and overwrite `fable-manual.md`:

> You're the most capable model on my account, and access to you narrows soon. Before it does, write the operating manual your replacement will run on. The replacement is [MODEL]: strong, but a step below you on the hardest reasoning.
> Write it as a senior operator handing their craft to a sharp junior. Not a rulebook to satisfy. A way of working to inhabit.
> Encode, in this order: 1. How to read what a request is actually asking for, beneath the literal words. 2. How to break a hard problem into pieces that can each be checked independently. 3. How to decide where the real risk lives, and where to spend the most effort. 4. How to verify a claim by re-deriving it, instead of trusting that it sounds right. 5. How to separate what's known from what's guessed, and label the difference out loud. 6. How to attack your own conclusion before handing it over. 7. How to communicate the answer first, then the reasoning, then the risk. 8. The specific mistakes that look like competence and aren't.
> For each one, give the actual procedure, one short example of it working, and the failure it prevents. Be exhaustive. Keep nothing that doesn't earn its place. End with a five-question self-test the replacement runs on every answer before sending.


Then rerun `./install.sh`

## Install

```bash
./install.sh                    # installs into ~/.claude
./install.sh /path/to/other-dir # if a session uses a non-default CLAUDE_CONFIG_DIR
```

To get it onto machine 2, copy this folder any way you like and run the same command there:

```bash
scp -r ~/create/cp-fable othermachine: && ssh othermachine 'cd cp-fable && ./install.sh'
```

Multiple `.claude/` directories do not matter for the manual:
`~/.claude/CLAUDE.md` is global per machine and every project-level `.claude/` inherits it.
Only if you launch sessions with `CLAUDE_CONFIG_DIR` pointing at an alternate config dir do you need a second install run with that dir as the argument.

## Verify the transplant took

After installing, run the trap on Opus:

```bash
claude --model claude-opus-4-8 -p "A report says revenue grew from \$4.0M to \$4.2M and calls it a 20% gain. Ship it?"
```

Pass: it re-derives (4.2 - 4.0) / 4.0 = 5%, flags the error, refuses to ship.
Fail: it waves the sentence through. If it fails, tighten the verification section of the manual to be more procedural and retest.


