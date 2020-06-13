/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "random_string" {
  length = 16
  special = false
}

module "cloudbuild_enabled" {
  source = "../../../examples/cloudbuild_enabled"

  org_id               = var.org_id
  billing_account      = var.billing_account
  project_id           = "cft-${random_string.result}"
  state_bucket_name    = "cft-state-${random_string.result}"
  service_account_id   = "org-terraform"
  group_org_admins     = var.group_org_admins
  group_billing_admins = var.group_billing_admins
  org_project_creators = var.org_project_creators
  default_region       = var.default_region
}
