# The Task
## Terraform and Snowflake Integration Task
Objective: Leverage Terraform to automate the provisioning of Snowflake resources, ensuring adherence to Infrastructure as Code (IaC) best practices.

### Task Description:
As part of this task, you are to create a series of Terraform scripts/modules that will provision the following Snowflake resources:
1. Warehouse: A compute warehouse suitable for processing queries and data manipulation tasks.
2. Database: A dedicated database to house various schemas and tables.
3. Schema: Within the database, create a specific schema intended for the tables.
4. Table: A table within the schema that includes at least four columns of varying data types.
5. Role: A role with permissions that allow for database, schema, and warehouse access, and select privileges on the table.

### Requirements:
- Do Not Repeat Yourself (DRY): Write modular Terraform code, reusing blocks where possible to minimize repetition.
- Avoid Hardcoding: No hardcoded values should be used for any inputs that might vary between deployments (e.g., warehouse sizes, database names). Use Terraform variables and input variables files where appropriate.
- Parameterization: Ensure that resource names and other significant parameters can be easily altered without changing the main script logic.
- Security: Ensure that sensitive information is not exposed and that the principle of least privilege is followed when assigning role permissions.
- Documentation: Provide clear documentation within the code, including comments and a README file detailing how to use the scripts/modules.
- Version Control: Maintain the code in a version-controlled repository with appropriate commit messages.

### Deliverables:
- Terraform scripts/modules with a clear directory structure.
- A variables.tf file defining all the required inputs.
- A terraform.tfvars.example file that provides template values for the variables.
- A README.md file explaining the purpose of the scripts/modules, how to configure and run them, and any prerequisites or dependencies.
- Any additional scripts or tools used for the setup should be included in the repository with explanations in the README.md.

### Evaluation Criteria:
- Functionality: The Terraform code should execute without errors and create the resources as defined.
- Best Practices: The code should reflect Terraform and IaC best practices.
- Modularity and Reusability: Scripts/modules should be written in a way that they can be reused in different environments or scenarios.
- Documentation: Documentation should be clear, concise, and sufficient for a new user to understand and use the codebase.
- Code Quality: The code should be well-organized, commented, and easy to maintain.

# The Solution
## Terraform and Snowflake Integration

This project contains Terraform scripts for automating the provisioning of Snowflake resources, including a warehouse, database, schema, table, and role, following Infrastructure as Code (IaC) best practices.

### Prerequisites
- Terraform installed on your machine.
- Snowflake account credentials.

### Setup Instructions
1. Clone this repository.
2. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in your specific values.
3. Run `terraform init` to initialize the Terraform environment.
4. Run `terraform plan` to review the changes that will be applied.
5. Run `terraform apply` to apply the changes to your Snowflake account.

### Modules
This project is structured into modules for each resource type:
- `warehouse`: Provisions a compute warehouse.
- `database`: Creates a dedicated database.
- `schema`: Creates a schema within the specified database.
- `table`: Creates a table within the specified schema.
- `role`: Creates a role with specific permissions.

### Customization
Edit `terraform.tfvars` to customize the parameters as needed.

### Security
Ensure your Snowflake credentials are securely stored and never hardcode sensitive information in your Terraform files.

### Problems
│ Error: could not retrieve private key: private Key file could not be read err = could not read private key err = open -----BEGIN PRIVATE KEY-----
│ MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCrqyDo3Sbak97T
│ TMTTptY5x6purotJMg9xKQFUNWQtIMzhkk+mU6DQOZsHYLg6UMK7Gye9z3VoE0O6
......................

### Notes
Documentation polished by ChatGPT