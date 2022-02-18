##############################################################
# Keys - CAMC (public/private) & optional User Key (public) 
##############################################################

variable "ambiente" {
    type = "string"
    default = "homolog"
    }

 

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
}

#Variable : vm_1_name

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
        dev-pfl2 = "DV-IC1"
        th-pfl2 = "HO-IC2"
        th-pjl2 = "HO-IC2"
        ti-pfl2 = "TI-IC1"
        ti-pjl2 = "TI-IC1"
        tu-pfl2 = "TU-IC1"
        tu-pjl2 = "TU-IC1"
        prod-pfl2 = "ICP-PR1"
        prod-pjl2 = "ICP-PR5PJ"
        ha-pfl2 = "ICP-HA1"
        ha-pjl2 = "ICP-HA5PJ"
        prod-corp = "ICP-PR"
        ha-corp = "ICP-PR"
        estruturais = "ES-IC2"
  }
}

variable "vm_1_datacenter" {
  type        = "map"
  description = "Target vSphere datacenter for virtual machine creation"
  default     = {
        dev-pfl2 = "ALP"
        th-pfl2 = "ALP"
        th-pjl2 = "ALP"
        ti-pfl2 = "ALP"
        ti-pjl2 = "ALP"
        tu-pfl2 = "ALP"
        tu-pjl2 = "ALP"
        prod-pfl2 = "CTI"
        prod-pjl2 = "CTI"
        ha-pfl2 = "CTI"
        ha-pjl2 = "CTI"
        prod-corp = "CTI"
        ha-corp = "CTI"
        estruturais = "ALP"
  }
}

variable "vm_1_domain" {
    type        = "map"
  description = "Domain Name of virtual machine"
  default     = {
        dev-pfl2 = "homolog.my.cloud"
        th-pfl2 = "homolog.my.cloud"
        th-pjl2 = "homolog.my.cloud"
        ti-pfl2 = "homolog.my.cloud"
        ti-pjl2 = "homolog.my.cloud"
        tu-pfl2 = "homolog.my.cloud"
        tu-pjl2 = "homolog.my.cloud"
        prod-pfl2 = "producao.my.cloud"
        prod-pjl2 = "producao.my.cloud"
        ha-pfl2 = "producao.my.cloud"
        ha-pjl2 = "producao.my.cloud"
        prod-corp = "producao.my.cloud"
        ha-corp =  "producao.my.cloud"
        estruturais = "homolog.my.cloud"
  }
  
}

variable "vm_1_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default     = "12"
}

variable "vm_1_memory" {
  description = "Memory assigned to the virtual machine in megabytes. This value is required to be an increment of 1024"
  default     = "24576"
}

variable "vm_1_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
  type        = "map"
  default     = {
        dev-pfl2 = "HOMOLOGACAO-ALP"
        th-pfl2 = "HOMOLOGACAO-ALP"
        th-pjl2 = "HOMOLOGACAO-ALP"
        ti-pfl2 = "HOMOLOGACAO-ALP"
        ti-pjl2 = "HOMOLOGACAO-ALP"
        tu-pfl2 = "HOMOLOGACAO-ALP"
        tu-pjl2 = "HOMOLOGACAO-ALP"
        prod-pfl2 = "PRODUCAO-CTI"
        prod-pjl2 = "PRODUCAO-CTI"
        ha-pfl2 = "PRODUCAO-HA"
        ha-pjl2 = "PRODUCAO-HA"
        prod-corp = "PRODUCAO-CTI"
        ha-corp = "PRODUCAO-HA"
        estruturais = "HOMOLOGACAO-ALP"

  }
}


variable "vm_1_dns_suffixes" {
    description = "Name resolution suffixes for the virtual network adapter"
    type        = "map"
    default     = {
        dev-pfl2 = ["homolog.my.cloud"]
        th-pfl2 = ["homolog.my.cloud"]
        th-pjl2 = ["homolog.my.cloud"]
        ti-pfl2 = ["homolog.my.cloud"]
        ti-pjl2 = ["homolog.my.cloud"]
        tu-pfl2 = ["homolog.my.cloud"]
        tu-pjl2 = ["homolog.my.cloud"]
        prod-pfl2 = ["producao.my.cloud"]
        prod-pjl2 = ["producao.my.cloud"]
        ha-pfl2 = ["producao.my.cloud"]
        ha-pjl2 = ["producao.my.cloud"]
        prod-corp = ["producao.my.cloud"]
        ha-corp = ["producao.my.cloud"]
        estruturais =  ["homolog.my.cloud"]
  }
  
}

