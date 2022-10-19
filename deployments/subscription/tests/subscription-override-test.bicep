targetScope = 'subscription'

@description('Company Name')
@allowed([
  'Neudesic'
  'IBM'
  'TennCare'
  'MJCConsulting'
  'CaMeLz'
])
param companyName string = 'TennCare'

@description('Environment Name')
@allowed([
  'Production'
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
output environmentNameOutput string = environmentName
output parameterSourceOutput string = parameterSource
