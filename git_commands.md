# table

## Undoing Changes

<table>
  <tr>
    <th>command</th>
    <th>statement</th>
  </tr>
  <tr>
    <td>git checkout &lt;commit-hash&gt;</td>
    <td>detach head</td>
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
</table>
