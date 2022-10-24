targetScope = 'resourceGroup'

@description('Company Name')
@minLength(3)
@maxLength(11)
param companyName string

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
param environmentName string

@description('Application Name')
@allowed([
  'SFTP'
])
param applicationName string

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

@description('Company Name')
output companyName string = companyName

@description('Location (Region) Name')
output locationName string = locationName

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
