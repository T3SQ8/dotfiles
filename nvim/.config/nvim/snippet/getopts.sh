while getopts ab: flag; do
	case $flag in
		a) var=1;;
		b) carg=$OPTARG;;
		*) echo "$USAGE"; exit 1;;
	esac
done
shift "$((OPTIND - 1))"
