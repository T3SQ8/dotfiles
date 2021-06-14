printf 'Do you want to continue? [y/N] '; read -r prompt

case $prompt in
	y|Y|yes|Yes|YES) continue ;;
	*) exit 1 ;;
esac
