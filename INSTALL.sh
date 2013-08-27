if [ ! -L ~/.vimrc ]
then
    ln -sv $PWD/vimrc $HOME/.vimrc
fi

repositories[0]="vim-javascript"
repositories[1]="vim-handlebars"
repositories[2]="vim-qml"
repositories[3]="jade.vim"
repositories[4]="AutoComplPop"

if [ ! -d ~/.vim/autoload ] || [ ! -d ~/.vim/bundle ]
then
    mkdir -p ~/.vim/autoload
    mkdir -p ~/.vim/bundle
fi

if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
    curl -Sso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

cd ~/.vim/bundle

for i in ${repositories[@]}
do
    if [ ! -d $i ]
     then
        git clone "https://github.com/terietor/"$i
    else
        cd $i
        git pull
        cd ..
    fi
done


