#!/usr/local/share/dotnet/dotnet run

#:sdk Microsoft.NET.Sdk

#:package System.CommandLine@2.0.1

#:package Spectre.Console@0.54.0
#:package ZString@2.6.0

using System;
using System.IO;

string dir_curent = Directory.GetCurrentDirectory();
string dir_executing = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);

Console.WriteLine($"Directory Current   : {dir_curent}");
Console.WriteLine($"Directory Executing : {dir_executing}");

string app_name = args.Length > 0 ? args[0] : "AppSuite";
string app_dir = Path.Combine($"{dir_curent}", app_name);



string[] directories =
                        [
                            "./source",
                            "./source/business-domain-logic-models",
                            "./source/utilities",
                            "./source/user-interface-ui",
                            "./tests",
                            "./tests/benchmark-tests",
                            "./tests/unit-tests",
                            "./tests/common",
                            "./.claude",
                            "./docs",
                            "./samples",
                            "./samples/client",
                            "./samples/server",
                            "./configs",
                            "./scripts",
                            "./.github",
                            "./.github/instructions",
                            "./.github/ISSUE_TEMPLATE",
                            "./.github/workflows",
                            "./.github/agents",
                            "./.github/agents/skills",
                            "./.github/hooks",
                            "./.github/prompts",
                            "./.github/skills",
                            "./.vscode",
                        ];
