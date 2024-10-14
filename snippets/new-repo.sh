new-repo() {
    # If no project name is provided, use current directory name
    if [ -z "$1" ]; then
        local project_name="${PWD##*/}"
        echo -e "\033[1;34mℹ️ No project name provided. Using current directory name: '\033[1;36m$project_name\033[1;34m'.\033[0m"
    else
        local project_name="$1"
    fi

    # Prompt the user to enter project name (defaults to current project name)
    echo -n "Enter project name [$project_name]: "
    read input_name
    if [ -n "$input_name" ]; then
        project_name="$input_name"
    fi

    while true; do
        # Convert project name to lowercase and kebab-case
        modified_project_name=$(echo "$project_name" | tr '[:upper:]' '[:lower:]' | sed -E 's/[ _]+/-/g; s/[^a-z0-9-]//g')

        # Show the modified project name and ask for confirmation
        echo -e "\033[1;34mℹ️ Project name after formatting: '\033[1;36m$modified_project_name\033[1;34m'.\033[0m"
        echo -n "Do you want to use this project name? (Y/n): "
        read confirm_name
        if [[ "$confirm_name" =~ ^[Yy]$ ]] || [ -z "$confirm_name" ]; then
            break
        else
            echo -n "Enter new project name: "
            read project_name
            if [ -z "$project_name" ]; then
                echo -e "\033[1;31m❌ Project name cannot be empty.\033[0m"
                return 1
            fi
        fi
    done

    project_name="$modified_project_name"

    # Check if gh CLI is installed
    if ! command -v gh &> /dev/null; then
        echo -e "\033[1;31m❌ Error: gh (GitHub CLI) is not installed. Please install it and try again.\033[0m"
        return 1
    fi

    # Ensure we are in a git repository
    if [ ! -d .git ]; then
        git init
        echo -e "\033[1;32m✅ Initialized git repository in the current directory.\033[0m"
    else
        echo -e "\033[1;34mℹ️ Git repository already exists in the current directory.\033[0m"
    fi

    # Check if remote 'origin' already exists
    if git remote get-url origin &> /dev/null; then
        echo -e "\033[1;33m⚠️ Remote 'origin' already exists. Aborting to prevent overwriting the existing remote.\033[0m"
        return 1
    fi

    # Create a new private GitHub repository and set it as remote origin
    if gh repo create "$project_name" --private --disable-wiki --source=. --remote=origin; then
        echo -e "\033[1;32m✅ New repository '\033[1;36m$project_name\033[1;32m' created, remote 'origin' set, and code pushed.\033[0m"
    else
        echo -e "\033[1;31m❌ Failed to create repository '\033[1;36m$project_name\033[1;31m' on GitHub.\033[0m"
        return 1
    fi
}