module.exports =
  activate: ->
    atom.workspaceView.command "surround:toggle",               => @toggle()
    atom.workspaceView.command "surround:wrap-square-brackets", => @wrap("[", "]")
    atom.workspaceView.command "surround:wrap-curly-braces",    => @wrap("{", "}")

  toggle: ->
    atom.workspaceView.toggleClass 'surround'
    atom.workspaceView.eachEditorView (editorView) =>
      editorView.toggleClass('surround-mode')

  wrap: (firstChar, lastChar) ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    selection.insertText("#{firstChar}#{selection.getText()}#{lastChar}")
    @toggle()
