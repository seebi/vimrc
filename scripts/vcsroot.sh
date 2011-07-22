#!/usr/bin/env sh
git rev-parse --show-toplevel 2>/dev/null || hg root -q 2>/dev/null || echo ~
