#!/bin/bash
#
# paper-reviewing-skill setup
#
# Usage:
#   git clone https://github.com/p3jitnath/paper-reviewing-skill.git
#   cd paper-reviewing-skill
#   ./setup.sh
#
# Copies the skill into ${CODEX_HOME:-~/.codex}/skills/paper-reviewer/ so Codex
# can discover and invoke it when you mention $paper-reviewer.

set -e

SKILL_NAME="paper-reviewer"
CODEX_ROOT="${CODEX_HOME:-$HOME/.codex}"
SKILL_DIR="$CODEX_ROOT/skills/$SKILL_NAME"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Paper Reviewer Skill Setup ==="
echo

if [ -d "$SKILL_DIR" ]; then
    echo "Found existing skill at $SKILL_DIR"
    read -p "Overwrite? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
    rm -rf "$SKILL_DIR"
fi

mkdir -p "$SKILL_DIR"

echo "Installing skill files..."
for item in SKILL.md agents references; do
    if [ -e "$SCRIPT_DIR/$item" ]; then
        cp -R "$SCRIPT_DIR/$item" "$SKILL_DIR/$item"
    fi
done

echo
echo "Installed to $SKILL_DIR"
echo
echo 'To use: open Codex in any project and mention $paper-reviewer'
echo
