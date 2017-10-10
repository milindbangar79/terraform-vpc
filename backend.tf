terraform {
  backend "s3" {
    bucket = "devakarthik-ed-custom"
	key    = "state.tfstate"
	region = "us-east-1"
  }
}