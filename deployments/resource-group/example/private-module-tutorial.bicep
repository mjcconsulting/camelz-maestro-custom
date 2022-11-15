targetScope = 'resourceGroup'

@description('Location')
param location string = resourceGroup().location

@description('Company Name')
param companyName string

@description('Environment Name')
param environmentName string

@description('Application Name')
param applicationName string = 'Toy'

@description('AppService Application Name')
param appServiceAppName string = '${environmentName}-${applicationName}-${uniqueString(resourceGroup().id)}'

@description('AppService Plan SKU')
param appServicePlanSkuName string = 'F1'

@description('CDN Profile Name')
param cdnProfileName string = '${environmentName}-${applicationName}-CDN-${uniqueString(resourceGroup().id)}'

@description('CDN Endpoint Name')
param cdnEndpointName string = '${environmentName}-${applicationName}-Endpoint-${uniqueString(resourceGroup().id)}'

@description('Deploy a CDN in front of the App')
param deployCdn bool = true

var appServicePlanName = '${appServiceAppName}-Plan'

module app 'br/private:example/app:0.9' = {
  name: '${applicationName}-App'
  params: {
    location: location
    companyName: companyName
    environmentName: environmentName
    applicationName: applicationName
    componentName: 'App'
    appServiceAppName: appServiceAppName
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
  }
}

module cdn 'br/private:example/cdn:0.9' = if (deployCdn) {
  name: '${applicationName}-CDN'
  params: {
    companyName: companyName
    environmentName: environmentName
    applicationName: applicationName
    componentName: 'CDN'
    originHostName: app.outputs.appServiceAppHostName
    profileName: cdnProfileName
    endpointName: toLower(cdnEndpointName)
    httpsOnly: true
  }
}

@description('Website Host Name')
output websiteHostName string = deployCdn ? cdn.outputs.endpointHostName : app.outputs.appServiceAppHostName
