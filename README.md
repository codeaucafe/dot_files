# Dotfiles Backup

A version-controlled repository for managing dotfiles using symlinks. This approach allows tracking configuration files
in git without making the home directory a git repository.

## How It Works

Dotfiles are stored in this repository and symlinked to their expected locations in the home directory. When
applications read their config files, they follow the symlink to the version-controlled file in this repo.

```
~/.zshrc  →  /path/to/dotfiles_backup/.zshrc
```

Changes made to either location are reflected immediately since they point to the same file.

## Repository Structure

```
dotfiles_backup/
├── .bash_profile       # Bash login shell
├── .bashrc             # Bash interactive shell
├── .zshrc              # Zsh interactive shell
├── .zprofile           # Zsh login shell
├── .zshenv             # Zsh environment variables
├── .p10k.zsh           # Powerlevel10k prompt theme
├── oh-my-posh.json     # Oh My Posh prompt theme
└── config/
    ├── ghostty/
    │   └── config      # Ghostty terminal configuration
    └── starship/
        └── starship.toml  # Starship prompt configuration
```

## Symlink Locations

| Repository File         | Symlink Location           |
|-------------------------|----------------------------|
| `.zshrc`                | `~/.zshrc`                 |
| `.bashrc`               | `~/.bashrc`                |
| `.bash_profile`         | `~/.bash_profile`          |
| `.zprofile`             | `~/.zprofile`              |
| `.zshenv`               | `~/.zshenv`                |
| `.p10k.zsh`             | `~/.p10k.zsh`              |
| `config/ghostty/config` | `~/.config/ghostty/config` |

## Setup

### Adding a New Dotfile

1. Create the directory structure in this repo (if needed):
   ```bash
   mkdir -p config/app-name
   ```

2. Move the existing config file to the repo:
   ```bash
   mv ~/.config/app-name/config /path/to/dotfiles_backup/config/app-name/config
   ```

3. Create the symlink:
   ```bash
   ln -s /path/to/dotfiles_backup/config/app-name/config ~/.config/app-name/config
   ```

4. Commit the changes:
   ```bash
   git add config/app-name/config
   git commit -m "feat(app-name): add app-name configuration"
   ```

### Cloning to a New Machine

1. Clone the repository:
   ```bash
   git clone git@github.com:codeaucafe/dot_files.git ~/dotfiles
   ```

2. Create symlinks for each dotfile (adjust path if you cloned elsewhere):
   ```bash
   DOTFILES=~/dotfiles

   ln -s $DOTFILES/.zshrc ~/.zshrc
   ln -s $DOTFILES/.bashrc ~/.bashrc
   ln -s $DOTFILES/.bash_profile ~/.bash_profile
   ln -s $DOTFILES/.zprofile ~/.zprofile
   ln -s $DOTFILES/.zshenv ~/.zshenv
   ln -s $DOTFILES/.p10k.zsh ~/.p10k.zsh

   # Config directory files
   mkdir -p ~/.config/ghostty
   ln -s $DOTFILES/config/ghostty/config ~/.config/ghostty/config
   ```

## Benefits

- **Version Control**: Track changes to dotfiles over time
- **Portability**: Easily sync configurations across machines
- **No Home Directory Repo**: Keep home directory clean without `.git` folder
- **Immediate Updates**: Changes to repo files are instantly reflected in the system

## Notes

- Backup existing dotfiles before creating symlinks
- Some applications may not follow symlinks; test after setup
- The `.gitignore` excludes IDE settings, macOS metadata, and virtual environments
- **Starship prompt**: The Starship configuration (`config/starship/starship.toml`) is included but not currently
  symlinked or in use. Currently using Powerlevel10k. When ready to switch, symlink it to `~/.config/starship.toml`
