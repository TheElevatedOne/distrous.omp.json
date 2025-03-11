printf "> git pull\n"
git pull
printf "> git add .\n"
git add .
printf '> git commit\n'
git commit -m "$@"
printf "> git push\n"
git push
