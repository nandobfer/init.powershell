echo "installing scoop"
iwr -useb get.scoop.sh | iex

echo "installing neovim"
scoop install neovim gcc

echo "installing auto-completion"
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck

echo "installing gh"
scoop install gh

echo "installing git"
scoop install git

echo "installing sudo"
scoop install sudo

echo "installing python"
scoop install python

echo "installing terminal icons"
scoop bucket add extras
scoop install terminal-icons

echo "installing oh-my-posh"
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json

echo "installing firacode font"
sudo choco install firacodenf

echo "installing vscode"
scoop bucket add extras
scoop install vscode
reg import "$HOME\scoop\apps\vscode\current\install-context.reg"/
reg import "$HOME\scoop\apps\vscode\current\install-associations.reg"

echo "installing node.js"
scoop install nodejs-lts 
# cinst nodejs.install
# choco install nvs ; nvs add lts ; nvs link lts

echo "installing node packages"
npm i -g yarn nodemon concurrently tsc

echo "clonning powershell profile"
cd $HOME
mkdir github
git clone https://github.com/nandobfer/ps-profile

echo "catting profile"
cd ps-profile
cat profile.ps1 > $PROFILE
. $PROFILE

echo "configuring git"
git config credential.helper store
$email = Read-Host -Prompt 'git email: '
$username = Read-Host -Prompt 'git username: '
git config --global user.email $email
git config --global user.name $username