variable "vm_1_dns_servers" {
    description = "DNS servers for the virtual network adapter"
    type        = "map"
    default     = {
        dev-pfl2 = ["10.191.199.20","10.191.199.21"]
        th-pfl2 = ["10.191.199.20","10.191.199.21"]
        th-pjl2 = ["10.191.199.20","10.191.199.21"]
        ti-pfl2 = ["10.191.199.20","10.191.199.21"]
        ti-pjl2 = ["10.191.199.20","10.191.199.21"]
        tu-pfl2 = ["10.191.199.20","10.191.199.21"]
        tu-pjl2 = ["10.191.199.20","10.191.199.21"]
        prod-pfl2 = ["10.199.103.59","10.199.103.60"]
        prod-pjl2 = ["10.199.103.59","10.199.103.60"]
        ha-pfl2 = ["10.199.103.59","10.199.103.60"]
        ha-pjl2 = ["10.199.103.59","10.199.103.60"]
        prod-corp = ["10.199.103.59","10.199.103.60"]
        ha-corp = ["10.199.103.59","10.199.103.60"]
        estruturais = ["10.191.199.20","10.191.199.21"]
  }

  
  
}


variable "icp-version-path" {
  description = "vSphere port group or network label for virtual machine's vNIC"
  type        = "map"
    default     = {
        dev-pfl2 = "3.1.1"
        th-pfl2 = "3.1.1"
        th-pjl2 = "3.1.1"
        ti-pfl2 = "3.1.1"
        ti-pjl2 = "3.1.1"
        tu-pfl2 = "3.1.1"
        tu-pjl2 = "3.1.1"
        prod-pfl2 = "3.1.1"
        prod-pjl2 = "3.1.1"
        ha-pfl2 = "3.1.1"
        ha-pjl2 = "3.1.1"
        prod-corp = "3.1.2"
        ha-corp = "3.1.2"
        estruturais = "3.1.1"
  }
}

variable "vm_1_network_workload" {
  description = "vSphere port group or network label for virtual machine's vNIC"
   type        = "map"
    default     = {
        dev-pfl2 = "vxw-dvs-83-virtualwire-7-sid-80007-LS_CORPTUTI01_10.191.5.0"
        th-pfl2 = "vxw-dvs-83-virtualwire-6-sid-80006-LS_INETHOMC2_10.191.1.0"
        th-pjl2 = "vxw-dvs-83-virtualwire-6-sid-80006-LS_INETHOMC2_10.191.1.0"
        ti-pfl2 = "vxw-dvs-83-virtualwire-7-sid-80007-LS_CORPTUTI01_10.191.5.0"
        ti-pjl2 = "vxw-dvs-83-virtualwire-7-sid-80007-LS_CORPTUTI01_10.191.5.0"
        tu-pfl2 = "vxw-dvs-83-virtualwire-7-sid-80007-LS_CORPTUTI01_10.191.5.0"
        tu-pjl2 = "vxw-dvs-83-virtualwire-7-sid-80007-LS_CORPTUTI01_10.191.5.0"
        prod-pfl2 = "vxw-dvs-82-universalwire-13-sid-10012-LS_PFC2_10.191.226.0"
        prod-pjl2 = "vxw-dvs-82-universalwire-33-sid-10032-LS_PJC2_10.232.202.0_23"
        ha-pfl2 = "vxw-dvs-801-universalwire-13-sid-10012-LS_PFC2_10.191.226.0"
        ha-pjl2 = "vxw-dvs-801-universalwire-33-sid-10032-LS_PJC2_10.232.202.0_23"
        prod-corp = "vxw-dvs-82-universalwire-39-sid-10038-LS_CORP_10.222.42.0_23"
        ha-corp = "vxw-dvs-801-universalwire-39-sid-10038-LS_CORP_10.222.42.0_23"
        estruturais = "vxw-dvs-83-virtualwire-7-sid-80007-LS_CORPTUTI01_10.191.5.0"
  }
}



