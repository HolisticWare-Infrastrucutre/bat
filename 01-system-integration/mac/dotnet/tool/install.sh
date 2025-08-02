#!/bin/zsh

source $HOME/bat/01-system-integration/mac/01-uninstall-clean-remove-nuke/nuget.sh

# https://learn.microsoft.com/en-us/dotnet/core/tools/global-tools
# https://nuget.org/packages?packagetype=dotnettool
# https://techstacks.io/posts/6970/a-list-of-tools-to-extend-the-net-core-command-line-dotnet
# https://github.com/dotnet/core/blob/main/release-notes/net-package-deprecation.md

export TOOLZ=\
"
dotnet-suggest
boots
git-credential-manager
dotnet-gcm
cs-script.cli
# Xamarin.Android
xamarin.androidbinderator.tool
xamarin.androidx.migration.tool
apkdiff
# Development
dotnet-user-secrets
# Development (MAUI, Uno)
Redth.Net.Maui.Check
Uno.Check
XamlStyler.Console
# Debugging
SourceLink
# Binaries Analysis
api-tools
dotnet-ildasm
dotnet-ilverify
ilspycmd
assembly-differ
assembly-rewriter
ClangSharpPInvokeGenerator
# Migrations
upgrade-assistant
# Services
dotnet-svcutil
# Web
#Aspire
aspirate
# https://playwright.dev/dotnet/docs/intro
Microsoft.Playwright.CLI
NSwag.ConsoleCore
Swashbuckle.AspNetCore.Cli
Rapicgen
Microsoft.dotnet-openapi
dotnet-dev-certs
dotnet-config2json
# https://github.com/SimonCropp/WinDebloat
# Aspire
aspireate
WinDebloat
# HTTP tools
dotnet-serve
dotnet-httpie
Web.Ping
Yardarm.CommandLine
# Serialization Formats
dotnet-xdt
dotnet-xscgen
dotnet-grpc
dotnet-grpc-cli
dotnet-json
protobuf-net.Protogen
Apache.Avro.Tools
MessagePack.Generator
# Code Style / Formatting
editorconfig-tool
dotnet-format
csharpier
# Publishing/Packaging
dotnet-zip
dotnet-deb
dotnet-rpm
dotnet-tarball
dotnet-version-cli
# Data Formats
Corvus.Json.JsonSchema.TypeGeneratorTool
# Documentation
docfx
# templating
dotnet-t4
# Executing/Running
dotnet-mono
dotnet-watch
dotnet-execute
# Package management
dotnet-depends
dotnet-outdated-tool
nukeeper
Snitch
nupkg-validator
DependenSee
dotnet-validate
dotnet-retire
dotnet-search
dotnet-dependency-analyzer
Uno.PackageDiff
dotnet-updatr
# Project Management MSBuild
try-convert
dotnet-references
dotnet-affected
sln-tool
dotnet-nosln
release-notes
Versionize
dotnet-file
dotnet-property
dotnet-cleanup
dependency-analyzer
# Legal / Licensing
dotnet-delice
dotnet-project-licenses
# read-eval-print-loop (REPL)/Scripting
dotnet-script
csharprepl
dotnet-repl
Microsoft.dotnet-interactive
# Diagnostic tools
dotnet-monitor
dotnet-sos
dotnet-trace
dotnet-counters
dotnet-dump
dotnet-gcdump
dotnet-gcmon
dotnet-dsrouter
dotnet-stack
dotnet-symbol
# Testing Coverage
dotnet-coverage
coverlet.console
JetBrains.dotCover.GlobalTool
minicover
coveralls.net
altcover.visualizer
JetBrains.dotTrace.GlobalTools
# Deployment
dotnet-sshdeploy
# Testing
NUnit.ConsoleRunner.NetCore
xunit-cli
dotnet-stryker
# Testing Benchmarking
BenchmarkDotNet.Tool
Microsoft.Crank.Agent
# Cloud.Orchestrating
microsoft.tye 
# Web
Microsoft.dotnet-httprepl
Microsoft.dotnet-openapi
wyam.tool
dotnet-vs
dotnet-ignore
dotnet-cleanup
dotnet-depends
dotnet-obfuscar
nukeeper
dotnet-releaser
NuSight
# Security
# Security.Packages.Dependencies
dotnet-retire
NuGetDefense.Tool
NuGet.PackageSourceMapper
dotnetarium-scs
dotnet-ossindex
# Security.StaticAnalysis
security-scan
Microsoft.CST.DevSkim.CLI
# Security.Obfuscation
Obfuscar.GlobalTool 
# Security
Microsoft.CST.AttackSurfaceAnalyzer.CLI
Microsoft.CST.OSSGadget.FindSquats.CLI
# Database
dotnet-ef
dotnet-orm
dotnet-roundhouse
# AI/ML
MLNet
# Embedded
WildernessLabs.Meadow.CLI
nanoclr
"

export TOOLZ_PREVIEWS=\
"
cake.tool
aspire.cli
"


IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for TOOL in $TOOLZ
do
    if [[ $TOOL == "#"* ]]
    then
        echo "......................................................................"
        echo $TOOL
        continue
    fi

    echo "Tool: $TOOL"
    echo "      uninstalling"
    dotnet tool uninstall   \
        --global \
            $TOOL

    echo "      installing"
    dotnet tool install \
        --global \
            $TOOL \
            --version "*-*" \
            --verbosity diagnostic
done

for TOOL in $TOOLZ_PREVIEWS
do
    if [[ $TOOL == "#"* ]]
    then
        echo "......................................................................"
        echo $TOOL
        continue
    fi

    echo "Tool: $TOOL"
    echo "      uninstalling"
    dotnet tool uninstall   \
        --global \
            $TOOL

    echo "      installing"
    dotnet tool install \
        --global \
            $TOOL \
            --version "*-*" \
            --verbosity diagnostic
done

dotnet tool list --global
