declare -a REPOS=("sg" "ae" "ph" "th" "om" "id" "hk" "sa")
git checkout dev;
git pull origin dev;
for country in "${REPOS[@]}"
do
  if [ ! -d $country ]; then
    git checkout dev;
    git pull origin dev;
    git branch -D staging-$country;
    git push origin :staging-$country;
    git pull origin staging-$country;
    git checkout -b staging-$country;
    git push origin staging-$country;
  fi
done
git checkout dev;



