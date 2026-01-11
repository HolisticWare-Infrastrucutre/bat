#!/usr/local/share/dotnet/dotnet run

#:sdk Microsoft.NET.Sdk

#:package System.CommandLine@2.0.1
#:package Spectre.Console@0.54.0

using System;
using System.IO;


string base_path = Directory.GetCurrentDirectory();

Console.WriteLine($"Creating project structure in: {base_path}");

string[] directories = new[]
{
    "source",
    "source/business-domain-logic-models/",
    "source/user-interface-ui/",
    "source/utilities/",
    "tests/",
    "tests/unit-tests/",
    "tests/benchmark-tests/",
    "tests/common/",
    "docs/",
    "configs/",
    "scripts/"
};

foreach (string dir in directories)
{
    string full_path = Path.Combine(base_path, dir);
    Directory.CreateDirectory(full_path);
    Console.WriteLine($"Created directory: {full_path}");
}

(
    string file,
    string content,
    string url
)[]
                                        files = new[]
{
    (
        "Directory.Build.props",
        """
        <Project>
            <PropertyGroup>
                <TargetFrameworks>net9.0,net10.0</TargetFrameworks>
                <ImplicitUsings>enable</ImplicitUsings>

                <!-- 
                Assemblies should be deterministic
                -->
                <Deterministic>true</Deterministic>

                <!-- 
                Generate NRT annotations 
                <Nullable>enable</Nullable>
                -->
                <Nullable Condition=" '$(Nullable)' == '' ">enable</Nullable>

                <StructuredDataForGenAI Condition=" '$(StructuredDataForGenAI)' == '' ">enable</StructuredDataForGenAI>

                <!-- 
                Warnings we want to error on: 
                -->
                <!--
                NU5104: A stable release of a package should not have a prerelease dependency. 
                -->
                <WarningsAsErrors>$(WarningsAsErrors)</WarningsAsErrors>
            </PropertyGroup>


            <PropertyGroup Condition=" '$(StructuredDataForGenAI)' != 'enable' ">
                <!--
                BG8102: Class 'foo' has unknown base type 'foo'.
                BG8103: Class 'foo' has invalid base type 'foo'.
                BG8300: For constructor 'foo', could not find enclosing type 'foo'.
                BG8400: Unexpected field type `foo` (foo).
                BG8401: Skipping 'foo' due to a duplicate nested type name. (Java type: 'foo')
                BG8402: Skipping 'foo' due to a duplicate field. (Java type: 'foo')
                BG8403: Type 'foo' has a type name which matches the enclosing namespace name. See https://aka.ms/BG8403 for more information.
                BG8501: No event name provided in 'foo'.
                BG8502: Invalidating 'IFoo' and all its nested types because some of its interfaces were invalid.
                BG8503: Invalidating 'IFoo' and all its nested types because some of its methods were invalid.
                BG8504: Event name for 'foo' is invalid. A valid 'eventName' or 'argsType' can be assigned by adding a rule to the Metadata.xml transforms file.
                BG8601: No '<package>' elements found.
                BG8604: Could not find top ancestor type 'foo' for nested type 'foo'.
                BG8605: The Java type 'foo' could not be found (are you missing a Java reference jar/aar or a Java binding library NuGet?)
                BG8606: Some types or members could not be bound because referenced Java types could not be found. See the 'java-resolution-report.log' file for details.
                BG8700: Unknown return type 'foo' for member 'foo'.
                BG8701: Invalid return type 'foo' for member 'foo'.
                BG8800: Unknown parameter type 'foo' for member 'foo (foo)'.
                BG8801: Invalid parameter type 'foo' for member 'foo'.
                BG8A00: Metadata.xml element '<foo>' matched no nodes.
                BG8A01: Metadata.xml element '<add-node path="foo" />' matched no nodes.
                BG8A04: Metadata.xml element '<attr path="foo" />' matched no nodes.
                BG8B00: Unknown generic argument constraint type 'S' for member 'foo'.
                BG8C00: Could not find base interface 'foo' for type 'foo'.
                BG8C01: For type 'IFoo', base interface 'foo' is invalid.
                -->
                <NoWarn Condition=" '$(_AndroidIgnoreGeneratorWarnings)' == 'true' ">$(NoWarn);BG8102;BG8103;BG8300;BG8400;BG8401;BG8402;BG8403;BG8501;BG8502;BG8503;BG8504;BG8601;BG8604;BG8605;BG8606;BG8700;BG8701;BG8800;BG8801;BG8A00;BG8A01;BG8A04;BG8B00;BG8C00;BG8C01;nullable</NoWarn>
            </PropertyGroup>

        <PropertyGroup Condition=" '$(StructuredDataForGenAI)' == 'enable' ">
            <ErrorLog>./obj/$(Configuration)/$(MSBuildProjectName).sarif.json</ErrorLog>
        </PropertyGroup>
        </Project>        
        """,
        ""
    ),
    (
        "NuGet.config",
        """
        <?xml version="1.0" encoding="utf-8"?>
        <configuration>
            <packageSources>
                <clear />
                <add key="local project"    value="..\output" />
                <add key="local user"       value="%HOME%\nuget-local" />
                <add key="nuget.org"        value="https://api.nuget.org/v3/index.json" />
                <!--
                -->
            </packageSources>
            <!--
                https://docs.microsoft.com/en-us/nuget/consume-packages/package-source-mapping
                Define mappings by adding package patterns beneath the target source.
            -->
            <packageSourceMapping>
                <!-- key value for <packageSource> should match key values from <packageSources> element -->
                <!--
                packages restored from "Local Output":
                -->
                <packageSource key="local project">
                    <package pattern="HolisticWare.*" />
                </packageSource>
                <packageSource key="local user">
                    <package pattern="HolisticWare.*" />
                </packageSource>
                <!--
                packages restored from nuget.org:
                    everything else
                -->
                <packageSource key="nuget.org">
                    <package pattern="*" />
                    <!--
                        9999.0.0 published, but delisted
                    -->
                </packageSource>
            </packageSourceMapping>
            <config>
                <add key="globalPackagesFolder" value="../externals/packages" />
            </config>
        </configuration>
        """,
        ""
    ),
};

