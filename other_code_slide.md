# This file

## Preface

- [This file](#this-file)
    - [Preface](#preface)
    - [Code slide](#code-slide)
        - [Bash](#bash)
        - [python](#python)


## Code slide

### Bash

* getopts

    ```bash
    usage="$(basename $0) [-h] [-build mode] -- runcmd all in one.  \n\n where:\n    -h  show this help text\n    -b  build mode all|kfstore|skyfs|fsal \n"

    mode='all'

    SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )" #"

    repopath="$(dirname "$SCRIPTPATH")"

    while getopts "hb:" opt; do
    case "$opt" in
        h) echo -e "$usage"
        exit
        ;;
        b) mode=$OPTARG
        ;;
        \?) printf "illegal option: -%s\n" "$OPTARG" >&2
        echo -e $usage >&2
        exit 1
        ;;
        :) printf "missing argument for -%s\n" "$OPTARG" >&2
        echo -e $usage >&2
        exit 1
        ;;
    esac
    done
    shift $((OPTIND - 1))

    mainfunc $mode
    ```

* color print

### python

* color print 

    ```python
    def colored(s, color) :
        if (color == 'green') :
            return '\033[0;32m {0} \033[0;0m'.format(s)
        elif color == 'red' :
            return '\033[1;31m {0} \033[0;0m'.format(s)
        elif color == '?' :
            return '\033[1;21m {0} \033[0;0m'.format(s)
        else :
            raise SystemExit('unknown color!')
    ```

* dirpath of file

    ```python 
    os.path.dirname(os.path.realpath(__file__))
    ```

* execute cmd

    ```python
    os.system(cmd.format(ss))
    ```