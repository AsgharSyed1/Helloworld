module "NAME" {
    source = "SORUCE"
    [CONFIG ...]
}

provider "Azure" {
    region = "East US"
}

module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster"
}
//You can then reuse the exact same module in the produrction environment by creating a new prod/services/webserver-cluster/main.tf file with the following contents:

provider "Azure" {
    region = "East US"
}

module "webserver_cluster1" {
    source = "../../../modules/services/webserver-cluster"
    name = "storageaccount1"
}

module "webserver_cluster2" {
    source = "../../../modules/services/webserver-cluster"
    name = "storageaccount2"
}

//And there you have it: code reuse in multiple environments without any copy/paste! Note that whenver you add a module to your Terraform configurations or modify the source parameter of a module, you need to run the get command before you run plan or apply:

 > terraform get
 Get: /modules/frontend-app

 > terraform plan
(...)
