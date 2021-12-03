#Requires -Module Pester
function Test-BeLastExitCode0 ([string] $ActualValue, [switch] $Negate, [string] $Because) {

    $succeeded = $LASTEXITCODE -eq 0 -ne $Negate

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = "Expected LASTEXITCODE is not 0$(if($Because) { " because $Because"})."
        } else {
            $failureMessage = "Expected LASTEXITCODE is 0$(if($Because) { " because $Because"})."
        }
    }

    return [pscustomobject]@{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

Add-ShouldOperator -Name BeLastExitCode0  -InternalName Test-BeLastExitCode0 -Test ${function:Test-BeLastExitCode0}