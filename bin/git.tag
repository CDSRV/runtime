#!/usr/bin/env bash

## REF: https://git-scm.com/docs/git-tag

## PURPOSE: normalize tag semantics

case_debug


## NOTE: define REV for a specific commit
# eg: REV=commit tag.add TAGNAME MESSAGE
# default is tag the current context

ACTION=$(basename $(tr -d '\0' < /proc/$PPID/cmdline)) &>/dev/null

case $ACTION in

	*.add* | *.create* )
	## NOTE: set the force mode
	case $FORCE in
		true|True)
		MODE="-f"
		;;
		*)
		unset MODE
		;;
	esac #FORCE

	TAGTYPE=${TAGTYPE:-annotated}
	case $TAGTYPE in
		annotated)
		type_flag="-a"
		;;
		signed)
		type_flag="-s"
		;;
	esac #TAGTYPE

	TAGNAME=${TAG:-$1}
	TAGNAME=${TAGNAME:-$1}

	MESSAGE=${MESSAGE:-$2}
	[ -z $MESSAGE ] || message_flag="-m"
	
	git tag $MODE $type_flag ${TAGNAME} $message_flag ${MESSAGE} $REV
	;;

	*.list* | *.ls* )
	PATTERN=${PATTERN:-$1}
	git tag --list ${PATTERN}
	;;

	*.remove* | *.rm* | *.delete* )
	TAGNAME=${TAG:-$1}
	TAGNAME=${TAGNAME:-$1}
	TAGNAME=${TAGNAME:?required}

	git tag -d ${TAGNAME}
	;;

	*.show* | *.info* )
	TAGNAME=${TAG:-$1}
	TAGNAME=${TAGNAME:-$1}
	git show ${TAGNAME}
	;;

	*)
	# current revision
	git tag --list $(rev)
	;;
esac
