# Config Setup

## Make ZSH the default shell

    chsh -s $(which zsh)

## Install oh-my-zsh

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install powerlevel10k: A Zsh theme

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

### Install the recommended powerlevel20k font

1. Download these four ttf files and place them in the folder `/usr/local/share/fonts/`
   - [MesloLGS NF Regular.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
   - [MesloLGS NF Bold Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)
   - [MesloLGS NF Bold.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
   - [MesloLGS NF Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)

```bash
cd ~/Downloads/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
     https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf \
     https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
     https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
sudo mv *.ttf /usr/local/share/fonts
```
 
2. [Configure your terminal to use the `MesloLGS NF` font](https://github.com/romkatv/powerlevel10k#manual-font-installation)

## Version Control for Settings Files

[The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)

Run the following commands to create the repo locally, then

```bash
git init --bare $HOME/.cfg
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'  # linux/windows
config config --local status.showUntrackedFiles no
config remote add origin git@github.com:StevenCHowell/config.git
rm ~/.bashrc ~/.zshrc
config pull origin master
config push --set-upstream origin master
```
