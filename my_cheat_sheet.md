## this is a cheat sheet for me

### Config new dev environment

  1. add ssh-key to gitlab/github [check](https://www.zhihu.com/question/21402411)
  2. vmware would cause en0 down, [check](http://forum.ubuntu.org.cn/viewtopic.php?t=478401)
	3. 开机默认命令行/图形 [check](https://wiki.zthxxx.me/wiki/%E6%8A%80%E6%9C%AF%E5%BC%80%E5%8F%91/Linux/Ubuntu/Ubuntu-16-%E5%BC%80%E6%9C%BA%E9%BB%98%E8%AE%A4%E5%91%BD%E4%BB%A4%E8%A1%8C%E7%95%8C%E9%9D%A2/)

### Ubuntu

    open a terminal and <ctrl+shift+t> would open a terminal in this window
    <ctrl+alt+t> would open a terminal on another window
    on desktop press <super> would show you keyboard shortcut

### Vim !!!!

* vim

	```
	[:Gstatus]    //fugitive plugin
	[:Gdiff]      //fugitive
	[:Gcommit]    //fugitive diff all files between two commit
	[:Gdiff ~3]   //fugitive diff between current file and current file 3 commit ago
	[:YcmGenerateConfig]    // to generate YCM config due to the CMakeLists.txt under current path, would error is config already exist
	[:Gmerge ${branch}]
	[:%s/${replacedString}/${newString}/g]  // replace all line
	[Ctrl+'o']
	[Ctrl+'i']
	[:r!'command']
	[:r!date]       //read the return of the command and insert them
	[:E]
	[:e]
	[:Hexplorer :Vexplorer :Texplorer]
	(under insert modle, use [ctrl+N][ctrl+P] to complete)
	(under shell, under source root, use "ctags -R" to initial ctag)
	(for YCM to use, "ctags -R ./ --fields=+l")
	[Ctrl+']']      //use ctag to jump into definition
	[Ctrl+'t']      //jump back
	[g+']']         //when there are mutiple tags
	(in my vim, use [j+'Enter'] to expand snipper and [Ctrl+'j'] to jump into next postion)
	(in my vim, with the plugin CtrlP we can use [Ctrl+'p'] to find file or type new filename and [Ctrl+'y'] to create a new file)
	(in my vim, with YouCompleteMe, we can use ['leader'gg] to find definition or declaration)
	[za][zM][zR]    //fold and unfold, fold all, unfold all
	[g~] //switch alphabeta case
	["<alphabeta>y]["<alphabeta>p] //use specified register
	["+y]["+p] // use system paste register
	```

### Git

* basic
		
	```
	$git configgit config
	$git status
	$git checkout -b ${branch}
	$git remote add origin ${remote_repo}
	$git remote -v
	$git remote // track repositories
	$git branch // set local branch to track remote branch
	$git branch -vv // show which branch tracked
	$git checkout ${branch} // switch branches
	$git checkout -b ${branch} // create new branches and switch to it
	$git merge ${other branch} // merge commit of other branch to this branch
	$git commit -a -m '${your commit}' // add all and add commit descriptor
	$gitk --all   // a gui to visualize git commit history
	$git log --oneline --graph --color --all --decorate   // cli to visualize git commit
	$git submodule add https://github.com/nodejs/http-parser ./qwer_main/third_party/http-parser/
	$git pull --rebase
	```

* copy sub directory of git repo [ref](https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository)

* checkout remote branches

	```
	git branch -r
	git checkout -b LocalName origin/remoteName
	```

* u work on branch 'a', someone push master, u wanna merge the commit. [ref](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) [ref](https://stackoverflow.com/questions/3876977/update-git-branches-from-master)

	```
	$git checkout a
	$git merge master
	# or you can
	$git rebase origin/master
	```

* fix conflict

	```
	$git stash
	$git pull
	$git stash pop
	```

* search branch from commit

	```
	$git branch --contains <commitid>
	```
* two commit into one [ref](https://stackoverflow.com/questions/2563632/how-can-i-merge-two-commits-into-one)
	```
	$git reset --soft "HEAD^"
	$git reset --soft "commitId"
	$git commit --amend
	```
	
* git graph in terminal 
	
	```
	$git log --graph --abbrev-commit --decorate --date=relative --all
	```

* gitignore
	
	```
	//in .gitignore file on top level
	bin/
	// ignore any subdirectory only two asterisk, the two at the end of line is highlight related and no meaning
	**/bin/Debug/**
	**/bin/Release/**
	```

* code backward
	
	```
	$git reset --hard HEAD~2
	$git reflog
	$git reset --hard ${number}
	$git reset --hard HEAD@{1}
	```

* git diff [ref](https://www.jianshu.com/p/80542dc3164e)
		
	```
	$git diff --cached <file>
	```

### Ansible

	# check it, not run 
	ansible-playbook -i inventoryPath --check test.yaml 
	# variable - 1 - facts: return from remote, use it without declare
	# variable - 2 - ansible-playbook  test.yml  –extra-vars "host=www user=test"
	# variable - 3 - hosts, example :
	[websrvs]
	192.168.0.101
	192.168.0.102
	[websrvs:vars]
	host=mail
	# {{ }} 调用变量, example ：
	- hosts: 192.168.1.114
	remote_user: root
	tasks:
	- name: install {{ package }}
	  yum: name={{ package }} state=present

### Makefile

* cflags:

	* CFLAGS =-g -DDBG

		等价于在头文件里 #define DBG
		
### Bash

* netstat

	* netstat --listen # show ip & port listened
	
* ifconfig 

	* $ sudo ifconfig eth0 down
	* $ sudo ifconfig eth0 up
	* $ ifconfig eth0 mtu 1000 // set mtu

* bask-develop-tool [ref](http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/ldd.html)

* history 
	
		* [C-r] to search history reversely

* lsof 

	```
	$lsof -i[i]
	$lsof -i:80    # check list of process whose Internet address matches the address specified in i
	```

* vagrind 

		* valgrind --tool=callgrind ./path/to/executable [how to profile](https://softwarerecs.stackexchange.com/questions/9992/linux-c-profiler)
		* valgrind --track-fds=yes --leak-check=full --undef-value-errors=yes ./run_loops.sh

* echo

	* escape ascii , ascii control [ref](https://stackoverflow.com/questions/2616906/how-do-i-output-coloured-text-to-a-linux-terminal)

			echo -e "\033[96m back up! \033[0m"

* iptable

	control tcp through kernel, for example, limit tcp-pkg size.

* ssh-copy-id

```
ssh-copy-id -i ~/.ssh/id_rsa.pub remote-host
```

* dmesg 查看内核oom 的kill

* sock

		$sock -v -u -i 10.0.0.3 discard

* ln
    
		ln -s /original /softlink   // make softlink

* ps

		ps aux | grep "nodejs"  // 搜索关于nodejs的进程

* nc
	```
	$nc -l 1567
	$nc 127.0.0.1 1567
	```
* awk and sed [awk----ref](http://coolshell.cn/articles/9070.html/comment-page-1#comments) [sed---ref](http://coolshell.cn/articles/9104.html)
	```
	$awk '{print $1, $4}' ${filename} // $0 means whole line
	$awk '{printf "%-8s %-8s %-8s %-18s %-22s %-15s\n",$1,$2,$3,$4,$5,$6}' ${filename} // format
	$awk '$3==0 && $6=="LISTEN" ' ${filename} //filter
	$ sed "s/my/Hao Chen's/g" ${filename} // change 
	$ sed "3,6s/my/your/g" ${filename} // manage lines range 3 to 6
	```

* Regular Expression, using Regex, not globular expressions aka wildcard, because reg is more standard
As regex is used almost every where, we would **introduce few simple example, after syntax**

	```
	^	The pattern has to appear at the beginning of a string.	^cat matches any string that begins with cat
	$	The pattern has to appear at the end of a string.	cat$ matches any string that ends with cat
	.	Matches any character.	cat. matches catT and cat2 but not catty
	[]	Bracket expression. Matches one of any characters enclosed.	gr[ae]y matches gray or grey
	[^]	Negates a bracket expression. Matches one of any characters EXCEPT those enclosed.	1[^02] matches 13 but not 10 or 12
	[-]	Range. Matches any characters within the range.	[1-9] matches any single digit EXCEPT 0
	?	Preceeding item must match one or zero times.	colou?r matches color or colour but not colouur
	+	Preceeding item must match one or more times.	be+ matches be or bee but not b
	*	Preceeding item must match zero or more times.	be* matches b or be or beeeeeeeeee
	()	Parentheses. Creates a substring or item that metacharacters can be applied to	a(bee)?t matches at or abeet but not abet
	{n}	Bound. Specifies exact number of times for the preceeding item to match.	[0-9]{3} matches any three digits
	{n,}	Bound. Specifies minimum number of times for the preceeding item to match.	[0-9]{3,} matches any three or more digits
	{n,m}	Bound. Specifies minimum and maximum number of times for the preceeding item to match.	[0-9]{3,5} matches any three, four, or five digits

	POSIX Character Classes
	[:alnum:]	alphanumeric character	[[:alnum:]]{3} matches any three letters or numbers, like 7Ds
	[:alpha:]	alphabetic character, any case	[[:alpha:]]{5} matches five alphabetic characters, any case, like aBcDe
	[:blank:]	space and tab	[[:blank:]]{3,5} matches any three, four, or five spaces and tabs
	[:digit:]	digits	[[:digit:]]{3,5} matches any three, four, or five digits, like 3, 05, 489
	[:lower:]	lowercase alphabetics	[[:lower:]] matches a but not A
	[:punct:]	punctuation characters	[[:punct:]] matches ! or . or , but not a or 3
	[:space:]	all whitespace characters, including newline and carriage return	[[:space:]] matches any space, tab, newline, or carriage return
	[:upper:]	uppercase alphabetics	[[:upper:]] matches A but not a
	```

* Example [ref](https://code.tutsplus.com/tutorials/8-regular-expressions-you-should-know--net-6149)
	
	```
	/^[a-z0-9_-]{3,16}$/
	match username : my-us3r_n4m3
	/^[a-z0-9_-]{6,18}$/
	match password : myp4ssw0rd
	/^#?([a-f0-9]{6}|[a-f0-9]{3})$/
	match hex value : #a3c113
	/^[a-z0-9-]+$/
	match a slug : my-title-here
	/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
	match a email : john@doe.com
	/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
	match a url : http://net.tutsplus.com/about
	/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
	match a IP : 73.60.124.136
	/^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$/
	match a HTML tag : Nettuts">http://net.tutsplus.com/">Nettuts+
	```

* grep xargs find printenv
	
	```
	$printenv | grep "things"
	$find /${PATH} -type f | xargs grep "${name}"
	$find /${PATH} -name "${name}" | xargs grep"${name}"  >/tmp/log.txt 2>&1      
	$find / -print0 | grep -FzZ '${include file}' // or simply locate ${include file}
	// xargs has the similar function with -exec
	$find . "(" -name "*.cc" -or -name "*.c" -or -name "*.cpp" -or -name "*.h" -or -name "*.hpp" ")" -print | xargs wc -l     // 一行打印项目行数
	$find . -type f -name ".*.swp" -exec rm -f {} \;      // remove swp file in oneline
	```

* tar

	```
	$cd [destination path]
	$tar -xvf [source.tar]
	$tar -xzvf [source.tar.gz]
	$tar -xjvf [source.tar.bz2]
	```

* apt
	```
	$sudo apt-cache search
	$sudo apt-get -f install        // -f = --fix-missing
	```
* locate, whereis, which
	```
	$whereis boost
	$which man
	$locate boost
	```
* kill, fg, bg, &
	```
	$kill ${jobNumber}
	$bg ${jobNumber}
	$fg ${jobNumber}
	$./output &             // will put the command to bankground running
	```
* detect file exist

	```
	#!/bin/bash
	directory="./BashScripting"

	# bash check if directory exists
	if [ -d $directory ]; then
		echo "Directory exists"
	else
		echo "Directory does not exists"
	fi
	```

* date

	```
	#!/bin/bash
	DATE=`date+%Y-%m-%d`               
	echo ${DATE}
	```
* yes or no
	```
		while true; do
			read -p "Do you wish to install this program?" yn
			  case $yn in
				[Yy]* ) make install; break;;
				[Nn]* ) exit;;
				* ) echo "Please answer yes or no.";;
			  esac
		done
	```
### GDB

* command

	```
        gdb <program>
        gdb <program> [core]
        gdb <program> <PID>
        // after running gdb --->>>

        [Ctrl+'x'+'1'] to open visual 'TUI'
        [Ctrl+'x'+'2'] open assembly
        x <variantName> //print address and hexdecimal
        next        // absolute one line
        step        // can be one machine instruction
        disable     // disable breakpoints
        print <variant> //print
        print <asterisk><pointer or reference>  //print reference and pointer
        backtrace       // stack looking
        define          // define your custom command
        command         // use with breakpoint
        shell clear // !! TUI mode won't mess up again
        // you can do this :
                // set $i=0
                // p a[$i++]
	```
	
* debug practice [一个sizeof引发的血案:如何使用gdb调查coredump](https://zhuanlan.zhihu.com/p/26815897)

### Math!!!

* GRE math cheat sheet [link](http://magoosh.com/gre/2011/gre-math-formulas-cheat-sheet/)

* factorial function (symbol !)

    >4! = 4 x 3 x 2 x 1 it's generally agreed that 0! = 1, which helps simplify a lot of equations

* permutation

    >where n is the number of things to choose from, and we choose r of them(No repetition, order matters)

![](https://photos.app.goo.gl/t1hTMGMuf84uJKX39)  

* combination

    >where n is the number of things to choose from, and we choose r of them(No repetition, order doesn't matter)

![](https://photos.app.goo.gl/D2kybLV7biCgkAbY7)     

* Law of Large Numbers

* matrix 求快速幂
    
