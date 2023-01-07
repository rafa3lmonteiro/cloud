##############################################################
# 
# edit 11/03/2022
# variables.tf file
##############################################################

variable "ambiente" {
    type = "string"
    default = "homolog"
    }

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
}

#variable "vm_1_name" {
#  description = "Target vSphere folder for virtual machine"
#}
variable "vm_1_name" {
  description = "Virtual Machine name"
}

#########################################################
##### Resource : vm_1
#########################################################

  variable "vm_1_folder" {
  type        = "map"
  description = "Target vSphere folder for virtual machine"
  default     = {
        dev-customer = "DV-CUSTOMER1"
        th-customer = "HO-CUSTOMER2"
        th-acme = "HO-CUSTOMER2"
        ti-customer = "TI-CUSTOMER1"
        ti-acme = "TI-CUSTOMER1"
        tu-customer = "TU-CUSTOMER1"
        tu-acme = "TU-CUSTOMER1"
        prod-customer = "ICP-CUSTOMER-PROD1"
        prod-acme = "ICP-ACME-PROD"
        ha-customer = "ICP-CUSTOMER-HA1"
        ha-acme = "ICP-ACME-HA1"
        prod-corporation = "ICP-CORP-PR"
        ha-corporation = "ICP-CORP-HA"
        infra = "INFRA-CUSTOMER2"
  }
}

variable "vm_1_datacenter" {
  type        = "map"
  description = "Target vSphere datacenter for virtual machine creation"
  default     = {
        dev-customer = "DC2"
        th-customer = "DC2"
        th-acme = "DC2"
        ti-customer = "DC2"
        ti-acme = "DC2"
        tu-customer = "DC2"
        tu-acme = "DC2"
        prod-customer = "DC1"
        prod-acme = "DC1"
        ha-customer = "DC1"
        ha-acme = "DC1"
        prod-corporation = "DC1"
        ha-corporation = "DC1"
        infra = "DC2"
  }
}

variable "vm_1_domain" {
    type        = "map"
  description = "Domain Name of virtual machine"
  default     = {
        dev-customer = "homolog.my.cloud"
        th-customer = "homolog.my.cloud"
        th-acme = "homolog.my.cloud"
        ti-customer = "homolog.my.cloud"
        ti-acme = "homolog.my.cloud"
        tu-customer = "homolog.my.cloud"
        tu-acme = "homolog.my.cloud"
        prod-customer = "producao.my.cloud"
        prod-acme = "producao.my.cloud"
        ha-customer = "producao.my.cloud"
        ha-acme = "producao.my.cloud"
        prod-corporation = "producao.my.cloud"
        ha-corporation =  "producao.my.cloud"
        infra = "homolog.my.cloud"
  }
  
}

variable "vm_1_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default     = "20"
}

variable "vm_1_memory" {
  description = "Memory assigned to the virtual machine in megabytes. This value is required to be an increment of 1024"
  default     = "24576"
}

variable "vm_1_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
  type        = "map"
  default     = {
        dev-customer = "HOMOLOGACAO-DC2"
        th-customer = "HOMOLOGACAO-DC2"
        th-acme = "HOMOLOGACAO-DC2"
        ti-customer = "HOMOLOGACAO-DC2"
        ti-acme = "HOMOLOGACAO-DC2"
        tu-customer = "HOMOLOGACAO-DC2"
        tu-acme = "HOMOLOGACAO-DC2"
        prod-customer = "PRODUCAO-DC1"
        prod-acme = "PRODUCAO-DC1"
        ha-customer = "PRODUCAO-HA"
        ha-acme = "PRODUCAO-HA"
        prod-corporation = "PRODUCAO-DC1"
        ha-corporation = "PRODUCAO-HA"
        infra = "HOMOLOGACAO-DC2"

  }
}


