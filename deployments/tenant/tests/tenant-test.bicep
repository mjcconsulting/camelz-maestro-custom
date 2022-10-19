targetScope = 'tenant'

@description('Built-in role to assign')
@allowed([
  'Owner'
  'Contributor'
  'Reader'
])
param builtInRoleType string = 'Owner'

var builtInRoleTypes = {
  Owner: tenantResourceId('Microsoft.Authorization/roleDefinitions','8e3af657-a8ff-443c-a75c-2fe8c4bcb635')
  Contributor: tenantResourceId('Microsoft.Authorization/roleDefinitions','b24988ac-6180-42a0-ab88-20f7382dd24c')
  Reader: tenantResourceId('Microsoft.Authorization/roleDefinitions','acdd72a7-3385-48ef-bd42-f606fba81ae7')
}

output builtInRoleDefinitionId string = builtInRoleTypes[builtInRoleType]
