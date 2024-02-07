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