module.exports =
  activate: ->
    atom.workspaceView.command "surround:toggle", => @toggle()
    atom.workspaceView.command "surround:deactivate", => @deactivate()
    atom.workspaceView.command "surround:wrap-square-brackets", => @wrap("[", "]")

  toggle: ->
    atom.workspaceView.toggleClass 'surround-mode'

  deactivate: ->
    atom.workspaceView.removeClass 'surround-mode'

  wrap: (firstChar, lastChar) ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    selection.insertText("#{firstChar}#{selection.getText()}#{lastChar}")
    @deactivate()
