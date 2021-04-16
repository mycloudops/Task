variable "create_user_pool" {
  description = "Controls if the Load Balancer should be created"
  type        = bool
  default     = true
}

variable "user_pool_name" {
  description = "The name of the user pool"
  type        = string
}

variable "alias_attributes" {
  description = "Attributes supported as an alias for this user pool. Possible values: phone_number, email, or preferred_username. Conflicts with `username_attributes`"
  type        = list(any)
  default     = null
}

variable "username_attributes" {
  description = "Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with `alias_attributes`"
  type        = list(any)
  default     = null
}

variable "auto_verified_attributes" {
  description = "The attributes to be auto-verified. Possible values: email, phone_number"
  type        = list(any)
  default     = []
}

variable "mfa_configuration" {
  description = "Set to enable multi-factor authentication. Must be one of the following values (ON, OFF, OPTIONAL)"
  type        = string
  default     = "OFF"
}

variable "username_configuration" {
  description = "The Username Configuration. Seting `case_sesiteve` specifies whether username case sensitivity will be applied for all users in the user pool through Cognito APIs"
  type        = map(any)
  default     = {}
}

variable "software_token_mfa_configuration" {
  description = "Configuration block for software token MFA (multifactor-auth). mfa_configuration must also be enabled for this to work"
  type        = map(any)
  default     = {}
}

variable "string_schemas" {
  description = "A container with the string schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

variable "number_schemas" {
  description = "A container with the number schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

variable "client_name" {
  type = string
}

variable "explicit_auth_flows" {
  type    = list(any)
  default = []
}

variable "generate_secret" {
  type    = bool
  default = false
}
variable "allowed_oauth_flows_user_pool_client" {
  type    = bool
  default = true
}
variable "allowed_oauth_flows" {
  type    = list(any)
  default = []
}
variable "allowed_oauth_scopes" {
  type    = list(any)
  default = []
}
variable "callback_urls" {
  type    = list(any)
  default = []
}
variable "logout_urls" {
  type    = list(any)
  default = []
}
variable "refresh_token_validity" {
  type    = number
  default = 5
}
variable "id_token_validity" {
  type    = number
  default = 5
}
variable "access_token_validity" {
  type    = number
  default = 5
}

variable "env" {
  type    = string
  default = "dev"
}
