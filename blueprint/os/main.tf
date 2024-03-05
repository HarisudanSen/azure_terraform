provider "azurerm" {
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features {}
}

module "os" {
	source              				= "../../module/azure/vm"
	create_resource_group   			= false
	deploy_log_analytics_agent 			= false
	log_analytics_workspace_name 		= var.log_analytics_workspace_name
	custom_image_name 					= var.custom_image_name
	attach_custom_image 				= var.attach_custom_image
	is_windows_image 					= var.is_windows_image
	resource_group_name 				= var.resource_group_name
	azure_subscription_id				= var.azure_subscription_id
	azure_client_id						= var.azure_client_id
	azure_client_secret					= var.azure_client_secret
	azure_tenant_id						= var.azure_tenant_id
	location            				= var.location
	vm_hostname         				= var.vm_hostname
	admin_username						= var.admin_username
	admin_password      				= var.admin_password
	nb_public_ip        				= var.nb_public_ip
	inbound_port_ranges     			= var.inbound_port_ranges
	marketplace_blueprint				= var.marketplace_blueprint
	nb_instances        				= var.nb_instances
	vm_os_publisher     				= var.vm_os_publisher
	vm_os_offer         				= var.vm_os_offer
	vm_os_sku           				= var.vm_os_sku
	vm_os_version						= var.vm_os_version
	vm_size								= var.vm_size
	vnet_subnet_id      				= var.vnet_subnet_id
	boot_diagnostics    				= var.boot_diagnostics
	delete_os_disk_on_termination 		= var.delete_os_disk_on_termination
	delete_data_disks_on_termination 	= var.delete_data_disks_on_termination
	data_disk           				= false
	data_disk_size_gb   				= var.data_disk_size_gb
	data_sa_type        				= var.data_sa_type
	tags                				= var.tags
	storage_account_type				= var.os_sa_type
attach_custom_gallery_image 		= var.attach_custom_gallery_image
gallery_image_id						= var.gallery_image_id
}