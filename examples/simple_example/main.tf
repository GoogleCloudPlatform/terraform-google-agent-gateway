# 1. Override the Google Provider
provider "google" {
  network_security_custom_endpoint    = "https://staging-networksecurity.sandbox.googleapis.com/v1beta1/"
  network_services_custom_endpoint    = "https://staging-networkservices.sandbox.googleapis.com/v1alpha1/"
  certificate_manager_custom_endpoint = "https://staging-certificatemanager.sandbox.googleapis.com/v1/"
}

# 2. Override the Google Beta Provider
provider "google-beta" {
  network_security_custom_endpoint    = "https://staging-networksecurity.sandbox.googleapis.com/v1beta1/"
  network_services_custom_endpoint    = "https://staging-networkservices.sandbox.googleapis.com/v1alpha1/"
  certificate_manager_custom_endpoint = "https://staging-certificatemanager.sandbox.googleapis.com/v1beta1/" 
}

module "agent_gateway" {
  source = "../.."

  project_id   = var.project_id
  location     = "us-central1"
  gateway_name = "simple-agent-gateway-2"
  google_managed_governed_access_path = "AGENT_TO_ANYWHERE" 
  
  labels = {
    environment = "test"
    managed-by  = "terraform"
  }
}
