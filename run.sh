#!/bin/sh

set -e
# shellcheck disable=SC3040
set -o pipefail

# Fix permissions
chown -R static:static /app

# Setup FIFO (fixes stdin issues with Klondike's interactive mode)
fifo=$PWD/fifo.tmp
mkfifo "$fifo"
exec 3<> "$fifo"
rm -f "$fifo"

# Run Klondike as the "static" user
su static -c "mono /app/bin/Klondike.SelfHost.exe --interactive --port=8080 <&3"
