resource "aws_cognito_user_pool" "pool" {
  name                     = "${var.user_pool_name}-${var.env}"
  alias_attributes         = var.alias_attributes
  username_attributes      = var.username_attributes
  auto_verified_attributes = var.auto_verified_attributes
  mfa_configuration        = var.mfa_configuration

  username_configuration {
    case_sensitive = false
  }

  software_token_mfa_configuration {
    enabled = true
  }

  lifecycle {
    ignore_changes = ["schema"]
  }

  dynamic "schema" {
    for_each = var.string_schemas == null ? [] : var.string_schemas
    content {
      attribute_data_type = lookup(schema.value, "attribute_data_type")
      mutable             = lookup(schema.value, "mutable")
      name                = lookup(schema.value, "name")
      required            = lookup(schema.value, "required")

      # string_attribute_constraints  
      dynamic "string_attribute_constraints" {
        for_each = length(lookup(schema.value, "string_attribute_constraints")) == 0 ? [] : [lookup(schema.value, "string_attribute_constraints", {})]
        content {
          min_length = lookup(string_attribute_constraints.value, "min_length", 0)
          max_length = lookup(string_attribute_constraints.value, "max_length", 0)
        }
      }
    }
  }

  # schema (Number)
  dynamic "schema" {
    for_each = var.number_schemas == null ? [] : var.number_schemas
    content {
      attribute_data_type = lookup(schema.value, "attribute_data_type")
      mutable             = lookup(schema.value, "mutable")
      name                = lookup(schema.value, "name")
      required            = lookup(schema.value, "required")

      # number_attribute_constraints
      dynamic "number_attribute_constraints" {
        for_each = length(lookup(schema.value, "number_attribute_constraints")) == 0 ? [] : [lookup(schema.value, "number_attribute_constraints", {})]
        content {
          min_value = lookup(number_attribute_constraints.value, "min_value", 0)
          max_value = lookup(number_attribute_constraints.value, "max_value", 0)
        }
      }
    }
  }

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name                                 = "${var.client_name}-${var.env}"
  explicit_auth_flows                  = var.explicit_auth_flows
  user_pool_id                         = aws_cognito_user_pool.pool.id
  generate_secret                      = var.generate_secret
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_flows                  = var.allowed_oauth_flows
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  callback_urls                        = var.callback_urls
  logout_urls                          = var.logout_urls
  token_validity_units {
    access_token  = "hours"
    id_token      = "hours"
    refresh_token = "days"
  }
  refresh_token_validity = var.refresh_token_validity
  id_token_validity      = var.id_token_validity
  access_token_validity  = var.access_token_validity
}
