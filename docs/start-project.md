# start-project

## Overview

`start-project` is a Zsh function that automates the setup of a development environment for a Laravel backend with a
Flutter mobile app.

## Assumptions

- Backend: `~/code/my-project` (Laravel)
- Flutter app: `~/code/my-project-app`
- Laravel Herd installed
- Expose.dev pro subscription (optional)
- Installed: Android Studio, PhpStorm, Sourcetree

## What it does

1. Opens IDE and version control:

   - Android Studio: `~/code/my-project-app`
   - PhpStorm: `~/code/my-project`
   - Sourcetree: Both projects

2. Creates iTerm tabs:
   - Herd share: Proxies mobile traffic through known domain
   - npm: Installs dependencies, runs dev server
   - Composer: Installs dependencies

## Prerequisites

- Zsh
- iTerm2
- Android Studio
- PhpStorm
- Sourcetree
- Laravel Herd
- npm
- Composer

## Installation

1. Add function to `.zshrc` or source from separate file
2. Reload: `source ~/.zshrc`

## Usage

```zsh
start-project [project_name] [subdomain]
```

Example:

```zsh
start-project myproject mysubdomain
```

## Mobile app traffic tunneling

By using Expose.dev (or alternatives), you can avoid dealing with different IP addresses for iOS and Android emulators
when referring to the "host machine" (iOS uses `localhost`, while Android emulator uses `10.0.2.2`).

Command used in the script (Expose.dev):

```
herd share --subdomain=$subdomain --server=eu-1 https://$project_name.test
```

Alternative commands for other tools:

```shell
# ngrok
ngrok http https://$project_name.test

# localtunnel
lt --subdomain $subdomain --port 80

# Cloudflare Tunnel
cloudflared tunnel --url https://$project_name.test
```

Replace these commands in the script as needed based on your preferred tunneling tool.

## Customization

Modify function to:

- Change default project location
- Add/remove applications
- Alter iTerm commands
- Change sharing server or tunneling tool

## Note

Ensure project structure matches expected paths or adjust accordingly.

This readme is partially AI generated. Alternative commands for sharing server and tunneling tools have not been tested
for accuracy.
