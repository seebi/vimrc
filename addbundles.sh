for dir in `git st bundle | grep "??" | cut -d " " -f 2`;
do
    cd $dir;
    remote=`git remote show origin | grep Fetch | cut -d " " -f 5`;
    cd ../..;
    echo $remote;
    git submodule add $remote $dir;
done
