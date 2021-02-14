provider "aws" {
  region = var.region
}

module "cloudwatch_log" {
  source = "../../"

  stream_names = var.stream_names

  context = module.this.context
}