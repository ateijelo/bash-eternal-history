# Bash Eternal History

### Installation

Clone or download somewhere and source `bash-eternal-history.sh` on your `~/.bashrc`.
This is a possible way to do it:

```bash
$ git clone git@github.com:ateijelo/bash-eternal-history.git
$ cd bash-eternal-history
$ echo "source \"$PWD/bash-eternal-history.sh\"" >> ~/.bashrc
```

### Usage

After installation, you just need to start a new shell and every command will be
logged twice to `~/.bash_eternal_history`, one time before running the command
and a second time after the command is done.

This is useful to investigate how long a command took to complete. If you'd rather
have it logged once, check the variables at the beginning of the code.
