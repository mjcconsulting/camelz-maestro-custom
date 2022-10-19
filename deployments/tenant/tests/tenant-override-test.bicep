targetScope = 'tenant'

@description('Company Name')
@allowed([
  'Neudesic'
  'IBM'
  'TennCare'
  'MJCConsulting'
  'CaMeLz'
])
param companyName string = 'TennCare'

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
output parameterSourceOutput string = parameterSource
