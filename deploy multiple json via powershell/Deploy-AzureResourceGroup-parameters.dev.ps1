#GENERALS VAR
###############
$envType="dev"
$envtrigram="sds"

$ResourceGroup = [string]::Format("RG-APPLI-{0}-{1}",$envtrigram.ToUpper(),$envType.ToUpper())
$ResourceGroupLogAnalytics = "RG-INFRA-MANAGEMENT-PROD"
$subscriptionId = "5f82da32-5cad-49a4-aec5-5ba8806e6d9c" #e.SNCF EPIC de Tête
$Location = "northeurope" 
$workspace = "LOG-ANALYTICS-E2-BIGDATA" # workspace sur OMS
$TimeZone = ([System.TimeZoneInfo]::Local).Id7

#CHOIX DES COMPOSANTS 

$SQLSERVERRequis = $true
$applicationInsightRequis = $true

#AUTOMATION VAR
################

###################################################################
#                   SQL SERVER + DATABASES
####################################################################

$templateSQLSERVER = ".\Resources\SQL_databases\Template_SQL_databases.json"
$templateSQLSERVERParameters = [string]::Format(".\Resources\SQL_databases\Template_SQL_databases-parameters.{0}.json",$envType.ToLower())


###################################################################
#                   Application insights
####################################################################

$templateapplicationInsight = ".\Resources\application_insights\Template_application_insights.json"
$templateapplicationInsightparameters = [string]::Format(".\Resources\application_insights\Template_application_insights_parameters.{0}.json",$envType.ToLower())
