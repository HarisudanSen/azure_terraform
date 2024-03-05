output "vm_ids" {
  description = "Virtual machine ids created."
  value       = module.os.vm_ids
}

output "vm_name" {
  description = "Virtual machine name created."
  value       = module.os.vm_name
}

output "network_interface_ids" {
  description = "ids of the vm nics provisoned."
  value       = module.os.network_interface_ids
}

output "private_ip" {
  description = "ids of the vm nics provisoned."
  value       = module.os.private_ip
}

output "public_ip" {
  description = "ids of the vm nics provisoned."
  value       = module.os.public_ip
}
		
output "network_interface_private_ip" {
  description = "private ip addresses of the vm nics"
  value       = module.os.network_interface_private_ip
}

output "file" { 	
	value = module.os.file
}

#output "availability_set_id" {
#  description = "id of the availability set where the vms are provisioned."
#  value       = module.os.availability_set_id
#}

#output "vm_os_type" {
#  description = "type of operations system"
#  value       = "${var.is_windows_image ? "windows" : "linux"}"
#}