variable "vm_1_dns_suffixes" {
    description = "Name resolution suffixes for the virtual network adapter"
    type        = "map"
    default     = {
        dev-customer = ["homolog.my.cloud"]
        th-customer = ["homolog.my.cloud"]
        th-acme = ["homolog.my.cloud"]
        ti-customer = ["homolog.my.cloud"]
        ti-acme = ["homolog.my.cloud"]
        tu-customer = ["homolog.my.cloud"]
        tu-acme = ["homolog.my.cloud"]
        prod-customer = ["producao.my.cloud"]
        prod-acme = ["producao.my.cloud"]
        ha-customer = ["producao.my.cloud"]
        ha-acme = ["producao.my.cloud"]
        prod-corporation = ["producao.my.cloud"]
        ha-corporation = ["producao.my.cloud"]
        infra =  ["homolog.my.cloud"]
  }
  
}

variable "vm_1_dns_servers" {
    description = "DNS servers for the virtual network adapter"
    type        = "map"
    default     = {
        dev-customer = ["172.17.0.10","172.17.0.11"]
        th-customer = ["172.17.0.10","172.17.0.11"]
        th-acme = ["172.17.0.10","172.17.0.11"]
        ti-customer = ["172.17.0.10","172.17.0.11"]
        ti-acme = ["172.17.0.10","172.17.0.11"]
        tu-customer = ["172.17.0.10","172.17.0.11"]
        tu-acme = ["172.17.0.10","172.17.0.11"]
        prod-customer = ["172.17.0.12","172.17.0.13"]
        prod-acme = ["172.17.0.12","172.17.0.13"]
        ha-customer = ["172.17.0.12","172.17.0.13"]
        ha-acme = ["172.17.0.12","172.17.0.13"]
        prod-corporation = ["172.17.0.12","172.17.0.13"]
        ha-corporation = ["172.17.0.12","172.17.0.13"]
        infra = ["172.17.0.10","172.17.0.11"]
  }

  
  
}


variable "icp-version-path" {
  description = "vSphere port group or network label for virtual machine's vNIC"
  type        = "map"
    default     = {
        dev-customer = "3.1.1"
        th-customer = "3.1.1"
        th-acme = "3.1.1"
        ti-customer = "3.1.1"
        ti-acme = "3.1.1"
        tu-customer = "3.1.1"
        tu-acme = "3.1.1"
        prod-customer = "3.1.1"
        prod-acme = "3.1.1"
        ha-customer = "3.1.1"
        ha-acme = "3.1.1"
        prod-corporation = "3.1.2"
        ha-corporation = "3.1.2"
        infra = "3.1.1"
  }
}

variable "vm_1_network_workload" {
  description = "vSphere port group or network label for virtual machine's vNIC"
   type        = "map"
    default     = {
        dev-customer = "vxw-dvs-83-virtualwire-1"
        th-customer = "vxw-dvs-83-virtualwire-2"
        th-acme = "vxw-dvs-83-virtualwire-2"
        ti-customer = "vxw-dvs-83-virtualwire-1"
        ti-acme = "vxw-dvs-83-virtualwire-1"
        tu-customer = "vxw-dvs-83-virtualwire-1"
        tu-acme = "vxw-dvs-83-virtualwire-1"
        prod-customer = "vxw-dvs-83-virtualwire-3"
        prod-acme = "vxw-dvs-83-virtualwire-4"
        ha-customer = "vxw-dvs-83-virtualwire-5"
        ha-acme = "vxw-dvs-83-virtualwire-6"
        prod-corporation = "vxw-dvs-83-virtualwire-7"
        ha-corporation = "vxw-dvs-83-virtualwire-8"
        infra = "vxw-dvs-83-virtualwire-1"
  }
}



variable "Rede_Workload" {
  description = "Numero da rede de WorkLoad pelo PHPIPAM"
     type        = "map"
    default     = {
        dev-customer = "10"
        th-customer = "11"
        th-acme = "11"
        ti-customer = "10"
        ti-acme = "11"
        tu-customer = "10"
        tu-acme = "11"
        prod-customer = "14"
        prod-acme = "13"
        ha-customer = "14"
        ha-acme = "13"
        prod-corporation = "15"
        ha-corporation = "15"
        infra = "10"
  }
}

