terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

resource "linode_lke_cluster" "hello_world_cluster" {
  label = "hello-world-cluster"
  region = "us-central"
  k8s_version = "1.28"
  pool {
    type = "g6-standard-1"
    count = 1
  }
}