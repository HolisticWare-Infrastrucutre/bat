# dotnet workload search 

$data = 
@(
    [pscustomobject]
    @{
        workload='android';
    },
    [pscustomobject]
    @{
        workload='android-aot';
    },
    [pscustomobject]
    @{
        workload='ios';
    },
    [pscustomobject]
    @{
        workload='maccatalyst';
    },
    [pscustomobject]
    @{
        workload='macos';
    },
    [pscustomobject]
    @{
        workload='tvos';
    },
    [pscustomobject]
    @{
        workload='wasm-tools';
    },

    [pscustomobject]
    @{
        workload='maui-android';
    },
    [pscustomobject]
    @{
        workload='maui-desktop';
    },
    [pscustomobject]
    @{
        workload='maui-ios';
    },
    [pscustomobject]
    @{
        workload='maui-maccatalyst';
    },
    [pscustomobject]
    @{
        workload='maui-mobile';
    }
    [pscustomobject]
    @{
        workload='maui-windows';
    },
    [pscustomobject]
    @{
        workload='maui';
    }
)



"#######################################################################################################################"
foreach ( $node in $data )
{
    "Item: [$node]"
    dotnet workload uninstall `
        $node.workload 
}
foreach ( $node in $data )
{
    "Item: [$node]"
    dotnet workload install `
        $node.workload 
}
