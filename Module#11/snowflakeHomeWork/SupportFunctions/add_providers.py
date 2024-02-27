import os
from pathlib import Path

code_to_prepend = """
terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}
""".strip()


def prepend_providers(start_path):
    for root, _, files in os.walk(start_path):
        for file in files:
            if file == "main.tf":
                file_path = os.path.join(root, file)
                with open(file_path, "r+", encoding="utf-8") as f:
                    original_content = f.read()

                    if code_to_prepend not in original_content:
                        f.seek(0)
                        f.write(code_to_prepend + "\n\n" + original_content)


project_directory_path = Path(__file__).parent.parent

prepend_providers(project_directory_path)

print(
    f"Checked and updated all main.tf files within the {project_directory_path} directories."
)