variable "vm_1_ipv4_gateway" {
     type        = "map"
  description = "IPv4 gateway for vNIC configuration"
  default     = {
        dev-customer = "172.17.0.1"
        th-customer = "172.17.0.1"
        th-acme = "10.191.26.1"
        ti-customer = "172.17.0.1"
        ti-acme = "172.17.0.1"
        tu-customer = "172.17.0.1"
        tu-acme = "172.17.0.1"
        prod-customer = "172.17.10.1"
        prod-acme = "172.17.10.1"
        ha-customer = "172.17.10.1"
        ha-acme = "172.17.10.1"
        prod-corporation = "172.17.20.1"
        ha-corporation = "172.17.20.1"
        infra = "172.17.0.1"
  }
}

variable "vm_1_ipv4_prefix_length_management" {
  description = "IPv4 prefix length for vNIC configuration. The value must be a number between 8 and 32"
  default = {
        dev-customer = "24"
        th-customer = "24"
        th-acme = "24"
        ti-customer = "24"
        ti-acme = "24"
        tu-customer = "24"
        tu-acme = "24"
        prod-customer = "24"
        prod-acme = "24"
        ha-customer = "24"
        ha-acme = "24"
        prod-corporation = "23"
        ha-corporation = "23"
        infra = "24"
  }
}

variable "vm_1_adapter_type" {
  description = "Network adapter type for vNIC Configuration"
  default     = "vmxnet3"
}
variable "vm_1_datastore_cluster" {
  description = "Data store or storage cluster name for target virtual machine's disks"
  type        = "map"
  default     = {
        dev-customer = "DC2-DS-L-HM"
        th-customer = "DC2-DS-L-HM"
        th-acme = "DC2-DS-L-HM"
        ti-customer = "DC2-DS-L-HM"
        ti-acme = "DC2-DS-L-HM"
        tu-customer = "DC2-DS-L-HM"
        tu-acme = "DC2-DS-L-HM"
        prod-customer = "DC1-CLDS-TIER-1"
        prod-acme = "DC1-CLDS-TIER-1"
        ha-customer = "DC2-T2-L-PRD"
        ha-acme = "DC2-T2-L-PRD"
        prod-corporation = "DC1-CLDS-TIER-1"
        ha-corporation = "DC2-T2-L-PRD"
        infra = "DC2-DS-L-HM"
  }
}


variable "vm_1_root_disk_type" {
  type        = "string"
  description = "Type of template disk volume"
  default     = "thin"
}


variable "vm_1_root_disk_keep_on_remove" {
  type        = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
  default     = "false"
}

variable "Rede_Gerenciamento" {
  description = "Numero da rede de Gerenciamento pelo PHPIPAM"
   type        = "map"
    default     = {
        dev-customer = "20"
        th-customer = "20"
        th-acme = "21"
        ti-customer = "20"
        ti-acme = "21"
        tu-customer = "20"
        tu-acme = "21"
        prod-customer = "22"
        prod-acme = "22"
        ha-customer = "22"
        ha-acme = "22"
        prod-corporation = "23"
        ha-corporation = "23"
        infra = "20"
  }
}

variable "IP_Icp_Bootnode" {

    description = "IP do ICP BootNode a ser provisionado"
    type        = "map"
    default     = {
        dev-customer = "172.17.0.111"
        th-customer = "172.17.0.191"
        th-acme = "172.17.0.112"
        ti-customer = "172.17.0.174"
        ti-acme = "172.17.0.113"
        tu-customer = "172.17.0.138"
        tu-acme = "172.17.0.114"
        prod-customer = "172.17.0.115"
        prod-acme = "172.17.0.116"
        ha-customer = "172.17.10.102"
        ha-acme = "172.17.0.117"
        prod-corporation = "172.17.20.12"
        ha-corporation = "172.17.0.118"
        infra = "172.17.0.119"
  }
   
}


