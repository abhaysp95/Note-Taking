# table

## Basics

<table>
  <tr>
    <th>command</th>
    <th>statement</th>
  </tr>
  <tr>
    <td>git init</td>
    <td>initialize the repository</td>
  <tr>
    <td>git add myfile.png</td>
    <td>stage the file (supports multiple arguments and globbing)</td>
  </tr>
  <tr>
    <td>git checkout HEAD~&lt;no.&gt;</td>
    <td>detach HEAD (HEAD reference)</td>
  </tr>
  <tr>
    <td>git checkout -</td>
    <td>move head back to previous position</td>
  </tr>
  <tr>
    <td>git checkout &lt;commit|HEAD~&lt;no.&gt;&gt; &lt;file&gt;</td>
    <td>discard change of a file</td>
  </tr>
  <tr>
    <td>git checkout -- &lt;file&gt;</td>
    <td>discard change of a file (prev position)</td>
  </tr>
</table>

## Undoing Changes

<table>
  <tr>
    <td>git restore &lt;file&gt;</td>
    <td>unmodify file/restore back to HEAD (non-undoable uncommited changes)</td>
  </tr>
  <tr>
    <td>git restore --source &lt;commit|HEAD~&lt;no.&gt;&gt; &lt;file&gt;</td>
    <td>unmodify file/restore back to specified destination for given file (non-undoable uncommited changes)</td>
  </tr>
  <tr>
    <td>git restore --staged &lt;file&gt;</td>
    <td>unstage file/revert back staged changes (not commited yet, changes will not be deleted)</td>
  </tr>
  <tr>
    <td>git reset &lt;commit-hash|HEAD~&lt;no.&gt;&gt;</td>
    <td>get rid of all the commit upto provided hash (work done is still left in working directory)</td>
  </tr>
  <tr>
    <td>git reset --hard &lt;commit-hash|HEAD~&lt;no.&gt;&gt;</td>
    <td>get reid of all the commit upto provided hash (changes are also removed and working directory is same to provided hash)</td>
  </tr>
  <tr>
    <td>git revert &lt;commit-hash|HEAD~&lt;no.&gt;&gt;</td>
    <td>undo the change from given commit by creating a new commit whose parent is the commit hash you want to revert from</td>
  </tr>
  <tr>
    <td>git revert --continue</td>
    <td>continue the revert in case of merge conflict (after fix)</td>
  </tr>
  <tr>
    <td>git revert --skip</td>
    <td>skip the current commit and continue for revert</td>
  </tr>
  <tr>
    <td>git revert --abort</td>
    <td>abort the revert process</td>
  </tr>
</table>

## git lfs commands

<table>
  <tr>
    <td>git lfs install</td>
    <td>setup the git lfs (one time process)</td>
  </tr>
  <tr>
    <td>git lfs track **/*.png</td>
    <td>setup the tracking of large files (creates .gitattributes file)</td>
  </tr>
  <tr>
    <td>git lfs uninstall</td>
    <td>remote the git lfs setup</td>
  </tr>
  <tr>
    <td>git lfs untrack **/*.png</td>
    <td>untrackes the mentioned files as arguments</td>
  </tr>