variable "Rede_Workload" {
  description = "Numero da rede de WorkLoad pelo PHPIPAM"
     type        = "map"
    default     = {
        dev-pfl2 = "21"
        th-pfl2 = "22"
        th-pjl2 = "22"
        ti-pfl2 = "21"
        ti-pjl2 = "22"
        tu-pfl2 = "21"
        tu-pjl2 = "22"
        prod-pfl2 = "20"
        prod-pjl2 = "63"
        ha-pfl2 = "20"
        ha-pjl2 = "63"
        prod-corp = "70"
        ha-corp = "70"
        estruturais = "21"
  }
}

variable "vm_1_ipv4_gateway" {
     type        = "map"
  description = "IPv4 gateway for vNIC configuration"
  default     = {
        dev-pfl2 = "10.191.205.1"
        th-pfl2 = "10.191.205.1"
        th-pjl2 = "10.191.26.1"
        ti-pfl2 = "10.191.205.1"
        ti-pjl2 = "10.191.205.1"
        tu-pfl2 = "10.191.205.1"
        tu-pjl2 = "10.191.205.1"
        prod-pfl2 = "10.199.109.1"
        prod-pjl2 = "10.199.109.1"
        ha-pfl2 = "10.199.109.1"
        ha-pjl2 = "10.199.109.1"
        prod-corp = "10.222.44.1"
        ha-corp = "10.222.44.1"
        estruturais = "10.191.205.1"
  }
}

variable "vm_1_ipv4_prefix_length_management" {
  description = "IPv4 prefix length for vNIC configuration. The value must be a number between 8 and 32"
  default = {
        dev-pfl2 = "24"
        th-pfl2 = "24"
        th-pjl2 = "24"
        ti-pfl2 = "24"
        ti-pjl2 = "24"
        tu-pfl2 = "24"
        tu-pjl2 = "24"
        prod-pfl2 = "24"
        prod-pjl2 = "24"
        ha-pfl2 = "24"
        ha-pjl2 = "24"
        prod-corp = "23"
        ha-corp = "23"
        estruturais = "24"
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
        dev-pfl2 = "ALP-DS-L-HM"
        th-pfl2 = "ALP-DS-L-HM"
        th-pjl2 = "ALP-DS-L-HM"
        ti-pfl2 = "ALP-DS-L-HM"
        ti-pjl2 = "ALP-DS-L-HM"
        tu-pfl2 = "ALP-DS-L-HM"
        tu-pjl2 = "ALP-DS-L-HM"
        prod-pfl2 = "CTI-CLDS-TIER-1"
        prod-pjl2 = "CTI-CLDS-TIER-1"
        ha-pfl2 = "ALP-T2-L-PRD"
        ha-pjl2 = "ALP-T2-L-PRD"
        prod-corp = "CTI-CLDS-TIER-1"
        ha-corp = "ALP-T2-L-PRD"
        estruturais = "ALP-DS-L-HM"
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
        dev-pfl2 = "12"
        th-pfl2 = "12"
        th-pjl2 = "64"
        ti-pfl2 = "12"
        ti-pjl2 = "64"
        tu-pfl2 = "12"
        tu-pjl2 = "64"
        prod-pfl2 = "18"
        prod-pjl2 = "18"
        ha-pfl2 = "18"
        ha-pjl2 = "18"
        prod-corp = "67"
        ha-corp = "67"
        estruturais = "12"
  }
}

