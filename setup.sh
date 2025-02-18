#!/bin/bash

set -e

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y zsh unzip build-essential git

OH_MY_ZSH_REPO="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
RUNZSH=no CHSH=no sh -c "$(curl -fsSL $OH_MY_ZSH_REPO)"
sudo chsh -s $(which zsh) $USER

NVM_REPO="https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh"
curl -o- $NVM_REPO | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node

BUN_REPO="https://bun.sh/install"
curl -fsSL $BUN_REPO | bash

THEME_REPO="https://raw.githubusercontent.com/EmiCode-eng/System-config/refs/heads/main/emi.zsh-theme"

curl -o $HOME/.oh-my-zsh/custom/themes/emi.zsh-theme $THEME_REPO

# Zsh
sed -i 's/ZSH_THEME=.*/ZSH_THEME="emi"/' ~/.zshrc

echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc

# bun completions
echo '[ -s "/home/emily/.bun/_bun" ] && source "/home/emily/.bun/_bun"' >> ~/.zshrc

# bun
echo 'export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"' >> ~/.zshrc

# Git
git config --global user.name "Emily"
git config --global user.email "emilyalemaneos@gmail.com"
git config --global init.defaultBranch main
git config --global alias.ac 'git commit -am'
git config --global alias.lob 'log --graph --oneline --decorate'
git config --global alias.st 'status'

# SSH Key
SSH_KEY_PATH="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY_PATH" ]; then
    ssh-keygen -t ed25519 -C "emilyalemaneos@gmail.com" -f "$SSH_KEY_PATH" -N ""
fi

echo "✅ Instalación completada!"
echo "🔑 Tu clave SSH pública es:"
cat ~/.ssh/id_ed25519.pub
echo "\nReinicia tu terminal para aplicar los cambios"
