provider "ibm" {

  region = var.region
}

data "ibm_resource_group" "group" {
  name = var.storage_resource_group_name
}
data "ibm_resource_instance" "logdna_instance" {
  count             = var.is_object_storage_events_enabled ? 1 : 0
  name              = var.log_analysis_instance_name
  location          = var.region
  resource_group_id = data.ibm_resource_group.group.id
  service           = "logdna"
}

data "ibm_resource_instance" "at_instance" {
  count             = var.is_object_storage_events_enabled ? 1 : 0
  name              = var.activity_tracker_instance_name
  location          = var.region
  resource_group_id = data.ibm_resource_group.group.id
  service           = "logdnaat"
}


module "cos" {

  source                 = "terraform-ibm-modules/cos/ibm//modules/instance"
  provision_cos_instance = true
  service_name           = var.cos_instance_name
  resource_group_id      = data.ibm_resource_group.group.id
  plan                   = var.storage_service_plan
  region                 = (var.is_object_storage_location_global == true ? "global" : var.region)
}


module "cos_bucket" {

  source               = "./bucket"
  count                = length(local.bucket_list)
  bucket_name          = local.bucket_list[count.index]
  cos_instance_id      = module.cos.cos_instance_id
  location             = var.storage_bucket_location
  storage_class        = var.storage_class
  force_delete         = true
  endpoint_type        = var.storage_visibility
  activity_tracker_crn = length(local.crn_list) != 0 ? local.crn_list[count.index] : ""
  archive_rule         = local.archive_rule
  expire_rules         = local.expire_rule
}
