/**
 * Copyright 2021 Google LLC
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

resource "google_network_services_agent_gateway" "main" {
  provider = google-nightly

  project     = var.project_id
  location    = var.location
  name        = var.gateway_name
  description = var.description
  labels      = var.labels
  protocols   = var.protocols
  registries  = var.registries

  dynamic "google_managed" {
    for_each = var.google_managed_governed_access_path != null ? [var.google_managed_governed_access_path] : []
    content {
      governed_access_path = var.google_managed_governed_access_path
    }
  }

  dynamic "self_managed" {
    for_each = var.self_managed_resource_uri != null ? [var.self_managed_resource_uri] : []
    content {
      resource_uri = var.self_managed_resource_uri
    }
  }

  dynamic "network_config" {
    for_each = var.network_config_egress_network_attachment != null ? [var.network_config_egress_network_attachment] : []
    content {
      egress {
        network_attachment = var.network_config_egress_network_attachment
      }
    }
  }

  timeouts {
    create = var.timeout_create
    update = var.timeout_update
    delete = var.timeout_delete
  }
}
