import os
from pathlib import Path

code_to_remove = """
terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}
""".strip()


def remove_code_from_files(start_path):
    for root, _, files in os.walk(start_path):
        for file in files:
            if file == "main.tf":
                file_path = os.path.join(root, file)
                with open(file_path, "r+", encoding="utf-8") as f:
                    original_content = f.read()

                    if code_to_remove in original_content:
                        # Remove the specified code and strip trailing whitespace
                        modified_content = original_content.replace(
                            code_to_remove, ""
                        ).strip()

                        # Reset file pointer to the beginning and write modified content
                        f.seek(0)
                        f.write(modified_content + "\n")
                        f.truncate()  # Truncate the file to the current position to remove leftover content


project_directory_path = Path(__file__).parent.parent

remove_code_from_files(project_directory_path)

print(
    f"Checked and updated all main.tf files within the {project_directory_path} directories."
)
