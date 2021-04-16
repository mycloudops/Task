module "cognito" {
  source                   = "./modules/cognito"
  create_user_pool         = true
  user_pool_name           = "Task-Demo-Pool"
  env                      = "dev"
  username_attributes      = ["email"]
  auto_verified_attributes = []
  mfa_configuration        = "OPTIONAL"
  software_token_mfa_configuration = {
    enabled = true
  }
  username_configuration = {
    case_sensitive = false
  }
  number_schemas = [
    {
      name                = "email"
      attribute_data_type = "String"
      mutable             = false
      required            = true
      number_attribute_constraints = {
        min_length = 1
        max_length = 20
      }
    }
  ]
  string_schemas = [
    {
      name                = "name"
      attribute_data_type = "String"
      mutable             = false
      required            = true
      string_attribute_constraints = {
        min_length = 13
        max_length = 13
      }
    },
    {
      name                = "age"
      attribute_data_type = "Number"
      mutable             = true
      required            = false
      string_attribute_constraints = {
        min_length = 1
        max_length = 100
      }
    },
    {
      name                = "date_of_birth"
      attribute_data_type = "String"
      mutable             = true
      required            = false
      string_attribute_constraints = {
        min_length = 10
        max_length = 10
      }
    }
  ]

  client_name                          = "demoClient"
  explicit_auth_flows                  = ["ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
  generate_secret                      = false
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["email", "openid"]
  callback_urls                        = ["https://google.com"]
  logout_urls                          = []
  refresh_token_validity               = 10
  id_token_validity                    = 5
  access_token_validity                = 5
}
