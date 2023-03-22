targetScope = 'resourceGroup'

@description('Location')
param location string = resourceGroup().location

@description('Company Name')
@minLength(3)
@maxLength(20)
param companyName string

@description('Environment Name')
@minLength(1)
@maxLength(20)
param environmentName string

@description('Application Name')
@maxLength(20)
param applicationName string = ''

@description('Component Name')
@minLength(3)
@maxLength(20)
param componentName string = 'VNet'

@description('VNet name')
param vnetName string = '${environmentName}-${applicationName != '' ? '${applicationName}-' : ''}${componentName}'

@description('Address prefix')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('Subnet 0 Prefix')
param subnet0Prefix string = '10.0.0.0/24'

@description('Subnet 0 Name')
param subnet0Name string = 'Subnet0'

@description('Subnet 1 Prefix')
param subnet1Prefix string = '10.0.1.0/24'

@description('Subnet 1 Name')
param subnet1Name string = 'Subnet1'

@description('Subnet 2 Prefix')
param subnet2Prefix string = '10.0.2.0/24'

@description('Subnet 2 Name')
param subnet2Name string = 'Subnet2'

@description('Subnet 3 Prefix')
param subnet3Prefix string = '10.0.3.0/24'

@description('Subnet 3 Name')
param subnet3Name string = 'Subnet3'

@description('Subnet 4 Prefix')
param subnet4Prefix string = '10.0.4.0/24'

@description('Subnet 4 Name')
param subnet4Name string = 'Subnet4'

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet0Name
        properties: {
          addressPrefix: subnet0Prefix
        }
      }
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
      {
        name: subnet3Name
        properties: {
          addressPrefix: subnet3Prefix
        }
      }
      {
        name: subnet4Name
        properties: {
          addressPrefix: subnet4Prefix
        }
      }
    ]
  }
  tags: {
    Company: companyName
    Environment: environmentName
    Application: applicationName
    Component: componentName
  }
}

@description('Custom Modification')
output customModification string = 'This module was overridden within the camelz-maestro-custom repo'
