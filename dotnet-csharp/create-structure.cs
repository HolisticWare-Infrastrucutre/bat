#!/usr/local/share/dotnet/dotnet run

#:sdk Microsoft.NET.Sdk

using System;
using System.IO;


string base_path = Directory.GetCurrentDirectory();

Console.WriteLine($"Creating project structure in: {base_path}");