variable "vm_1-image" {
  description = "Operating system image id / template that should be used when creating the virtual image"
  type        = "map"
  default     = {
        dev-customer = "TEMPLATE_CAM_ICP311"
        th-customer = "TEMPLATE_CAM_ICP311"
        th-acme = "TEMPLATE_CAM_ICP311"
        ti-customer = "TEMPLATE_CAM_ICP311"
        ti-acme = "TEMPLATE_CAM_ICP311"
        tu-customer = "TEMPLATE_CAM_ICP311"
        tu-acme = "TEMPLATE_CAM_ICP311"
        prod-customer = "TEMPLATE_CAM_ICP311_PROD"
        prod-acme = "TEMPLATE_CAM_ICP311_PROD"
        ha-customer = "TEMPLATE_CAM_ICP311_PRODHA"
        ha-acme = "TEMPLATE_CAM_ICP311_PRODHA"
        prod-corporation = "TEMPLATE_CAM_ICP311_PROD"
        ha-corporation = "TEMPLATE_CAM_ICP311_PRODHA"
        infra = "TEMPLATE_CAM_ICP311"
  }
}

variable "vm_1_network_gerenciamento" {
  description = "vSphere port group or network label for virtual machine's vNIC"
  type        = "map"
    default     = {
        dev-customer = "PG-DC2-HOM-MGMT"
        th-customer = "PG-DC2-HOM-MGMT"
        th-acme = "PG-DC2-HOM-26"
        ti-customer = "PG-DC2-HOM-MGMT"
        ti-acme = "PG-DC2-HOM-MGMT"
        tu-customer = "PG-DC2-HOM-MGMT"
        tu-acme = "PG-DC2-HOM-26"
        prod-customer = "PG-DC1-MGMT"
        prod-acme = "PG-DC1-MGMT"
        ha-customer = "PG-DC1-MGMT"
        ha-acme = "PG-DC1-MGMT"
        prod-corporation = "PG-DC1-MGMT-corporation"
        ha-corporation = "PG-DC1-MGMT-corporation"
        infra = "PG-DC2-HOM-MGMT"
  }
}

variable "vm_1_ipv4_prefix_length_workload" {
      type        = "map"
  description = "IPv4 prefix length for vNIC configuration. The value must be a number between 8 and 32"
  default     = {
        dev-customer = "24"
        th-customer = "24"
        th-acme = "24"
        ti-customer = "24"
        ti-acme = "24"
        tu-customer = "24"
        tu-acme = "24"
        prod-customer = "23"
        prod-acme = "23"
        ha-customer = "23"
        ha-acme = "23"
        prod-corporation = "23"
        ha-corporation = "23"
        infra = "24"
  }
  
}


variable "vm_1_root_disk_controller_type" {
  type        = "string"
  description = "Type of template disk controller"
  default     = "scsi"
}


variable "vm_1_root_disk_size" {
  description = "Size of template disk volume. Should be equal to template's disk size"
  default     = "25"
}

variable "vm_1_resource_pool" {
  type        = "map"
  description = "Target vSphere Resource Pool to host the virtual machine"
  default     = {
        dev-customer = "DEV"
        th-customer = "HOM-CUSTOMER"
        th-acme = "HOM-ACME"
        ti-customer = "TI-CUSTOMER"
        ti-acme = "TI-ACME"
        tu-customer = "TU-CUSTOMER"
        tu-acme = "TU-ACME"
        prod-customer = "CUSTOMER-PROD"
        prod-acme = "ACME-PROD"
        ha-customer = "CUSTOMER-HA"
        ha-acme = "ACME-HA"
        prod-corporation = "CORPORATION-PROD"
        ha-corporation = "CORPORATION-HA"
        infra = "INFRA"
        
  }
  
}
