targetScope = 'resourceGroup'

@description('Location')
param location string = resourceGroup().location

@description('Company Name')
@minLength(3)
@maxLength(20)
param companyName string

@description('Environment Name')
@minLength(3)
@maxLength(20)
param environmentName string

@description('Application Name')
@maxLength(20)
param applicationName string = ''

@description('Component Name')
@maxLength(20)
param componentName string = ''

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

// Extra param only in this CaMeLz variant, used to test alternate variant additional params
@description('Parameter Source Unique to CaMeLz')
@allowed([
  'Template'
  'ParametersFile'
  'EnvParametersFile'
  'CustomParametersFile'
  'CustomEnvParametersFile'
  'CommandLine'
])
param parameterSourceCaMeLz string = 'Template'

// Extra param only in this CaMeLz variant, used to test alternate variant additional params, and param overrides
@description('Parameter Test Used to Test Override')
param parameterTest string

// Extra param only in this CaMeLz variant, used to test alternate variant additional params, and complex object param overrides
@description('Network Security Group Settings, an example of a complex object parameter')
param networkSecurityGroupsSettings object = {
  securityRules: [
    {
      name: 'RDPAllow'
      description: 'allow RDP connections'
      direction: 'Inbound'
      priority: 100
      sourceAddressPrefix: '*'
      destinationAddressPrefix: '10.0.0.0/24'
      sourcePortRange: '*'
      destinationPortRange: '3389'
      access: 'Allow'
      protocol: 'Tcp'
    }
  ]
}

@description('Location')
output location string = location

@description('Company Name')
output companyName string = companyName

@description('Environment Name')
output environmentName string = environmentName

@description('Application Name')
output applicationName string = applicationName

@description('Component Name')
output componentName string = componentName

@description('Parameter Source')
output parameterSource string = parameterSource

@description('Parameter Source Unique to CaMeLz')
output parameterSourceCaMeLz string = parameterSourceCaMeLz

@description('Parameter Test Used to Test Override')
output parameterTest string = parameterTest

@description('Network Security Group Settings, an example of a complex object parameter')
output networkSecurityGroupsSettings object = networkSecurityGroupsSettings
