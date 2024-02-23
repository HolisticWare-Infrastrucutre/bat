#!/bin/zsh

export DIRECTORY=$(pwd)
echo $DIRECTORY

cd $HOME/Downloads/

dotnet new uninstall   \
        HolisticWare.DotNetNew.Templates.Project.MAUI.AppSampleReproXXXXX.CSharp \
        --verbosity diagnostic

dotnet new install   \
        HolisticWare.DotNetNew.Templates.Project.MAUI.AppSampleReproXXXXX.CSharp \
        --verbosity diagnostic

dotnet new \
    hw-maui-sample-repro \
    --output AppRepro

sudo \
    dotnet workload \
        restore \
            AppRepro/net9.0/ProjectsStructureTemplate.AppMAUI.DemoSample/ProjectsStructureTemplate.AppMAUI.DemoSample.csproj
sudo \
    dotnet workload \
        restore \
            AppRepro/net8.0/ProjectsStructureTemplate.AppMAUI.DemoSample/ProjectsStructureTemplate.AppMAUI.DemoSample.csproj
sudo \
    dotnet workload \
        restore \
            AppRepro/net7.0/ProjectsStructureTemplate.AppMAUI.DemoSample/ProjectsStructureTemplate.AppMAUI.DemoSample.csproj

rm -fr  ./AppRepro

cd $DIRECTORY
