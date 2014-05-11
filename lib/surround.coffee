module.exports =
  activate: ->
    atom.workspaceView.command "surround:toggle",               => @toggle()
    atom.workspaceView.command "surround:wrap-square-brackets", => @wrap("[", "]")
    atom.workspaceView.command "surround:wrap-curly-braces",    => @wrap("{", "}")
    atom.workspaceView.command "surround:wrap-parens",          => @wrap("(", ")")
    atom.workspaceView.command "surround:wrap-single-quotes",   => @wrap("'", "'")
    atom.workspaceView.command "surround:wrap-double-quotes",   => @wrap('"', '"')
    atom.workspaceView.command "surround:wrap-angle-brackets",  => @wrap("<", ">")
    atom.workspaceView.command "surround:unwrap",               => @unwrap

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

  unwrap: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    selection.insertText("#{selection.getText()}")
    @toggle()
