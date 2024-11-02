githunt () 
    {for commit in $(git log --all --pretty=format:%H -- $1);
        do echo -n "$commit ";
        git show $commit:$1 | md5sum;
        done
    | grep $2
    }