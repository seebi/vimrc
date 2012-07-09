unset LANG
for dir in `git status -sb bundle | grep "??" | cut -d " " -f 2`;
do
    cd $dir;
    remote=`git remote show origin | grep Fetch | cut -d " " -f 5`;
    cd ../..;
    echo $remote;
    echo git submodule add $remote $dir;
    git submodule add $remote $dir;
done
