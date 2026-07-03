import os

staging_path = "models/staging"

for file in os.listdir(staging_path):
    if file.endswith(".sql") and file.startswith("stg_"):
        filepath = os.path.join(staging_path, file)
        with open(filepath, "r") as f:
            content = f.read()
        content=content.replace(
            "*,  \n from source",
            "*, {{get_ingestion_timestamp()}} \n from source "
        )

        with open(filepath,"w") as f:
            f.write(content)