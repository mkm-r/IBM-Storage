#####################################################
# COS Bucket
# Copyright 2020 IBM
#####################################################

// Bucket congigurations

variable "region" {
  description = "Name of the region (for example ,. us-south, eu-de)"
  type        = string
  default = "us-south"
}
variable "storage_resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default = "default"
}
variable "is_object_storage_events_enabled" {
  description = "True, to configure observability instance name  with bucket for event"
  type        = bool
  default     = false
}
variable "log_analysis_instance_name" {
  description = "Name of the IBM Cloud Log Analysis instance name  with bucket to be configured for event"
  type        = string
  default = "6e6e9a0e-d09c-42bb-9a59-92f8de540841"
}
variable "activity_tracker_instance_name" {
  description = "Name of the actvity tracker instance name  with bucket to be configured for event"
  type        = string
  default = "6e6e9a0e-d09c-42bb-9a59-92f8de540841"
}

variable "cos_instance_name" {
  description = "Name of IBM Cloud Object Storage instance"
  type        = string
  default = "demo-storage"
}
variable "is_object_storage_location_global" {
  description = "True, to provisiona IBM Cloud Object Storage instance, location as global"
  type        = bool
  default     = true
}
variable "storage_service_plan" {
  description = "Name of the service plan"
  type        = string
  default     = "standard"
}
variable "storage_bucket_name" {
  description = "The name of the bucket.supply comma separated bucket name in case more than one bucket. If bucket name  is not supplied then a name will be generated for you using a combination of observability instance name with cos-bucket as prefix"
  default     = "cos-bucket-test-demo"
}
variable "storage_bucket_location" {
  description = "single site or region or cross region location info"
  type        = string
  default     = "us-south"
}
variable "storage_class" {
  description = "Name of storage class"
  type        = string
  default = "standard"
}

variable "storage_visibility" {
  description = "endpoint for the COS bucket"
  type        = string
  default     = "public"
}

variable "read_data_events" {
  description = "If set to true, all object read events will be sent to Activity Tracker/logdna"
  type        = bool
  default     = true

}
variable "write_data_events" {
  description = "If set to true, all object write events will be sent to Activity Tracke/logdna"
  type        = bool
  default     = true

}
variable "is_object_storage_lifecycle_enabled" {
  description = "True, to apply lifecycle rules to buckets"
  type        = bool
  default     = false
}

variable "TF_VERSION" {
  default     = "0.13"
  description = "terraform engine version to be used in schematics"
}

