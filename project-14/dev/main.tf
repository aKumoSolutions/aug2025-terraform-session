module "sg" {
############## to call module #################
    source = "../../modules/sg" // where the module is, we can source modules locally and remotely
############## to specify module version ######
//  version = "3.3.0"
############## to pass values to variables ####
    name = "dev-sg"
    description = "This is a Dev security group"
}

module "ec2" {
    source = "../../modules/ec2"
############ variables #########
    env = "dev"
    ami = "ami-00a8151272c45cd8e"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ module.sg.security_group_id ]
}

// How to reference to Child Module?
// When a child module references to another child module, you will need to use outputs
// Similar to data.terraform_remote_state.network.outputs.private_subnet_ids

// Syntax: module.module_name.output_name
// Example: module.sg.security_group_id