package test

import (
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	randId := strconv.Itoa(rand.Intn(100000))
	attributes := []string{randId}

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		VarFiles:     []string{"fixtures.us-east-1.tfvars"},
		Vars: map[string]interface{}{
			"attributes": attributes,
			"region":     "us-east-1",
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApplyAndIdempotent(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	logGroupArn := terraform.Output(t, terraformOptions, "log_group_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, logGroupArn, "arn:aws:logs:us-east-1:")

	// Run `terraform output` to get the value of an output variable
	streamArns := terraform.Output(t, terraformOptions, "stream_arns")
	// Verify we're getting back the outputs we expect
	assert.Greater(t, len(streamArns), 0)

	// Run `terraform output` to get the value of an output variable
	roleArn := terraform.Output(t, terraformOptions, "role_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, roleArn, "arn:aws:iam:")
}
