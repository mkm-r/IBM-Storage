# IBM-Object Storage services

IBM-Object Storage services - gives you a highly scalable cloud storage service, designed for high durability, resiliency and security.  Store, manage and access your data via self-service portal and RESTful APIs. 

This reperesents an automated approcah to provision cloud object storage and attachment of multiple buckets.  Provisioning of bucket/s can be done in single site, cross-regional and regional location.  With IBM-Object Storage services, user can maintain bucket lifecyle, metrrics monitoring, archiving events from IBM Cloud Activity tracker into bucket, archiving logs from IBM Cloud Log Analysis into a bucket in IBM COS and more.  The automation is developed using Terraform, and will ensure that you are adhering to the best practices.


The following diagram illustrates the deployment architecture used by this automation.

![IBM-Object Storage design](diagrams/IBM-ObjectStorage.png)

## Prerequisites

* You must have the following permissions in IBM Cloud Identity and Access Management:
    * **Manager** service access role for IBM Cloud Schematics
    * **Viewer** platform role to view the list of the services instances in the Observability dashboard.
    * **Administrator/Editor** platform role to provision `IBM Cloud Object Storage` service.
 
 ## Input
The IBM-Object Services will be deployed in the `region` (or location) and `resource_group` provided by the user.
In addition, the following inputs must be provided to provision all the IBM-Object Services :

| Input parameter               | Description                                    |               | Default Value |
|-------------------------------|------------------------------------------------|---------------|-----------------------------------|
| storage_resource_group_name   | Name of the resource group                     | mandatory     |                                   |
| region                        | Name of the region or location (eg. us-south, eu-de) | mandatory |                                 |
| is_object_storage_location_global | True, to provisiona IBM Cloud Object Storage instance, location as global| mandatory |         |
| storage_class                 | Name of storage class | mandatory |                                                                |
| storage_visibility            | endpoint for the COS bucket | optional   | public                            |
| log_analysis_instance_name    | Name of the IBM Cloud Log Analysis instance name  with bucket to be configured for event| mandatory|  |          
| activity_tracker_instance_name| Name of the actvity tracker instance name  with bucket to be configured for event | mandatory |    |
| cos_instance_name             | Name of the cos instance with bucket to be attached | mandatory |                                  |
| storage_service_plan          | Name of the service plan       | mandatory |                                        |
| read_data_events              | if set to true, all object read events will be sent to Activity Tracker/logdna | optional | true   | 
| write_data_events             | If set to true, all object write events will be sent to Activity Tracke/logdna | optional | true   |       
|is_object_storage_events_enabled | True, to configure observability instance name  with bucket for event        | optional | false  |
| storage_bucket_name           | The name of the bucket.supply comma separated bucket name in case more than one bucket. If bucket name  is not supplied then a name will be generated for you using a combination of observability instance name with cos-bucket as prefix | optional | null |
| storage_bucket_location       | single site or region or cross region location info                | mandatory |                    |
| is_object_storage_lifecycle_enabled | True, to apply lifecycle rules to buckets | optional | false                                 |

## Outputs
After you provision the IBM-Object Services , you can view the following outputs in the Schematics log files, in the `Terraform SHOW` section.

| Output parameter              | Description                                      |
|-------------------------------|--------------------------------------------------|
| bucket_ids                    |  List of bucket ids             |                |



