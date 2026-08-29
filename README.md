# Scholarly Paper-Reviewing Skill

A Codex skill for rigorous, constructive, and humane scholarly peer review.

The skill evaluates manuscripts and revised submissions for methodological rigor, reporting completeness, claim-evidence alignment, ethics, reproducibility, and presentation. It adapts to the target venue, article type, discipline, and maturity of the work while remembering that there are researchers behind every manuscript.

## Install

```bash
git clone https://github.com/p3jitnath/paper-reviewing-skill.git
cd paper-reviewing-skill
./setup.sh
```

The installer copies the skill to `${CODEX_HOME:-~/.codex}/skills/paper-reviewer/`. Start a new Codex session and ask Codex to use `$paper-reviewer`.

## What It Does

- Checks confidentiality, conflicts, journal rules, and AI-use policies before reviewing.
- Reads the complete submission, including supplements, figures, tables, checklists, and revision letters.
- Builds a claim map linking the research question, design, results, and conclusions.
- Selects study-type reporting guidance without treating checklist compliance as proof of validity.
- Audits data provenance, leakage, controls, baselines, uncertainty, reproducibility, ethics, and claim support.
- Separates reporting omissions from methodological flaws and essential revisions from optional extensions.
- Anchors substantive comments to manuscript locations and requests proportionate remedies.
- Produces structured author-facing comments, confidential editor comments when needed, and calibrated recommendations.
- Reviews revised manuscripts through an issue ledger without moving the goalposts.
- Adapts its criteria for quantitative, qualitative, systematic-review, computational, mathematical, theoretical, and humanities scholarship.

## Kind but Rigorous Reviewing

The skill assumes good faith, identifies concrete strengths, and critiques the work rather than the authors. Kindness does not lower scientific standards; it makes criticism respectful, specific, and useful.

Recommendation calibration emphasizes repairability:

- **Minor revision** when the core work is sound and changes are bounded.
- **Major revision** when substantial work is required but the existing study can plausibly support a publishable paper.
- **Reject** only for decisive scope mismatch, non-repairable ethical or validity defects, an unsupported central premise, or a remedy amounting to a substantially new study.

A long list of comments alone is not a reason to reject.

## Typical Requests

- “Use `$paper-reviewer` to review this manuscript for a machine-learning workshop.”
- “Assess this climate paper against the attached venue rubric.”
- “Check whether the conclusions are supported by the reported experiments.”
- “Review this revision and verify the response to every prior concern.”
- “Draft constructive major and minor comments for the authors.”
- “Evaluate this systematic review using the appropriate reporting guideline.”

## Workflow

1. **Scope and policy:** Identify the venue, article type, review model, confidentiality status, AI policy, and reviewer expertise boundary.
2. **Complete inspection:** Read all supplied material and inspect PDF layout, figures, tables, equations, and supplements.
3. **Claim mapping:** Connect the question, design, evidence, results, and conclusions.
4. **Scientific assessment:** Evaluate rigor, reporting, ethics, reproducibility, uncertainty, and applicability using discipline-appropriate criteria.
5. **Evidence-backed report:** Write a neutral summary, strengths, numbered major and minor comments, and a proportionate recommendation when requested.
6. **Quality control:** Check that every major concern is supported, actionable, internally consistent, and within scope.

## Repository Layout

```text
SKILL.md                         Core workflow and review contract
agents/openai.yaml               Codex UI metadata
references/review-framework.md   Detailed criteria and article-type adaptations
references/revisions.md          Revised-submission issue-ledger workflow
references/sources.md            Guidance sources and provenance
setup.sh                         Installer
```

## Guidance Foundation

The skill is informed by:

- [COPE Ethical Guidelines for Peer Reviewers](https://doi.org/10.24318/cope.2019.1.9)
- [Nature: Brief Guide to Reviewers](https://www.nature.com/documents/commsbio-referee-brief-guide.pdf)
- [Elsevier: How to Conduct a Review](https://www.elsevier.com/reviewer/how-to-review)
- [EQUATOR peer-reviewing toolkit](https://www.equator-network.org/toolkits/peer-reviewing-research/)
- Michael W. Marek's *Performing Peer Review* checklist, with field-specific claims adapted rather than universalized

Current journal and publisher policies always take precedence, particularly for confidentiality and generative-AI use.

## Validate

From a Codex installation that includes the `skill-creator` system skill:

```bash
uv run --with pyyaml python \
  "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" .
bash -n setup.sh
```

## Update an Existing Installation

Pull the latest repository changes and rerun the installer:

```bash
git pull
./setup.sh
```

The installer asks before replacing an existing installation.

## License

MIT
