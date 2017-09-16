setWindowWidth = (width) -> atom.setSize(width, atom.getSize().height)

atom.commands.add 'atom-workspace', 'window-size:narrow', -> setWindowWidth(770)
atom.commands.add 'atom-workspace', 'window-size:medium', -> setWindowWidth(1070)
atom.commands.add 'atom-workspace', 'window-size:wide', -> setWindowWidth(1440)


atom.commands.add 'atom-text-editor', 'insert-date', ->
    return unless editor = atom.workspace.getActiveTextEditor()
    {BufferedProcess} = require 'atom'
    process = new BufferedProcess {
        command: 'date'
        args: ['+%A %-d. %B %Y']
        stdout: (output) => editor.insertText(output)
    }
