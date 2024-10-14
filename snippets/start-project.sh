start-project() {
    local project_name=${1:-"example"}
    local project_path="$HOME/code/$project_name"
    local subdomain=${2:-$project_name}

    open -a "Android Studio" "$project_path-app"
    open -a "PhpStorm" "$project_path"
    open -a "Sourcetree" "$project_path"
    open -a "Sourcetree" "$project_path-app"

    osascript -e "tell application \"iTerm\"
        if not (exists window 1) then
            create window with default profile
        end if

        tell current window
            # Remember the initial tab
            set initialTab to current tab

            # Create tab for sharing
            create tab with default profile
            tell current session of current tab
                write text \"cd $project_path && herd share --subdomain=$subdomain --server=eu-1 https://$project_name.test\"
            end tell

            # Create tab for installation and development
            create tab with default profile
            tell current session of current tab
                write text \"cd $project_path && npm i && npm run dev\"
            end tell

            # Create tab for installation and development
            create tab with default profile
            tell current session of current tab
                write text \"cd $project_path && composer install\"
            end tell

            # Switch back to the initial tab
            select initialTab
        end tell
        activate
    end tell"
}