terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["seu_caminho_arquivo_config"]      #geralmente ~/users/<seu_user/aws/config
  shared_credentials_files = ["seu_caminho_arquivo_credentials"] #geralmente ~/users/<seu_user/aws/credentials
  profile                  = "default"
  region                   = local.region
}

