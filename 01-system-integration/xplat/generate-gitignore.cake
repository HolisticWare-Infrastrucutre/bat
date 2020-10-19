#addin nuget:?package=Cake.Http

/*
dotnet cake ./generate-gitignore.cake > ./generated/.gitignore 
*/

using System;
using System.Linq;
new string[] gitignores = new string[]
{
    "https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Global/Windows.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Global/VisualStudioCode.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Android.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Gradle.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Java.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Kotlin.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Maven.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Global/Xcode.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Objective-C.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Swift.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Unity.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/C%2B%2B.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/C.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/CMake.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Autotools.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Julia.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/Global/MATLAB.gitignore",
    "https://raw.githubusercontent.com/github/gitignore/master/R.gitignore",
};

foreach(string gi in gitignores)
{
    Information($"# {new String('=', 120)}");
    Information($"# {String.Concat(Enumerable.Repeat("--", 60))}");

    Information($"# .gitignore: {gi}");
    string response_body = HttpGet(gi);
    Information(response_body);

}

