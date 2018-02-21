# The baNaNa Git project

This repository serves as a demo project for the baNaNa hands-on session
for the SIAM Student Chapter Delft given at TU Delft on 22-02-2018.

Github repository https://github.com/mmoelle1/banana-git.git

# Tutorial 1: Setup your local git configuration

To work efficiently with git at the command line it is quite handy to
add the following configuration to your global `~/.gitconfig` file

```
[alias]
  br = branch
  ci = commit
  co = checkout
  st = status
  log1 = log --oneline
  log2 = log --name-status
  log3 = log --name-status --pretty=fuller
  log4 = log --stat
  log5 = log -p --full-diff
  logsincebranchbase = log master...@{0}
  squash-all = "!f(){ git reset $(git commit-tree HEAD^{tree} -m \"${1:-Initial commit}\");};f"
[color]
  branch = auto
  diff = auto
  interactive = auto
  status = auto
[user]
  name = Matthias Moeller
  email = m.moller@tudelft.nl
[core]
  excludesfile = ~/.gitignore_global
```

Moreover, it is a good idea to define a global list of file extensions
that should be ignored by git in the global file `~/.gitignore_global`

```
*.acn
*.acr
*.alg
*.aux
*.bbl
*.bcf
*.blg
*.dvi
*.glg
*.glo
*.gls
*.idx
*.ilg
*.ind
*.ist
*.lof
*.log
*.lot
*.maf
*.mod
*.mtc
*.mtc1
*.nav
*.o
*.out
*.snm
*.swp
*.synctex.gz
*.toc
*.vrb
*~
.DS_Store
```

# Tutorial 2: Getting started wit Github

To reproduce the steps shown during the hands-on sessions follow these steps:

1.  Create a free account at https://github.com

2.  Clone the project https://github.com/mmoelle1/banana-git.git to
    your local disk by running in the terminal
    ```
    git clone https://github.com/mmoelle1/banana-git.git
    ```

