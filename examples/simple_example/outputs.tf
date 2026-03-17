output "project_id" {
  description = "The project ID"
  value       = var.project_id
}

output "agent_gateway_id" {
  description = "The full resource ID of the Agent Gateway."
  value       = module.agent_gateway.agent_gateway_id
}
