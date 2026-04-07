#!/usr/local/share/dotnet/dotnet run

#:sdk Microsoft.NET.Sdk

#:package System.CommandLine@2.0.1

#:package Spectre.Console@0.54.0
#:package ZString@2.6.0


using Spectre.Console.Rendering;

string base_path = Directory.GetCurrentDirectory();

Console.WriteLine($"Searching for mmd (Mermaid) files for wrapping into md (Markdown): {base_path}");

string[] files_mmd = Directory.GetFiles
                                (
                                    base_path,
                                    "*.mmd",
                                    SearchOption.AllDirectories
                                );

string md_content =
                    """
                    # `%Title%`
                    
                    <!--
                    generated
                    valid only if timestamp of *.mmd <= *.mmd.md
                    -->

                    ```mermaid
                    %Content%
                    ```
                    
                    """
                    ;

foreach (string file in files_mmd)
{
    string file_name = Path.GetFileNameWithoutExtension(file);
    string? directory_name = Path.GetDirectoryName(file);
    string[] file_content_lines = await File.ReadAllLinesAsync(file);
    string? class_name = null;

    foreach (string line in file_content_lines)
    {
        string line_tmp = line.Trim().ToLower();

        if (line_tmp.Contains("class ") && !line_tmp.EndsWith("{"))
        {
            class_name = line_tmp.Split("class ")[1].Trim();
            break;
        }
    }
    string file_content = string.Join(Environment.NewLine, file_content_lines);

    string md_content_filled = md_content
                                .Replace("%Title%", class_name ?? file_name)
                                .Replace("%Content%", file_content);

    string md_file_path = Path.Combine(directory_name!, $"{file_name}.mmd.g.md");
    await File.WriteAllTextAsync(md_file_path, md_content_filled);

    Console.WriteLine($"Converted: {file} -> {md_file_path}");
}
/*
Parallel.ForEach
            (
                files_mmd,
                async file =>
                {
                    // some pre stuff
                    string[] file_content_lines = await File.ReadAllLinesAsync(file);
                    foreach (string line in file_content_lines)
                    {
                        if (line.Contains("")
                    }

                    // some post stuff
                }
            );
*/

