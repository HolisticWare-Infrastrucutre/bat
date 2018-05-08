$app1 = Get-WmiObject -Class Win32_Product | Where-Object `
{ 
    $_.Name -match "Visual Studio 2015" 
}
$app1.Uninstall()

$app2 = $app = Get-WmiObject `
                    -Class Win32_Product `
                    -Filter "Name = 'Visual Studio 2015'"
$app2.Uninstall()

