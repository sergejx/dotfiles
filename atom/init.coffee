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

uiThemeLight = 'one-light-ui'
uiThemeDark = 'one-dark-ui'

syntaxThemeLight = 'one-light-syntax'
syntaxThemeDark = 'one-dark-vivid-syntax'

atom.commands.add 'atom-text-editor', 'me:switch-color-theme', ->
    currentThemes      = atom.config.get('core.themes')
    currentUITheme     = currentThemes[0]
    currentSyntaxTheme = currentThemes[1]

    if currentThemes[0] == uiThemeLight
        currentThemes[0] = uiThemeDark
        currentThemes[1] = syntaxThemeDark
        atom.commands.dispatch this, 'gtk-dark-theme:enable'
    else
        currentThemes[0] = uiThemeLight
        currentThemes[1] = syntaxThemeLight
        atom.commands.dispatch this, 'gtk-dark-theme:disable'

    atom.config.set('core.themes', currentThemes)
