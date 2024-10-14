# --------------------------------------------------------------------------------------------------------------
# ALIASES
# --------------------------------------------------------------------------------------------------------------

# Open the database called "Laravel Herd" in TablePlus (or whatever your database client is, as long as it supports the `mysql://` protocol)
alias db="open 'mysql://@127.0.0.1?name=Laravel%20Herd'"

# Open the shell configuration file in Jetbrains Fleet
alias shellconfig="fleet ~/.zshrc"

# if you use Visual Studio Code, you can use the following alias instead:
alias shellconfig="code ~/.zshrc"

# Open aider-chat config file in Jetbrains Fleet
alias aiderconf="fleet ~/.aider.conf.yml"

# Fetch git remotes, run prune, and remove local branches that have been deleted on the remote
alias prune="git fetch -p && npx git-removed-branches --prune --force"

# Setup for Laravel Sail
# See: https://laravel.com/docs/11.x/sail#configuring-a-shell-alias
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# Reload the shell configuration
alias reload="source ~/.zshrc && echo '✅ ZSH configuration reloaded.'"


#:: Typos
alias claer='clear'

# Shortcuts for common commands related to laravel
alias pint="./vendor/bin/pint"
alias f="./vendor/bin/pint"
alias mfs='php artisan migrate:fresh --seed'
alias work='php artisan queue:work --timeout=0'
alias format="composer format && npm run format"

# Runs composer update and installs all dependancies and clears config7caches
# Assumes you have a composer script called "app:clear", i usually bundle all the commands needed to clear the cache, view, config, etc in this composer script
alias fixall="composer u && yarn && yarn build && composer app:clear && format"

# Same, but using composer install instead of composer update
alias doinstall="composer i && yarn && yarn build && composer app:clear && format"

# Migrate and seed the database in Laravel Sail
alias smfs='sail artisan migrate:fresh --seed'

# Run the queue worker in Laravel Sail
alias swork='sail artisan queue:work'

# Share a local site using Laravel Herd with custom subdomain and hostname
alias share="herd share --subdomain=wahtever --server=eu-1 https://whatever.test"

# Format dart code and apply any "dart fix" suggestions in the lib/ directory
alias dartfix="dart fix lib/ --apply && dart format lib/"
