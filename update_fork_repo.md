To update fork repo from original repo:


* `git clone <forked-repo>`

* `git remote add upstream <original-repo>`

Note: In case you don't know what the original repo is, you can git to origin forked-repo
folder and type `git remote -v`

* `git pull upstream master`

Note: if you have altered it, then you need to rebase it, `git rebase upstream/master`

* `git push origin master`

Note: if you have rebased it, then you have to force push, `git push -f origin master`


If you are interested in bringing some branches from original repo to forked repo as well(assuming you have done the above syncing with master etc.)

* `git fetch upstream`

* `git checkout <original-repo branch to transfer>`

* `git push origin <original-repo branch to transfer>`

repeat step 2 and 3 for all the branches you want
