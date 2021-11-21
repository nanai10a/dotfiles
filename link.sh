#!/bin/zsh

function unknown_command() {
    echo 'unknown command. see `link.sh help`.'
    exit 1
}

# --------- prepare ---------

if [[ $# -le 1 ]]
then
    is_illegal_args='false'
fi

mode=$1

if [[ $# -eq 0 ]]
then
    mode='update'
fi

if [[ $is_illegal_args != 'false' ]]
then
    unknown_command
fi

# --------- process ---------

case $mode in
    'setup')
        echo 'unimplemented!'
        exit 1
        ;;
    'update')
        echo 'unimplemented!'
        exit 1
        ;;
    'remove')
        echo 'unimplemented!'
        exit 1
        ;;
    'help')
        echo 'link.sh'
        echo 'small scripts to manage dotfiles.'
        echo
        echo 'USAGE:'
        echo '    link.sh [MODE]'
        echo
        echo 'MODES:'
        echo '    setup   initial settings and linking files (require `sudo`)'
        echo '    update  update linking files'
        echo '    remove  remove linking files'
        echo '    help    show this'
        ;;
    *)
        unknown_command
        ;;
esac
