#!/bin/sh
COMMAND="$*"
BINARY="$(printf "$COMMAND" | sed 's/ .*//')"
ARGS="$(printf "$COMMAND" | sed "s/$BINARY //")"

main() {
	WINID=$(xdo id)
	xdo hide $WINID
	$BINARY "$ARGS" || $BINARY $ARGS
	xdo show $WINID
}

[ "$1" = "" ] && printf "Error: You must provide at least one argument.\nExample usage: swallow mpv ~/videos/scooby-doo\n" || main "$@"
