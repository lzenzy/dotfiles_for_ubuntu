#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"
SAVE_DIR="${HOME}/.backup_dotfiles"
cd ${DOT_DIRECTORY}
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

# sudo用パスワードの入力
printf "password :"
read -s password

# vim編集時のバックアップ用ディレクトリの作成
if [ -d ${HOME}/.vimbackup ]; then
    echo ".vimbackup directory is already exist."
else
    mkdir ${HOME}/.vimbackup
    echo $(tput setaf 2)Success: .vimbackup directory has been successfully created !. ✔︎$(tput sgr0)
fi

# dotfileにシンボリックリンクを張る
echo $(tput setaf 2)Deploying!$(tput sgr0)
for f in .??*
do
    # リンクを張らないファイル
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitconfig" ]] && continue
    [[ ${f} = ".config" ]] && continue

    # dotfilesディレクトリ内のドットファイルにリンクをはる
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

# .gitconfigをコピー
cp ~/dotfiles/.gitconfig ~/

# .configディレクトリが無ければ作成し、.config/nvimにリンクをはる
if [ -n "`find \"${HOME}/.config\" -maxdepth 0 -type l`" ];then
  echo ".config symbolic-link is already exist."
else
  if [ ! -d ${HOME}/.config ]; then
    mkdir ${HOME}/.config
    echo ".config directory created"
  else
    echo ".config directory is already exist."
  fi
  ln -snfv ${DOT_DIRECTORY}/.config/nvim ${HOME}/.config/nvim
fi
echo $(tput setaf 2)Succes: Deploy dotfiles complete!. ✔︎$(tput sgr0)
echo

tput setaf 2


# ctagsのインストール
if command -v ctags &> /dev/null; then
        tput setaf 7
        echo "$password"|sudo -S apt install -y ctags
        tput setaf 2
        echo ctags is installed! ✔︎
        echo
else
    echo ctags is already installed! ✔︎
fi

# The Platinum Search のインストール
if type pt >/dev/null 2>&1; then
    echo pt is already installed! ✔︎
else
    echo 'pt is not installed.'
    curl -L -O https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.2.0/pt_linux_386.tar.gz
    tar -zxvf pt_linux_386.tar.gz
    echo "$password"|sudo -S cp pt_linux_386/pt /usr/local/bin/
    rm -rf pt_linux_386
    echo pt is installed! ✔︎
    echo
fi

                                                                     
                                                                     
  ---[[ インストール完了 ]]---------------------------------         
  ### Ctagsのタグファイルを作成 #####                                
  *タグジャンプを行いたいプロジェクト内で*                           
  $ ctags -R --exclude=.git                                          
                                                                     
  ### nvimのプラグインインストール #####                             
  # nvimを起動して下記の通りプラグインをインストールしてください     
                                                                     
  $ nvim                                                             
  :call dein#install()                                               
  :call dein#update()                                                
  :UpdateRemotePlugins                                               
                                                                     
                                                                     
  ### X11のインストール #####                                        
                                                                     
  * クライアント側にX11をインストール                                
  ** MacOS                                                           
  下記サイトからXQuartzをインストール                                
  [https://www.xquartz.org/](https://www.xquartz.org/)               
  ** Windows10 WSL2 Kali Linux                                       
  VcXsrvをインストール
  (Kali Linux上で）
  $ sudo apt install x11-apps x11-utils x11-xserver-utils dbus-x11     
  $ xeyes
  -> 目玉が表示されれば、WSLとWindows10の通信はできている。

                                                                     
                                                                     
  * リモートにXオプションで接続                                      
                                                                     
  $ ssh -X [host]                                                    
                                                                     
  * X11Forwardingを有効にする                                        
  $ sudo vim /etc/ssh/sshd_config                                    
                                                                     
  - # X11Forwarding no                                               
  - # X11DisplayOffset 10                                            
  + X11Forwarding yes                                                
  + X11DisplayOffset 10                                              
                                                                     
  * X11をインストール                                                
  $ sudo yum install xauth                                           
  $ sudo yum install xterm                                           
  $ sudo yum install xorg-x11-apps                                   
  $ xeyes                                                            
                                                                     
  -> 目玉が表示されればOK                                            
                                                                     
                                                                     
EOF
tput sgr0
