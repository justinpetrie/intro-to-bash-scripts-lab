#!/bin/bash

# Check if a project name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME="$1"

# Create the project directory
mkdir "$PROJECT_NAME" || {
  echo "Failed to create directory '$PROJECT_NAME'"
  exit 1
}

# Move into the project directory
cd "$PROJECT_NAME" || {
  echo "Failed to enter directory '$PROJECT_NAME'"
  exit 1
}

# Create README.md with a basic template
cat <<EOF > README.md
# $PROJECT_NAME

Brief description of the project.

## Usage

Explain how to use the script here.
EOF

# Create the main script file
SCRIPT_FILE="$PROJECT_NAME.sh"
cat <<EOF > "$SCRIPT_FILE"
#!/bin/bash

# $PROJECT_NAME script

echo "Hello from $PROJECT_NAME!"
EOF

# Make the script executable
chmod +x "$SCRIPT_FILE"

# Initialize a new Git repository
git init >/dev/null 2>&1 && echo "Initialized empty Git repository in $(pwd)/.git"

# Stage and commit initial files
git add README.md "$SCRIPT_FILE"
git commit -m "Initial commit with README and script file" >/dev/null 2>&1

echo "Project '$PROJECT_NAME' has been set up successfully!"