
export PWD_ORIGN=pwd
echo Origin: $PWD_ORIGIN

cd /Users/Shared/Projects/d/tmp

export DIR=dotnet-test/
rm -fr $DIR && mkdir $DIR && cd $DIR

export TFMS=\
"
net9.0
net8.0
net6.0
"

export PROJECT_TYPES=\
"
maui
mauiapp
maui-blazor
maui-blazor-web
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for TFM in $TFMS
do
    if [[ $TFM == "#"* ]]
    then
        continue
    fi

    echo "--------------------------------------------------------------------------------------------------------------"
    echo TFM = $TFM

    rm -fr $TFM && mkdir $TFM && cd $TFM
    
    for PROJECT_TYPE in $PROJECT_TYPES
    do
        if [[ $PROJECT_TYPE == "#"* ]]
        then
            continue
        fi

        dotnet new \
            $PROJECT_TYPE \
                -f $TFM \
                -o AppMAUI.$PROJECT_TYPE.$TFM

    done

    cd ../

    echo "-----------------------------------------------------------------------------------------------------------------"
done


for TFM in $TFMS
do
    if [[ $TFM == "#"* ]]
    then
        continue
    fi

    echo "--------------------------------------------------------------------------------------------------------------"
    echo TFM = $TFM

    cd $TFM
    
    for PROJECT_TYPE in $PROJECT_TYPES
    do
        if [[ $PROJECT_TYPE == "#"* ]]
        then
            continue
        fi

        dotnet build \
            AppMAUI.$PROJECT_TYPE.$TFM/**/*.csproj

        dotnet build \
            AppMAUI.$PROJECT_TYPE.$TFM/**/*.sln
    done

    cd ../

    echo "-----------------------------------------------------------------------------------------------------------------"
done


export PROJECT_TYPES=\
"
comet
maui-dx
maui-multiproject
blankmaui
hw-maui-sample-repro
hw-aspire-clients-maui
hw-aspire-clients-maui-bret
enterprisemaui
fabulous-mauicontrols
sun.maui
maui-micro
maui-reactor-startup
maui-reactor-appshell
shardeclasslib
shinymaui
unomauilib
uranium-app
uranium-blank-app
"

for PROJECT_TYPE in $PROJECT_TYPES
do
    if [[ $PROJECT_TYPE == "#"* ]]
    then
        continue
    fi

    dotnet new \
        $PROJECT_TYPE \
            -o AppMAUI.$PROJECT_TYPE

done

for PROJECT_TYPE in $PROJECT_TYPES
do
    if [[ $PROJECT_TYPE == "#"* ]]
    then
        continue
    fi

    dotnet build \
        AppMAUI.$PROJECT_TYPE

done
