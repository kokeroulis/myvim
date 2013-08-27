function downloadOrUpdate()
{
    githubRepo = $1
    repositoryName = $2
    if [ ! -d $i ]
     then
        git clone $githubRepo/$repositoryName
    else
        cd $i
        git pull
        cd ..
    fi
}



if [ ! -L ~/.vimrc ]
then
    ln -sv $PWD/vimrc $HOME/.vimrc
fi

user1Repositories[0]="vim-javascript"
user1Repositories[1]="vim-handlebars"
user1Repositories[2]="vim-qml"
user1Repositories[3]="jade.vim"
user1Repositories[4]="AutoComplPop"

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

for i in ${user1Repositories[@]}
do
    downloadOrUpdate "https://githib.com/terietor" $i
done


