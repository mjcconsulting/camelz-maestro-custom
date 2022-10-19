targetScope = 'resourceGroup'

@description('Company Name')
@minLength(3)
@maxLength(11)
param companyName string = 'TennCare'

@description('Location (Region) Name')
@allowed([
  'eastus'
  'eastus2'
  'westus'
  'westus2'
  'centralus'
])
param locationName string = any(resourceGroup().location) // Currently must use the any() workaround

@description('Environment Name')
@allowed([
  'Production'
  'Recovery'
  'NonProduction'
  'Core'
  'Staging'
  'UAT'
  'QA'
  'Testing'
  'Development'
  'Build'
  'Education'
  'Training'
  'Sandbox'
])
param environmentName string = 'Sandbox'

@description('Application Name')
@allowed([
  'SFTP'
])
param applicationName string = 'SFTP'

@description('Component Name')
@allowed([
  'Network'
  'StorageAccount'
])
param componentName string = 'Network'

@description('Parameter Source')
@allowed([
  'Template'
  'ParametersFile'
  'EnvParametersFile'
  'CustomParametersFile'
  'CustomEnvParametersFile'
  'CommandLine'
])
param parameterSource string = 'Template'

output companyNameOutput string = companyName
output locationNameOutput string = locationName
output environmentNameOutput string = environmentName
output applicationNameOutput string = applicationName
output componentNameOutput string = componentName
output parameterSourceOutput string = parameterSource
