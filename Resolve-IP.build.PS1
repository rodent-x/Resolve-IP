###############################################################################
# PSHitchhiker.build.ps1, Note that we do not have to pre-define/inject hooks
###############################################################################

# Synopsis: Clean Artifacts Directory
task Clean{

$Artifacts = "$PSScriptRoot\Artifacts"
$Artifacts

   if(Test-Path -Path $Artifacts)
    {
        Remove-Item "$Artifacts" -Recurse -Force
    }

    New-Item -ItemType Directory -Path $Artifacts -Force
    
    # Temp: Clone since this project is not currently available through PackageManagement
    & git clone https://github.com/Xainey/PSTestReport.git
}

###############################################################################
# PSHitchhiker.settings.ps1, Note that we do not have to define dummy hooks
###############################################################################

# Synopsis: Executes before the Clean task.
 task BeforeClean -Before Clean {}

# Synopsis: Executes after the Clean task.
 task AfterClean -After Clean {}


# Synopsis: Install Build Dependencies
task InstallDependencies {
    # Cant run an Invoke-Build Task without Invoke-Build.
    # Install-Module -Name InvokeBuild -Force
    
    Install-Module -Name DscResourceTestHelper -Force
    Install-Module -Name Pester -Force
    Install-Module -Name PSScriptAnalyzer -Force
}