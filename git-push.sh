printf "> git pull\n"
git pull
printf "> git add .\n"
git add .
printf '> git commit -m $@\n'
git commit -m "$@"
printf "> git push\n"
git push
