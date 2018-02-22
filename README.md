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
  name = Your Name
  email = You@Mail.Address
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


# Tutorial 3: Merging and resolving conflicts

Git helps you to merge your work with the work of your colleagues
working on the same project. Whenever Git is able to merge all changes
automatically it will do so. However, if two (or more) people change
the same file at the same location so that it is not clear which
change should override the other one then Git needs your manual input.

1.  In the web frontend of Github we modify the last line of the file
    `demo.m` to

    ```
    plot(y,x)
    ```
    
    and commit the changes to the repository by clicking the `Commit`
    button.

2.  In the local checkout of the repository we modify the last line of
    the file `demo.m` to

    ```
    plot(y,x)
    ```

    and commit the changes to the repository by running in the terminal

    ```
    git ci -m "Changing demo.m"
    ```

    without having updated the local checkout of the repository before.

3.  This results in a merge conflict that cannot be solved automatically

    ```
    Auto-merging demo.m
    CONFLICT (content): Merge conflict in demo.m
    Automatic merge failed; fix conflicts and then commit the result.
    ```

    If we look into the file `demo.m` we find

    ```
    <<<<<<< HEAD
    plot(x,x)
    =======
    plot(y,x)
    >>>>>>> fa5516bc91ddea24be32b3b238b7a9734e60698f
    ```

4.  Let us decide to keep the version `plot(y,x)` and commit the
    changes by running in the terminal
    
    ```
    git ci
    ```

# Tutorial 4: Branching and pull requests

Branches allow you to develop several features independently from each
other without "polluting" the master branch.

1.  In the web frontend of Github we create a new branch `testing`.

2.  Next we update our local checkout by running in the terminal

    ```
    git pull
    ```

3.  Our local checkoput now shows the different branches

    ```
    git br -a
    
    * master
    remotes/origin/HEAD -> origin/master
    remotes/origin/testing
    remotes/origin/master
    ```

4.  We switch to the `testing` branch by running in the terminal

    ```
    git co -b testing origin/testing
    ```
    
5.  This will create the local branch `testing` from the remote branch
    `origin/testing`. Let us create a new file and commit it to the
    `testing` branch.

    ```
    echo "demo(10)" > run.m
    git add run.m
    git ci -m "Added new file run.m"
    git push
    ```

6.  This file has been committed to the `testing` branch and is not
    available in the `master` branch (check this via the web
    frontend). To merge the commit into the master branch we create a
    so-called `pull request` via the web frontend.

7.  We can accept the pull request via the web frontend to physically
    merge the commit into the `master` branch. Verify that the file
    `run.m` is in the `master` branch.

8.  If you are the owner of the project you might want to prevent
    direct commits to the master branch at all. You can enable this
    feature in `Settings`->`Branches` by addint the `master` branch to
    the list of protected branches and activete the check boxes
    `Protect this branch` and `Require pull request reviews before
    merging`.

    