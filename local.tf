locals {

  logdna_bucket   = var.storage_bucket_name == null ? "${data.ibm_resource_instance.logdna_instance.*.name}-cos-bucket" : null
  at_bucket       = var.storage_bucket_name == null ? "${data.ibm_resource_instance.at_instance.*.name}-cos-bucket" : null
  logdna_crn      = var.is_object_storage_events_enabled ? data.ibm_resource_instance.logdna_instance.*.id : null
  at_crn          = var.is_object_storage_events_enabled ? data.ibm_resource_instance.at_instance.*.id : null
  archive_rule_id = var.is_object_storage_lifecycle_enabled ? "bucket-archive-rule-${data.ibm_resource_instance.logdna_instance.*.name}" : null
  expire_rule_id  = var.is_object_storage_lifecycle_enabled ? "bucket-expire-rule-${data.ibm_resource_instance.at_instance.*.name}" : null
  bucket_list     = var.is_object_storage_events_enabled ? [local.logdna_bucket, local.at_bucket] : tolist(setsubtract(split(",", var.storage_bucket_name), [""]))
  crn_list        = var.is_object_storage_events_enabled ? [local.logdna_crn, local.at_crn] : []
  archive_rule = var.is_object_storage_lifecycle_enabled ? {
    rule_id = local.archive_rule_id
    enable  = true
    days    = 0
    type    = "GLACIER"
  } : null
  expire_rule = var.is_object_storage_lifecycle_enabled ? [{
    rule_id = local.expire_rule_id
    enable  = true
    days    = 365
    prefix  = "logs/"
  }] : []
}
