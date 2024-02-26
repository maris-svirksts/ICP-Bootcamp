Terraform modules are containers for multiple resources that are used together. A module can include resources, input variables, output values, and even other modules. Terraform modules enable you to reuse and modularize your infrastructure definitions, making your Terraform configurations more organized, maintainable, and scalable.

### Basic Concepts

- **Root Module:** This is the Terraform configuration defined in the directory where Terraform is run. It can call other modules and is considered the entry point of your Terraform configuration.
- **Child Modules:** These are modules called by the root module or other modules. They are defined in separate directories and are included in the root module through module blocks.

### Benefits of Using Modules

- **Reusability:** Modules allow you to reuse common configurations across different projects or parts of your infrastructure, reducing duplication and errors.
- **Organization:** By dividing your configuration into smaller, focused modules, you make it easier to manage and understand.
- **Encapsulation:** Modules can abstract complexity by exposing only necessary inputs (via variables) and outputs, hiding the underlying resource details.

### Defining a Module

A module is defined by creating a new directory and placing Terraform configuration files (.tf files) inside it. Here's a simple example structure:

```
terraform-project/
├─ main.tf          # Root module
├─ variables.tf     # Variable definitions for the root module
├─ outputs.tf       # Output definitions for the root module
└─ modules/
   └─ networking/   # Networking module
      ├─ main.tf
      ├─ variables.tf
      └─ outputs.tf
```

### Using Modules

To use a module in your Terraform configuration, you define a module block in your `.tf` files. Here’s an example of how to call a module:

```hcl
module "networking" {
  source = "./modules/networking"
  vpc_cidr = "10.0.0.0/16"
}
```

- **`source`** specifies the location of the module. This can be a local path, a URL, or a reference to a Terraform Registry.
- Other arguments passed to the module (like `vpc_cidr` in the example) are input variables defined in the module.

### Passing Inputs to Modules

Modules can have input variables defined much like variables in the root module. You pass values to these inputs through the module block:

```hcl
# Inside modules/networking/variables.tf
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

# Inside main.tf where the module is called
module "networking" {
  source   = "./modules/networking"
  vpc_cidr = "10.0.0.0/16" # Passing value to the module's input variable
}
```

### Module Outputs

Modules can also define outputs that can be used by other parts of your Terraform configuration:

```hcl
# Inside modules/networking/outputs.tf
output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

# Accessing this output from the root module
output "networking_vpc_id" {
  value = module.networking.vpc_id
}
```

### Module Sources

Modules can be sourced from various locations:

- **Local Paths:** Use relative or absolute paths to include modules located in your file system.
- **Terraform Registry:** Public modules shared in the Terraform Registry can be referenced by their registry path.
- **Git Repositories:** Modules can be sourced directly from Git repositories using URLs.

### Versioning and Updating Modules

When using modules from the Terraform Registry or Git repositories, you can pin to specific versions or branches to manage updates and ensure consistency.
