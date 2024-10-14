## `new-repo` - Create a New GitHub Repository from Local Directory

The `new-repo` function is a Zsh snippet that simplifies the process of creating a new GitHub repository from your local
directory. It automates several steps, including initializing a git repository (if necessary), creating a private GitHub
repository, and setting up the remote.

### Features

- Automatically uses the current directory name as the project name if none is provided
- Allows user input for the project name with a default option
- Converts the project name to lowercase and kebab-case format
- Confirms the formatted project name with the user
- Checks for the presence of the GitHub CLI (`gh`)
- Initializes a git repository if one doesn't exist
- Creates a private GitHub repository with disabled wiki
- Sets the new repository as the remote origin

### Prerequisites

1. [Zsh](https://www.zsh.org/) shell
2. [GitHub CLI](https://cli.github.com/) (`gh`)
3. [Git](https://git-scm.com/)

### Installation

1. Clone this repository:

   ```
   git clone https://github.com/yourusername/my-zsh-snippets.git
   ```

2. Add the following line to your `.zshrc` file:

   ```
   source /path/to/my-zsh-snippets/new-repo.zsh
   ```

3. Reload your Zsh configuration:
   ```
   source ~/.zshrc
   ```

### Usage

1. Navigate to the directory where you want to create a new repository.

2. Run the `new-repo` function:

   ```
   new-repo [project_name]
   ```

   If you don't provide a project name, it will use the current directory name.

3. Follow the prompts to confirm or modify the project name.

4. The function will create a new private GitHub repository and set it up as your remote origin.

### Configuring GitHub CLI

Before using the `new-repo` function, make sure you have configured the GitHub CLI:

1. Install GitHub CLI following the [official instructions](https://github.com/cli/cli#installation).

2. Authenticate with your GitHub account:

   ```
   gh auth login
   ```

   Follow the prompts to complete the authentication process.

3. Verify your authentication:
   ```
   gh auth status
   ```

Now you're ready to use the `new-repo` function!

## Contributing

Contributions to improve existing snippets or add new ones are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