variable "IP_Icp_Bootnode" {

    description = "IP do ICP BootNode a ser provisionado"
    type        = "map"
    default     = {
        dev-pfl2 = "10.191.205.111"
        th-pfl2 = "10.191.205.191"
        th-pjl2 = "10.191.26.11"
        ti-pfl2 = "10.191.205.174"
        ti-pjl2 = "10.191.26.51"
        tu-pfl2 = "10.191.205.138"
        tu-pjl2 = "10.191.26.44"
        prod-pfl2 = "10.199.109.47"
        prod-pjl2 = "10.199.109.224"
        ha-pfl2 = "10.199.109.102"
        ha-pjl2 = "10.199.109.31"
        prod-corp = "10.222.44.12"
        ha-corp = "10.222.44.31"
        estruturais = "10.191.205.31"
  }
  
  
}


variable "vm_1-image" {
  description = "Operating system image id / template that should be used when creating the virtual image"
  type        = "map"
  default     = {
        dev-pfl2 = "TEMPLATE_ICP311_CAM160"
        th-pfl2 = "TEMPLATE_ICP311_CAM160"
        th-pjl2 = "TEMPLATE_ICP311_CAM160"
        ti-pfl2 = "TEMPLATE_ICP311_CAM160"
        ti-pjl2 = "TEMPLATE_ICP311_CAM160"
        tu-pfl2 = "TEMPLATE_ICP311_CAM160"
        tu-pjl2 = "TEMPLATE_ICP311_CAM160"
        prod-pfl2 = "TEMPLATE_ICP311_CAM160_PR"
        prod-pjl2 = "TEMPLATE_ICP311_CAM160_PR"
        ha-pfl2 = "TEMPLATE_ICP311_CAM160_PRHA"
        ha-pjl2 = "TEMPLATE_ICP311_CAM160_PRHA"
        prod-corp = "TEMPLATE_ICP311_CAM160_PR"
        ha-corp = "TEMPLATE_ICP311_CAM160_PRHA"
        estruturais = "TEMPLATE_ICP311_CAM160"
  }
}

variable "vm_1_network_gerenciamento" {
  description = "vSphere port group or network label for virtual machine's vNIC"
  type        = "map"
    default     = {
        dev-pfl2 = "PG-ALP-HOM-MGMT"
        th-pfl2 = "PG-ALP-HOM-MGMT"
        th-pjl2 = "PG-ALP-HOM-26"
        ti-pfl2 = "PG-ALP-HOM-MGMT"
        ti-pjl2 = "PG-ALP-HOM-MGMT"
        tu-pfl2 = "PG-ALP-HOM-MGMT"
        tu-pjl2 = "PG-ALP-HOM-26"
        prod-pfl2 = "PG-CTI-MGMT"
        prod-pjl2 = "PG-CTI-MGMT"
        ha-pfl2 = "PG-CTI-MGMT"
        ha-pjl2 = "PG-CTI-MGMT"
        prod-corp = "PG-CTI-MGMT-CORP"
        ha-corp = "PG-CTI-MGMT-CORP"
        estruturais = "PG-ALP-HOM-MGMT"
  }
}

variable "vm_1_ipv4_prefix_length_workload" {
      type        = "map"
  description = "IPv4 prefix length for vNIC configuration. The value must be a number between 8 and 32"
  default     = {
        dev-pfl2 = "24"
        th-pfl2 = "24"
        th-pjl2 = "24"
        ti-pfl2 = "24"
        ti-pjl2 = "24"
        tu-pfl2 = "24"
        tu-pjl2 = "24"
        prod-pfl2 = "23"
        prod-pjl2 = "23"
        ha-pfl2 = "23"
        ha-pjl2 = "23"
        prod-corp = "23"
        ha-corp = "23"
        estruturais = "24"
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
        dev-pfl2 = "ICP-DV"
        th-pfl2 = "ICP-HOM-PF"
        th-pjl2 = "ICP-HOM-PJ"
        ti-pfl2 = "ICP-TI"
        ti-pjl2 = "ICP-TI"
        tu-pfl2 = "ICP-TU"
        tu-pjl2 = "ICP-TU"
        prod-pfl2 = "ICP-PR1"
        prod-pjl2 = "ICPPR5PJ"
        ha-pfl2 = "ICP-HA1"
        ha-pjl2 = "ICP-HA5PJ"
        prod-corp = "ICP-PRO"
        ha-corp = "ICP-PR"
        estruturais = "ICP-ES"
        
  }
  
}
