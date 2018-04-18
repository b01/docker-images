#! /bin/sh

# echo colors
cyan=$(tput setaf 6)
green=$(tput setaf 2)
red=$(tput setaf 1)
norm=$(tput sgr0)

devcheck () {
    mainBranch=$1
    checkBranch=$2

    # When no main-branch is specified, default to this current one.
    if [ -z "$mainBranch" ]; then
        mainBranch="mw/master"
    fi

    # When no branch is specified, use the current one.
    if [ -z "$checkBranch" ]; then
        checkBranch=`git rev-parse --abbrev-ref HEAD`
    fi
    
    echo "${cyan}Checking branch: ${checkBranch}${norm}"

    # Update local remote heads to the latest.
    echo "${cyan}Running get fetch to make sure that your remotes are up-to-date${norm}"
    git fetch --all -p

    # Find the common ancestor between the two branched.
    hash1=`git merge-base $checkBranch $mainBranch`
    hash2=`git rev-parse $mainBranch`

    # Status update.
    echo "hash ${cyan}'${hash2}'${norm} is the latest commit for ${cyan}${mainBranch}${norm}"

    echo "hash ${cyan}'${hash1}'${norm} is the common ancestor for ${cyan}${checkBranch}${norm} and ${cyan}${mainBranch}${norm}"

    # Compate to see if your branch is rebased.
    if [ "$hash1" = "$hash2" ]; then
        echo "${green}We're good to go.${norm}";
    else
        echo "${red}We're NOT good to go${norm}"
    fi
}
