resource "azurerm_user_assigned_identity" "github" {
  name                = "gh-kv-reader"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_federated_identity_credential" "github_main" {
  name                = "github-main"
  resource_group_name = azurerm_resource_group.rg.name
  parent_id           = azurerm_user_assigned_identity.github.id

  issuer   = "https://token.actions.githubusercontent.com"
  subject  = "repo:ORG/REPO:ref:refs/heads/main"
  audience = ["api://AzureADTokenExchange"]
}

resource "azurerm_role_assignment" "kv_secrets_user" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.github.principal_id
}