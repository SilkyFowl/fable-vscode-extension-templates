BeforeDiscovery {
    Import-Module "$PSScriptRoot/MyCustomAssertions.psm1" -DisableNameChecking
}

BeforeAll {

    # nupkgSettings
    $templateName = "fable-vscode"
    $nupkgId = "Fable.VsCode.Extention.Template"
    $nupkgPath = Split-Path $PSScriptRoot | Join-Path -ch bin -a Debug, "$nupkgId.*.nupkg" -Resolve

    dotnet new --list
    | Select-String $templateName
    | ForEach-Object { dotnet new --uninstall $nupkgId }

    dotnet new --install $nupkgPath

    Set-Location TestDrive:\
}

Describe "Should be able to create Project" {

    It "by <packagemaneger>" -TestCases @(
        @{ PackageManeger = "npm" }
        @{ PackageManeger = "yarn" }
        @{ PackageManeger = "pnpm" }
    ) {
        dotnet new fable-vscode -p $PackageManeger | Should -BeLastExitCode0
        
        & $PackageManeger install | Should -BeLastExitCode0
        
        # Dummy settings 
        $config = Get-Content TestDrive:\package.json | ConvertFrom-Json
        $config | Add-Member repository ([pscustomobject]@{type="git"; url=""})
        $config | ConvertTo-Json -Depth 20 | Set-Content TestDrive:\package.json
        New-Item TestDrive:\LICENSE

        & $PackageManeger run pack | Should -BeLastExitCode0
    }

    AfterEach {
        Remove-Item TestDrive:\* -Recurse -Force
    }
}

AfterAll {
    dotnet new --uninstall $nupkgId
    Set-Location -
}