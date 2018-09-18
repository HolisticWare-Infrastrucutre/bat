#!/bin/bash

# https://docs.gitlab.com/ee/api/README.html

export GITLAB_API_KEY=

# 330725
export GROUP=holisticware-bindings
export PROJECTS="\
aaaa
bbbb
"


function projects_create()
{
    for PROJECT in $PROJECTS ;
    do
        echo ===========================================================================================
        echo project = $PROJECT

        curl \
            -H "Content-Type:application/json" \
            https://gitlab.com/api/v4/projects?private_token=$GITLAB_API_KEY
            
        curl \
            -H "Content-Type:application/json" \
            https://gitlab.com/api/v4/projects?private_token=$GITLAB_API_KEY \
            -d \
            "
            { 
                \"namespace_id\": \"330725\",
                \"name\": \"$PROJECT\",
                \"description\": \"$PROJECT\",
                \"permissions\": 
                    {
                        \"project_access\": 
                        {
                            \"access_level\": 10,
                            \"notification_level\": 3
                    },
            }
            "

    done

}

function test_code()
{

        curl \
            -H "Content-Type:application/json" \
            https://gitlab.com/api/v4/projects?private_token=$GITLAB_API_KEY \
            -d \
            "
            { 
                \"namespace_id\": \"330725\",
                \"name\": \"Xtras-Binaries-Xtensive-$PROJECT\",
                \"description\": \"Xtras-Binaries-Xtensive-$PROJECT\"
            }
            "
        curl \
            -H "Content-Type:application/json" \
            https://gitlab.com/api/v4/projects?private_token=$GITLAB_API_KEY \
            -d \
            "
            { 
                \"namespace_id\": \"330725\",
                \"name\": \"Xtras-Binaries-Minimal-$PROJECT\",
                \"description\": \"Xtras-Binaries-Minimal-$PROJECT\"
            }
            "

        curl \
            --header "PRIVATE-TOKEN: $GITLAB_API_KEY" \
            https://gitlab.com/api/v4/namespaces

}

function git_clone_project()
{
    export SUBMODULE_PATH=$PROJECT/externals
    git \
        submodule add \
        \
        $SUBMODULE_PATH

    git submodule init
    git submodule update    
    cd $SUBMODULE_PATH
    git status
    git checkout master
    git pull


    git submodule rm $SUBMODULE_PATH
    git rm --cached $SUBMODULE_PATH


}


projects_create



