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
    "source/business-domain-logic/",
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
