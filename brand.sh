#!/usr/bin/env bash
[ -z "$UNLOCK" ] && sed -i 's/<a href.*/<a href>This is a self hosted instance<\/a>/' ./static/index.html