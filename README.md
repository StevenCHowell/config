# Config Setup

## Make ZSH the default shell

    chsh -s $(which zsh)

## Install oh-my-zsh

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install powerlevel10k: A Zsh theme

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## Version Control for Settings Files

[The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)

Run the following commands to create the repo locally, then

```bash
git init --bare $HOME/.cfg
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'  # linux/windows
config config --local status.showUntrackedFiles no
config remote add origin git@github.com:StevenCHowell/config.git
config pull origin master
config push --set-upstream origin master
```
