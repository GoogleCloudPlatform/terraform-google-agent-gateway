package simple_example

import (
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestSimpleExample(t *testing.T) {
	// Initializes the test using the 'examples/simple_example' directory
	bpt := tft.NewTFBlueprintTest(t)

	bpt.DefineVerify(func(assert *assert.Assertions) {
		// DefaultVerify checks that no resources drift after an apply.
		// This proves that Terraform successfully created the resource and the state is stable.
		bpt.DefaultVerify(assert)

		// Get outputs from the Terraform example just to ensure they are populated correctly
		projectID := bpt.GetStringOutput("project_id")
		assert.NotEmpty(projectID, "project_id output should not be empty")

		gatewayID := bpt.GetStringOutput("agent_gateway_id")
		assert.NotEmpty(gatewayID, "agent_gateway_id output should not be empty")

		// We are skipping gcloud verification here because the agent-gateways
		// gcloud command is not yet available in the standard CLI.
	})

	bpt.Test()
}
