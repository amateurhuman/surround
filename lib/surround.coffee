module.exports =
  activate: ->
    atom.workspaceView.command "surround:wrap", => @wrap()

  wrap: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    selection.insertText("[#{selection.getText()}]")