foreach (string dir in directories)
{
    foreach ((string file, string content, string url) t in files)
    {
        string full_path = Path.Combine(base_path, dir, t.file);
        string file_content = t.content;

        if (string.IsNullOrEmpty(t.content) && !string.IsNullOrEmpty(t.url))
        {
            // Fetch content from URL
            using var httpClient = new HttpClient();
            file_content = httpClient.GetStringAsync(t.url).Result;
        }
        else if (string.IsNullOrEmpty(t.content) && string.IsNullOrEmpty(t.url))
        {
            file_content = "";
        }
        else if (!string.IsNullOrEmpty(t.content) && string.IsNullOrEmpty(t.url))
        {
            // content is already provided, do nothing
        }
        else if (!string.IsNullOrEmpty(t.content) && !string.IsNullOrEmpty(t.url))
        {
            throw new InvalidOperationException("Both content and url cannot be provided simultaneously.");
        }

        File.WriteAllText(full_path, file_content);
        Console.WriteLine($"Created file: {full_path}");
    }
}

string[] projects = new[]
{
    """
    dotnet \
        new \ 
            classlib \ 
            --output source/business-domain-logic-models/HolisticWare.Core.BusinessDomainLogicModels \ 

    """,
    """
    dotnet \
        new \ 
            classlib \ 
            --output source/user-interface-ui/HolisticWare.Core.UserInterfaceUI \ 

    """,
    """
    dotnet \
        new \ 
            mauilib \ 
            --output source/user-interface-ui/HolisticWare.Core.UserInterfaceUI.MAUI \ 

    """,
    """
    dotnet \
        new \ 
            razorlib \ 
            --output source/user-interface-ui/HolisticWare.Core.UserInterfaceUI.Razor \ 

    """,
    """
    dotnet \
        new \ 
            classlib \ 
            --output source/utilities/Utilities \ 
    """,
    """
    dotnet \
        new \ 
            classlib \ 
            --name HolisticWare.Core.UnitTests \ 
            --output tests/unit-tests/UnitTests \ 
            --framework net10.0
    """,
    """
    dotnet \
        new \ 
            classlib \ 
            --name HolisticWare.Core.BenchmarkTests \ 
            --output tests/benchmark-tests/BenchmarkTests \ 
            --framework net10.0
    """,
    "tests/common/CommonTests.csproj"
};

Console.WriteLine("Project structure created successfully.");


/*
git init
git add .
git commit -m "initial commit - a new thing"

# https://cli.github.com/manual/gh_repo_create

# ALIASES
# gh repo new

# Create a repository interactively
# gh repo create

# Create a new remote repository and clone it locally
# gh repo create my-project --public --clone

# Create a new remote repository in a different organization
# gh repo create my-org/my-project --public

# Create a remote repository from the current directory
# gh repo create my-project --private --source=. --remote=upstream

# https://github.com/github/gitignore
# https://choosealicense.com/
# https://stackoverflow.com/questions/17066250/create-timestamp-variable-in-bash-script
export TIMESTAMP=date +%Y%m%dT%H%M%S
export REPO_NAME=HolisticWare-Libraries/HolisticWare.Core.Domain.$TIMESTAMP
gh \
    repo \
        create \
            --public \
            --add-readme \
            --gitignore VisualStudio \
            --license MIT \



# gh repo create my-newrepo --public --source=. --remote=upstream --push

*/