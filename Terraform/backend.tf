terraform {
  backend "s3" {
    bucket         = "utkarsh.terraform"    
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Utkarsh_table"                   
    encrypt        = true
  }
}
