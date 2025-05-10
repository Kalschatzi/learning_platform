+++
title = "Introduction to bash"
type = ""
weight = 1
+++

## What is bash? 

Bash is a type of shell. The name is short for "**B**ourne **A**gain **Sh**ell"

What is shell?

Shell is a program that allows you to run commands that instruct the operating system to perform actions.
You can access the shell from a console or the terminal on your machine.
Bash was designed initially for interacting with Unix based systems so it follows the Unix design philosophy.

There are other types of shells that you will see in practice and each shell has slightly different features. 
That is not important. Once you understand the bash design philosophy and how it works, it is exponentially easier to
explore different shells.
What is important, is to be aware that there are other shells, especially when they are used in solution examples online. 

Here are some of the other shells in Unix:

- The Bourne Shell (sh)
- The C shell (csh)
- The Korn Shell (ksh)
- The Tcsh Shell
- The Z Shell (zsh)

## How to run bash on your machine

### On a Unix-like operating system (Linux or macOS)

Open a terminal window. There are a few terminal applications that you can use: Terminal, Xterm, iTerm. 
This depends on you have installed on your machine but every Unix-like system has a terminal application installed by default.

In the terminal window, the default shell is `bash` but if you have another shell set as default, you can just type 
`bash` and you should see a prompt like this: `bash-5.2$`.

### On Windows 

On a Windows operating system there are two popular ways to use bash:

1. [Git Bash](https://www.atlassian.com/git/tutorials/git-bash)
2. [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install)

## Basic bash usage 

Bash has its own command programming language, and later on in this module you will learn some of the syntax, but for now
let's focus on run a few commands in `bash` and see them in action.

It was mentioned above that there are different shells available that we could use.

To display the default shell in your system:

`echo $SHELL`.

To display the current shell in your terminal:

`echo $0`

So what happened above? We used the `echo` command, available in the `bash` language to display something.
`$` is a special character in bash, it indicates that we are using a variable. 
The first command outputs the value of `$SHELL` which is an [environment variable](https://en.wikipedia.org/wiki/Environment_variable).
You will encounter those later on in the module as well.
The second command outputs the value of `$0` which a special variable in bash which shows the name of the currently running process.

If you want to echo some plain text, is very easy:

```shell
bash-5.2$ echo "Hello World!"
Hello World!
bash-5.2$
```

What else can we do in shell? A lot! But let's do a few simple commands:

`ls` -> displays all your files and directories in your current directory

`cd /<some-new-dir>` -> changes your current directory to a new one

`pwd` -> shows the path to your current directory

For more interesting commands and how commands are actually composed, have a look at the next section, [Bash Commands](2-bash-commands.md).

