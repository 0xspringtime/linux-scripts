import csv
import subprocess

# Get the list of all installed packages
p = subprocess.run(["pacman", "-Q"], capture_output=True, text=True)
installed_packages = p.stdout.strip().split("\n")

# Create an empty list to store package information
package_list = []

# Iterate through each package
for package in installed_packages:
    # Get the package name and version
    name, version = package.split(" ")
    # Get the list of dependencies for the package
    p = subprocess.run(["pacman", "-Qi", name], capture_output=True, text=True)
    dependencies = p.stdout.split("\n")
    # Find the line that starts with "Depends On"
    for line in dependencies:
        if line.startswith("Depends On"):
            deps = line.split(":")[1].strip()
            break
    else:
        deps = "None"
    # Add the package name, version, and dependencies to the package_list
    package_list.append([name, version, deps])

# Write the package information to a CSV file
with open("packages.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["Name", "Version", "Dependencies"])
    writer.writerows(package_list)

print("Package information saved to packages.csv")
