#!/usr/bin/env bash
# The same failing pipeline, three ways, so the difference is visible.

PIPELINE='COUNT=$(ls /no/such/dir | wc -l); echo "reached the next line, COUNT=[$COUNT]"'

echo "--- 1. no strict mode"
bash -c "$PIPELINE"
echo "script exit: $?"

echo
echo "--- 2. set -e only, no pipefail"
bash -c "set -e; $PIPELINE"
echo "script exit: $?"

echo
echo "--- 3. set -euo pipefail"
bash -c "set -euo pipefail; $PIPELINE"
echo "script exit: $?"

echo
echo "--- 4. strict mode, but called inside an if"
bash -c 'set -euo pipefail; if COUNT=$(ls /no/such/dir | wc -l); then :; fi; echo "reached the next line anyway, COUNT=[$COUNT]"'
echo "script exit: $?"
