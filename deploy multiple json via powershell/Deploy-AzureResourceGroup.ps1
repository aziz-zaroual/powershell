##########IMPORT DES VARIABLES SELON LENVRIONNEMENT############################################################

param (
    [Parameter(Mandatory = $true)][string]$ENV
)
 
#IMPORT PARAMETERS AND VARIABLES FOR TARGET ENVIRONMENT

try {
    . .\Deploy-AzureResourceGroup-parameters.$ENV.ps1 -ErrorAction Stop
}
catch {
    Write-Warning -Message "$($_.Exception.Message)"
}

############################################################################################################################   
#                                                   PROGRAM 
############################################################################################################################

############################################ 
#       SQL SERVER & DABABASES 
############################################

if ( $SQLSERVERRequis -eq $true) {
    New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateFile $templateSQLSERVER -TemplateParameterFile $templateSQLSERVERParameters -Force -Verbose -ErrorVariable ErrorMessages
}
else {
    Write-Output "no SQL SERVER & DABABASES required"    
}


############################################ 
#       Application Insights 
############################################

if ( $applicationInsightRequis -eq $true) {
    New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateFile $templateapplicationInsight -TemplateParameterFile $templateapplicationInsightparameters -Force -Verbose -ErrorVariable ErrorMessages
}
else {
    Write-Output "no Application Insights required"    
}
