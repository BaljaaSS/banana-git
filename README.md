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

# Tutorial 5: Creating formatted patches

Git allows you to create formatted patches from your local commits
that can be shared with colleagues, e.g., via email. This makes it
possible to develop a feature incrementally with different programmers
and only commit the final version to the Git repository.

1.  Let us first create a new file `demo2.m`

    ```
    echo "function [x,y] = demo2(n) % DEMO x = linspace(0,1,n); y = sin(2*pi*x);" >> demo2.m
    ```

    add it to the local repository

    ```
    git add demo2.m
    ```

    and commit the changes

    ```
    git ci -m "Added file demo2.m"
    ```

2.  The git log shows the following

    ```
    git log

    commit 1e4b5346cba92df983bcca375fb370677dd26600 (HEAD -> testing)
    Author: Matthias Moeller <m.moller@tudelft.nl>
    Date:   Thu Feb 22 15:58:25 2018 +0100

        Added file demo2.m

    commit 221a2c2bc79ec21f89c1058b25c53f54b666b86c (origin/Testing)
    Author: Matthias Moeller <m.moller@tudelft.nl>
    Date:   Thu Feb 22 15:48:38 2018 +0100

        Updated README.md

    commit 40ecd57a66b1340e0a8de95e9b4c3b44e056925b
    Author: Matthias Moeller <m.moller@tudelft.nl>
    Date:   Thu Feb 22 15:39:46 2018 +0100

        Added new file run.m

    commit 3883e04efa1da649d8303a61294208e197ec94c0 (origin/master, origin/HEAD, master)
    Author: Matthias Moeller <m.moller@tudelft.nl>
    Date:   Wed Feb 21 23:03:18 2018 +0100

        Updated README.md

    commit 9b50fcd6527b96a17f406b7a43c77758d98bf7ad
    Author: Matthias Moeller <m.moller@tudelft.nl>
    Date:   Wed Feb 21 22:57:38 2018 +0100

        Updated README.md

    ...
    ```

3.  Instead of pushing the local changes to the global repository, we
    let git generate a formatted patch file

    ```
    git format-patch 221a2c2bc79ec21f89c1058b25c53f54b666b86c
    ```

    which is

    ```
    0001-Added-file-demo2.m.patch
    ```

    and send this file, e.g., via email to our colleague.

4.  Our colleague can `apply` this patch to his local checkout

    ```
    git am 0001-Added-file-demo2.m.patch
    ```

    and now has the same state is we have.

5.  Assume that multiple patches have been sent back and force unti a
    stable version of the code has been reached.

    ```
    git log

    commit c439af4ccea143a25ef5cd51a1b60a71e7abc77f (HEAD -> testing)
    Author: Matthias Moeller <m.moller@tudelft.nl>
    Date:   Thu Feb 22 16:04:02 2018 +0100

        Updated demo2.m

    commit 1e4b5346cba92df983bcca375fb370677dd26600
    Author: Matthias Moeller <m.moller@tudelft.nl>
    Date:   Thu Feb 22 15:58:25 2018 +0100

        Added file demo2.m
    ```

6.  Instead of committing all local development steps to the global
    repository we can combine them into a single commit.

    ```
    git rebase -i HEAD~5
    ```

    This shows you the last five commits starting at the latest one (HEAD)

    ```
    pick 3883e04 Updated README.md
    pick 40ecd57 Added new file run.m
    pick 221a2c2 Updated README.md
    pick 1e4b534 Added file demo2.m
    pick c439af4 Updated demo2.m
    
    # Rebase 9b50fcd..c439af4 onto 9b50fcd (5 commands)
    #
    # Commands:
    # p, pick = usecommit
    # r, reword = use commit, but edit the commit message
    # e, edit = use commit, but stop for amending
    # s, squash = use commit, but meld into previous commit
    # f, fixup = like "squash", but discard this commit's log message
    # x, exec = run command (the rest of the line) using shell
    # d, drop = remove commit
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    #
    # However, if you remove everything, the rebase will be aborted.
    #
    ```
7.  We simply want to combine the last to commits so we change the last two lines to

    ```
    e 1e4b534 Added file demo2.m
    s c439af4 Updated demo2.m
    ```

    This will meld the last commit into the previous one and,
    moreover, allow us to edit the commit message.

8.  When exiting the editor git offers the following possibilities

    ```
    Stopped at 1e4b534...  Added file demo2.m
    You can amend the commit now, with

      git commit --amend 

    Once you are satisfied with your changes, run

      git rebase --continue
    ```

9.  We decide that we are satisfied with the changes and run

    ```
    git rebase --continue
    ```

10. Finally, we adjust the commit message and push the final commit to
    the global repository

    ```
    git push
    ```

# Tutorial 6: Merging entire branches

Notice that we have done all previous changes in the `testing`
branch. Instead of creating pull requests we can also `merge` the
entire `testing` branch with the `master` branch.

1.  Let is first switch back to the `master` branch

    ```
    git co master
    ```

    and update it to the latest version from the global repository

    ```
    git pull
    ```

2.  Next, we merge the `testing` branch with the `master` branch

    ```
    git merge testing
    ```

3.  Finally, we push the local changes in the `master` branch to the global repository

    ```
    git push
    ```
