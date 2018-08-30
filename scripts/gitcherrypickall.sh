declare -a REPOS=("sg" "ae" "ph" "th" "om" "id" "sa" "hk")
for country in "${REPOS[@]}"
    do
        if [ ! -d $country ]; then
git checkout dev;
git pull;
git checkout staging-$country;
git reset --hard origin/staging-$country;
git cherry-pick $1;
git push origin staging-$country;
fi
done
git checkout dev;