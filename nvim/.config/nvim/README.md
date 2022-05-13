## Add Python support

```
# Ubuntu
sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

pyenv install -l # List and choose versions

pyenv install 2.7.18
pyenv virtualenv 2.7.18 neovim2
pyenv activate neovim2
pip install neovim
source deactivate

pyenv install 3.9.1
pyenv virtualenv 3.9.1 neovim3
pyenv activate neovim3
pip install neovim
source deactivate
```
