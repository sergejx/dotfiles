" Vim syntax file
" Filename: texy.vim
" Language: marked text for conversion by Texy
" Last change: 20061104
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLD:
"
" - There are some folding rules on the syntax also
" - To use fold just uncomment the line of foldmethod below
" - Or set the fold use directly on the t2t file, adding this last line:
"
"     % vim: foldmethod=syntax
"
" - There are two kinds of fold:
"
"   Automatic fold:
"     - The fold starts at any top level title
"     - The fold ends with 3 consecutive blank lines
"
"   User defined fold:
"     - The fold starts by the "% label {{{" comment
"     - The fold ends with the "% }}}" comment
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSTALL: (as user)
"
" - Copy this file to the ~/.vim/syntax/ dir (create it if necessary)
"
" - Put in your .vimrc the following line:
"   au BufNewFile,BufRead *.texy set ft=texy
"
" If you use other extension for txtexyags files, change the '*.texy'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSTALL: (as superuser)
"
" If you have access to the system configuration, edit the
" /usr/share/vim/vim*/filetype.vim file, adding the following
" lines after the 'Z-Shell script' entry (near the end):
"
"   " texy file
"   au BufNewFile,BufRead *.texy                 setf texy
"
" And copy this file (texy.vim) to the Vim syntax dir:
"
"   /usr/share/vim/vim*/syntax/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"FOLD: just uncomment the following line if you like to use Vim fold
"set foldmethod=syntax

"===================== HTML ============================

if !exists("main_syntax")
  if version < 600
    syntax clear
"  elseif exists("b:current_syntax")
"    finish
  endif
  let main_syntax = 'html'
endif

if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif


syn case ignore

if main_syntax == "html"
  syn spell toplevel
endif

" mark illegal characters
syn match htmlError "[<>&]"


" tags
syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn match   htmlValue    contained "=[\t ]*[^'" \t>][^ \t>]*"hs=s+1   contains=javaScriptExpression,@htmlPreproc
syn region  htmlEndTag		   start=+</+	   end=+>+ contains=htmlTagN,htmlTagError
syn region  htmlTag		   start=+<[^/]+   end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn match   htmlTagN     contained +<\s*[-a-zA-Z0-9]\++hs=s+1 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagN     contained +</\s*[-a-zA-Z0-9]\++hs=s+2 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagError contained "[^>]<"ms=s+1


" tag names
syn keyword htmlTagName contained address applet area a base basefont
syn keyword htmlTagName contained big blockquote br caption center
syn keyword htmlTagName contained cite code dd dfn dir div dl dt font
syn keyword htmlTagName contained form hr html img
syn keyword htmlTagName contained input isindex kbd li link map menu
syn keyword htmlTagName contained meta ol option param pre p samp span
syn keyword htmlTagName contained select small strike sub sup
syn keyword htmlTagName contained table td textarea th tr tt ul var xmp
syn match htmlTagName contained "\<\(b\|i\|u\|h[1-6]\|em\|strong\|head\|body\|title\)\>"

" new html 4.0 tags
syn keyword htmlTagName contained abbr acronym bdo button col label
syn keyword htmlTagName contained colgroup del fieldset iframe ins legend
syn keyword htmlTagName contained object optgroup q s tbody tfoot thead

" legal arg names
syn keyword htmlArg contained action
syn keyword htmlArg contained align alink alt archive background bgcolor
syn keyword htmlArg contained border bordercolor cellpadding
syn keyword htmlArg contained cellspacing checked class clear code codebase color
syn keyword htmlArg contained cols colspan content coords enctype face
syn keyword htmlArg contained gutter height hspace id
syn keyword htmlArg contained link lowsrc marginheight
syn keyword htmlArg contained marginwidth maxlength method name prompt
syn keyword htmlArg contained rel rev rows rowspan scrolling selected shape
syn keyword htmlArg contained size src start target text type url
syn keyword htmlArg contained usemap ismap valign value vlink vspace width wrap
syn match   htmlArg contained "\<\(http-equiv\|href\|title\)="me=e-1

" Netscape extensions
syn keyword htmlTagName contained frame noframes frameset nobr blink
syn keyword htmlTagName contained layer ilayer nolayer spacer
syn keyword htmlArg     contained frameborder noresize pagex pagey above below
syn keyword htmlArg     contained left top visibility clip id noshade
syn match   htmlArg     contained "\<z-index\>"

" Microsoft extensions
syn keyword htmlTagName contained marquee

" html 4.0 arg names
syn match   htmlArg contained "\<\(accept-charset\|label\)\>"
syn keyword htmlArg contained abbr accept accesskey axis char charoff charset
syn keyword htmlArg contained cite classid codetype compact data datetime
syn keyword htmlArg contained declare defer dir disabled for frame
syn keyword htmlArg contained headers hreflang lang language longdesc
syn keyword htmlArg contained multiple nohref nowrap object profile readonly
syn keyword htmlArg contained rules scheme scope span standby style
syn keyword htmlArg contained summary tabindex valuetype version

" special characters
syn match htmlSpecialChar "&#\=[0-9A-Za-z]\{1,8};"

" Comments (the real ones or the old netscape ones)
if exists("html_wrong_comments")
  syn region htmlComment		start=+<!--+	end=+--\s*>+
else
  syn region htmlComment		start=+<!+	end=+>+   contains=htmlCommentPart,htmlCommentError
  syn match  htmlCommentError contained "[^><!]"
  syn region htmlCommentPart  contained start=+--+      end=+--\s*+  contains=@htmlPreProc
endif
syn region htmlComment			start=+<!DOCTYPE+ keepend end=+>+

" server-parsed commands
syn region htmlPreProc start=+<!--#+ end=+-->+ contains=htmlPreStmt,htmlPreError,htmlPreAttr
syn match htmlPreStmt contained "<!--#\(config\|echo\|exec\|fsize\|flastmod\|include\|printenv\|set\|if\|elif\|else\|endif\|geoguide\)\>"
syn match htmlPreError contained "<!--#\S*"ms=s+4
syn match htmlPreAttr contained "\w\+=[^"]\S\+" contains=htmlPreProcAttrError,htmlPreProcAttrName
syn region htmlPreAttr contained start=+\w\+="+ skip=+\\\\\|\\"+ end=+"+ contains=htmlPreProcAttrName keepend
syn match htmlPreProcAttrError contained "\w\+="he=e-1
syn match htmlPreProcAttrName contained "\(expr\|errmsg\|sizefmt\|timefmt\|var\|cgi\|cmd\|file\|virtual\|value\)="he=e-1

if !exists("html_no_rendering")
  " rendering
  syn cluster htmlTop contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,javaScript,@htmlPreproc

  syn region htmlBold start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
  syn region htmlBold start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
  syn region htmlBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic
  syn region htmlBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlBoldItalicUnderline
  syn region htmlBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlBoldItalicUnderline
  syn region htmlBoldUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
  syn region htmlBoldUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop
  syn region htmlBoldItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic

  syn region htmlUnderline start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlUnderlineBold,htmlUnderlineItalic
  syn region htmlUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlUnderlineBoldItalic
  syn region htmlUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlUnderlineBoldItalic
  syn region htmlUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlUnderlineItalicBold
  syn region htmlUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlUnderlineItalicBold
  syn region htmlUnderlineItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
  syn region htmlUnderlineItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop
  syn region htmlUnderlineBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
  syn region htmlUnderlineBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop

  syn region htmlItalic start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlItalicBold,htmlItalicUnderline
  syn region htmlItalic start="<em\>" end="</em>"me=e-5 contains=@htmlTop
  syn region htmlItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlItalicBoldUnderline
  syn region htmlItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlItalicBoldUnderline
  syn region htmlItalicBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop
  syn region htmlItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlItalicUnderlineBold
  syn region htmlItalicUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
  syn region htmlItalicUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop

  syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc
  syn region htmlH1 start="<h1\>" end="</h1>"me=e-5 contains=@htmlTop
  syn region htmlH2 start="<h2\>" end="</h2>"me=e-5 contains=@htmlTop
  syn region htmlH3 start="<h3\>" end="</h3>"me=e-5 contains=@htmlTop
  syn region htmlH4 start="<h4\>" end="</h4>"me=e-5 contains=@htmlTop
  syn region htmlH5 start="<h5\>" end="</h5>"me=e-5 contains=@htmlTop
  syn region htmlH6 start="<h6\>" end="</h6>"me=e-5 contains=@htmlTop
  syn region htmlHead start="<head\>" end="</head>"me=e-7 end="<body\>"me=e-5 end="<h[1-6]\>"me=e-3 contains=htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,htmlTitle,javaScript,cssStyle,@htmlPreproc
  syn region htmlTitle start="<title\>" end="</title>"me=e-8 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc
endif

syn keyword htmlTagName		contained noscript
syn keyword htmlSpecialTagName  contained script style


syn cluster htmlJavaScript      add=@htmlPreproc


if main_syntax == "html"
  " synchronizing (does not always work if a comment includes legal
  " html tags, but doing it right would mean to always start
  " at the first line, which is too slow)
  syn sync match htmlHighlight groupthere NONE "<[/a-zA-Z]"
"  syn sync match htmlHighlight groupthere javaScript "<script"
  syn sync match htmlHighlightSkip "^.*['\"].*$"
  syn sync minlines=10
endif

" The default highlighting.
if version >= 508 || !exists("did_html_syn_inits")
  if version < 508
    let did_html_syn_inits = 1
  endif
  HtmlHiLink htmlTag			Function
  HtmlHiLink htmlEndTag			Identifier
  HtmlHiLink htmlArg			Type
  HtmlHiLink htmlTagName		htmlStatement
  HtmlHiLink htmlSpecialTagName		Exception
  HtmlHiLink htmlValue			String
  HtmlHiLink htmlSpecialChar		Special

  if !exists("html_no_rendering")
    HtmlHiLink htmlH1			   Title
    HtmlHiLink htmlH2			   htmlH1
    HtmlHiLink htmlH3			   htmlH2
    HtmlHiLink htmlH4			   htmlH3
    HtmlHiLink htmlH5			   htmlH4
    HtmlHiLink htmlH6			   htmlH5
    HtmlHiLink htmlHead			   PreProc
    HtmlHiLink htmlTitle		   Title
    HtmlHiLink htmlBoldItalicUnderline	   htmlBoldUnderlineItalic
    HtmlHiLink htmlUnderlineBold	   htmlBoldUnderline
    HtmlHiLink htmlUnderlineItalicBold	   htmlBoldUnderlineItalic
    HtmlHiLink htmlUnderlineBoldItalic	   htmlBoldUnderlineItalic
    HtmlHiLink htmlItalicUnderline	   htmlUnderlineItalic
    HtmlHiLink htmlItalicBold		   htmlBoldItalic
    HtmlHiLink htmlItalicBoldUnderline	   htmlBoldUnderlineItalic
    HtmlHiLink htmlItalicUnderlineBold	   htmlBoldUnderlineItalic
    HtmlHiLink htmlLink			   Underlined
    if !exists("html_my_rendering")
      hi def htmlBold		     term=bold cterm=bold gui=bold
      hi def htmlBoldUnderline	     term=bold,underline cterm=bold,underline gui=bold,underline
      hi def htmlBoldItalic	     term=bold,italic cterm=bold,italic gui=bold,italic
      hi def htmlBoldUnderlineItalic term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
      hi def htmlUnderline	     term=underline cterm=underline gui=underline
      hi def htmlUnderlineItalic     term=italic,underline cterm=italic,underline gui=italic,underline
      hi def htmlItalic		     term=italic cterm=italic gui=italic
    endif
  endif

  HtmlHiLink htmlPreStmt	    PreProc
  HtmlHiLink htmlPreError	    Error
  HtmlHiLink htmlPreProc	    PreProc
  HtmlHiLink htmlPreAttr	    String
  HtmlHiLink htmlPreProcAttrName    PreProc
  HtmlHiLink htmlPreProcAttrError   Error
  HtmlHiLink htmlSpecial	    Special
  HtmlHiLink htmlSpecialChar	    Special
  HtmlHiLink htmlString		    String
  HtmlHiLink htmlStatement	    Statement
  HtmlHiLink htmlComment	    Comment
  HtmlHiLink htmlCommentPart	    Comment
  HtmlHiLink htmlValue		    String
  HtmlHiLink htmlCommentError	    htmlError
  HtmlHiLink htmlTagError	    htmlError
  HtmlHiLink htmlEvent		    javaScript
  HtmlHiLink htmlError		    Error

  HtmlHiLink javaScript		    Special
  HtmlHiLink javaScriptExpression   javaScript
  HtmlHiLink htmlCssStyleComment    Comment
  HtmlHiLink htmlCssDefinition	    Special
endif

delcommand HtmlHiLink

"===================== HTML END ============================


" init
" syn clear
syn sync minlines=500
syn case ignore

"TODO see if user already has foldmethod defined, if so, set foldmethod=syntax
"TODO2 learn vim language :/

syn cluster texyComponents  contains=texyNumber,texyPercent,texyMacro,texyImg,texyEmail,texyUrl,texyUrlMark,texyUrlMarkImg,texyUrlLocal
syn cluster texyBeautifiers contains=texyUnderline,texyItalic,texyItalicBold,texyBold,texyMonospace,texyRaw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"LIST:
syn match texyList    '^ *[-+:]\s*$'
syn match texyList    '^ *: '
syn match texyList    '^ *[+-] [^ ]'me=e-1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TITLE:
" syn match texyTitleRef  contained '\[[a-z0-9_-]*\]\s*$'
syn match texyTitleMark contained '^ *[#=]\+'
syn match texyTitleMark contained '[#=]\+\s*$'
" syn match texyTitleMark contained '[#=*+]\+\['me=e-1,he=e-1
" syn match texyTitle '^ *\(=\{1,5}\)[^=]\(\|.*[^=]\)\1\(\[[a-z0-9_-]*\]\)\=\s*$' contains=texyTitleMark,texyTitleRef
syn match texyTitle '^ *\([#=]\{2,7}\)[^#=]\(\|.*[^#=]\)\1\s*$' contains=texyTitleMark

" syn match texyNumTitleMark contained '^ *+\+'
" syn match texyNumTitleMark contained '+\+\s*$'
" syn match texyNumTitleMark contained '+\+\['me=e-1,he=e-1
" syn match texyNumTitle '^ *\(+\{1,5}\)[^+]\(\|.*[^+]\)\1\(\[[a-z0-9_-]*\]\)\=\s*$' contains=texyNumTitleMark,texyTitleRef
" syn match texyNumTitle '^ *\(+\{1,5}\)[^+]\(\|.*[^+]\)\1\(\[[a-z0-9_-]*\]\)\=\s*$' contains=texyNumTitleMark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"URL EMAIL:
"syn case match
syn match texyEmail '\<[A-Za-z0-9_.-]\+@\([A-Za-z0-9_-]\+\.\)\+[A-Za-z]\{2,4}\>\(?[A-Za-z0-9%&=+.,@*_-]\+\)\='
syn match texyUrl   '\<\(\(https\=\|ftp\|news\|telnet\|gopher\|wais\)://\([A-Za-z0-9._-]\+\(:[^ @]*\)\=@\)\=\|\(www[23]\=\.\|ftp\.\)\)[A-Za-z0-9%._/~:,=$@&-]\+\>/*\(?[A-Za-z0-9/%&=+;.,@*_-]\+\)\=\(#[A-Za-z0-9%._-]\+\)\='
syn match texyUrlLocal contained ' \([A-Za-z0-9%._/~,-]\+\|[A-Za-z0-9%._/~,-]*#[A-Za-z0-9%._-]\+\)\]'ms=s+1,me=e-1
syn match texyUri '[[:alnum:]_,.+%$#@!?+~/-]\+\.\(png\|jpe\=g\|gif\|eps\|bmp\)' contains=texyUrl,texyEmail,texyUrlLocal,texyImg
" syn match texyUrlMark '\[[^]]\+ [^] ]\+\]' contains=texyUrlLabel,texyUrl,texyEmail,texyUrlLocal
syn match texyUrlMark '"[^"]\+":\[\=[^] ]\+\]\=' contains=texyUrlLabel,texyUrl,texyEmail,texyUrlLocal,texyModifier,texyImg
syn match texyUrlMark '"\[[^]]\+\]' contains=texyUrlLabel
syn match texyUrlMark '\[\*[^]]\+\]:\[\=[^] ]\+\]\=' contains=texyUrlLabel,texyUrl,texyEmail,texyUrlLocal
" syn match texyUrlMarkImg '\[\[[[:alnum:]_,.+%$#@!?+~/-]\+\.\(png\|jpe\=g\|gif\|eps\|bmp\)\( \+"[^"]*"\)\{0,1\}\] [^] ]\+\]' contains=texyUrl,texyEmail,texyUrlLocal,texyImg
syn match texyUrlMarkImg '\[\*.\{-}[*<>]\]' contains=texyUrl,texyEmail,texyUrlLocal,texyImg,texyUri
syn match texyUrlLabel contained '"[^"]\+":'ms=s+1,me=e-1 contains=texyModifier,texyImg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FONT BEAUTIFIERS:
syn match   texyItalic        '\*\S\(\|.\{-}\S\)\*\+'hs=s+1,he=e-1
syn match   texyBold          '\*\*\S\(\|.\{-}\S\)\*\*\+'hs=s+2,he=e-2
syn match   texyItalicBold    '\*\*\*\S\(\|.\{-}\S\)\*\*\*\+'hs=s+3,he=e-3
syn match   texyUnderline     '++\S\(\|.\{-}\S\)++\+'hs=s+2,he=e-2
syn match   texyMonospace     '`\S\(\|.\{-}\S\)`\+'hs=s+2,he=e-2
syn match   texyImgLabel      '\*\*\* .*$'hs=s+3
" syn match   texyRaw          '""\S\(\|.\{-}\S\)""\+'hs=s+2,he=e-2
" syn match   texyPassthru     "''\S\(\|.\{-}\S\)''\+"hs=s+2,he=e-2
syn match   texyVerb1Line     '^/---code *'
syn match   texyRaw1Line      '^/---html *'
syn match   texyPassthru1Line '^/---\(text\|div\) *'
syn match   texyEndAreaLine   '^\\--- *$'
syn region  texyVerbArea     start='^/---code\s*$'hs=s+3 end='^\\---\s*$'he=e-3
" syn region  texyRawArea      start='^/---html\s*$'hs=s+3 end='^\\---\s*$'he=e-3
syn region  texyPassthruArea start="^/---text\s*$"hs=s+3 end="^\\---\s*$"he=e-3
" syn match   texyComment '^%.*$' contains=texyTodo,texyFoldMark,texyIncluded
" syn region  texyCommentArea  start="^%%%\s*$" end="^%%%\s*$"

"Experimental
syn region  texyTableArea  start="^|||\s*$" end="^|||\s*$" contains=texyTableTab,texyComment
syn match   texyTableTab '\t' contained
"hi texyTableTab    term=reverse     cterm=reverse     gui=reverse
"hi link texyTableArea  Statement
set list listchars=tab:··


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TABLE:
syn match   texyTableAlign contained ' \+$'
syn match   texyTableMark  contained '^ *[^ ]\+'
syn match   texyTableBar   contained ' |\+ '     contains=texyBlank
syn match   texyTableBar   contained '|\+\s*$'   contains=texyBlank
syn match   texyTableTit   contained '^ *||.*' contains=texyTableMark,texyTableBar,texyTableAlign
syn match   texyTable             '^ *||\= .*' contains=texyTableMark,texyTableBar,texyTableTit,@texyBeautifiers,@texyComponents,texyTableAlign

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MISC:
syn keyword texyTodo    TODO FIXME XXX contained
syn match   texyNumber  '\<\d\+\([,.]\d\+\)\{,1}\>'
syn match   texyPercent '\<\d\+\([,.]\d\+\)\{,1}%'
syn match   texyBlank   '\s\+$'
syn match   texyQuote   '^\(> \=\)\+'
syn match   texyBar     '^\s*\([=*] \=\)\{3,}\s*$' contains=texyQuote
syn match   texyImg     '\[\*.\{-}[*<>]\]' contains=texyUrl,texyUri,texyModifier
syn match   texyModifier '\.\([({[][^\])}]\+[\])}]\|[<>]\{1,2}\|=\)\+'
syn match   texyModifier '\.[<>]\{1,2}'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MACROS AND COMMANDS:
"syn match   texyMacro    '%%[a-z]\+'
" syn match   texyMacro    '%%\(date\|mtime\|infile\|outfile\)\>\(([^)]*)\)\='
" syn match   texyMacro    '^ *%%toc\s*$'
" syn match   texyIncluded '^%INCLUDED([a-z2]\+)'ms=s+1 contained 
" syn match   texyIncluded '^%--\{10,} Area Delimiter:'ms=s+1 contained 
" syn match   texyCommand  "^%!\s*include\s*\((\(\|txt\|html\|xhtml\|sgml\|lout\|tex\|mgp\|man\|moin\|pm6\))\)\=\s*:\s*\S"me=e-1 contains=texyTargets

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FOLD:
" syn match  texyFoldMark '\({{{\|}}}\)$'
" syn region texyUserFold keepend transparent fold start='^%.\+{{{$' end='^%.*}}}$'
" syn region texyTitleFold    transparent fold start='^ *=[^=].*[^=]=\(\[[a-z0-9_-]*\]\)\=\s*$' end='\n\n\n\n'
" syn region texyNumtitleFold transparent fold start='^ *+[^+].*[^+]+\(\[[a-z0-9_-]*\]\)\=\s*$' end='\n\n\n\n'
"heavy-folding-users: uncomment the following to fold *every* subtitle area
"syn region texyTitleFoldDeep transparent fold start='^ *\(=\{2,5}\)[^=].*[^=]\1$' end='\n\n\n\n'
"syn region texyNumtitleFoldDeep transparent fold start='^ *\(+\{2,5}\)[^+].*[^+]\1$' end='\n\n\n\n'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"HEADERS AND CONFIG:
"Headers are the first 3 lines
"Config are special comments right after the headers
"Config Area ends on a no-comment and no-blank line
" syn keyword texyTargets    contained txt xhtml html sgml tex lout mgp man
" syn keyword texyTargets    contained moin pm6
" syn match texyConfigString contained +"[^"]*"\|'[^']*'+
" syn match texyConfigValue  contained ':.*'ms=s+1 contains=texyConfigString
" " syn match texyConfigKey    contained '^%![^:]\+:' contains=texyTargets
" syn match texyConfigLine   contained "^%!\s*\(encoding\|style\|preproc\|postproc\|includeconf\|options\)\s*\((\s*\(\|txt\|html\|xhtml\|sgml\|tex\|lout\|mgp\|man\|moin\|pm6\)\s*)\)\=\s*:\s*\S.*" contains=texyConfigKey,texyConfigValue,texyConfigString
" syn match texyConfigLine   contained "^%!\s*target\s*:\s*\S.*" contains=texyConfigKey,texyTargets
" syn match texyConfigLine   contained "^%!\s*guicolors\s*:\s*\(\S\+\s\+\)\{3}\S\+\s*$" contains=texyConfigKey,texyTargets

" syn match  texyHeaderArea  contained '\%^.*\n.*\n.*$' contains=texyMacro
" syn region texyConfigArea         contained start='\%4l' end='^\%>3l[^%]'me=e-1 end='^\%>3l%!include[^c]'me=e-10 end='%%\(date\|mtim\|infi\|outf\)'me=e-6 contains=texyComment,texyConfigLine,texyConfig1
" syn region texyConfigAreaNoHeader contained start='\%2l' end='^\%>1l[^%]'me=e-1 end='^\%>1l%!include[^c]'me=e-10 end='%%\(date\|mtim\|infi\|outf\)'me=e-6 contains=texyComment,texyConfigLine,texyConfig1


" syn region texyTopArea       start='\%^\s*\S' end='^[^%]'me=e-1 end='^%!include[^c]'me=e-10 end='%%\(date\|mtim\|infi\|outf\)'me=e-6 contains=texyHeaderArea,texyConfigArea
" syn region texyTopAreaNoHead start='\%^\s*$'  end='^[^%]'me=e-1 end='^%!include[^c]'me=e-10 end='%%\(date\|mtim\|infi\|outf\)'me=e-6 contains=texyConfigAreaNoHeader

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" color groups
hi link texy_Link       PreProc
hi link texy_Component  Statement
hi link texy_Delim      Identifier
hi link texy_Verb       Type
" hi link texy_Raw        String
hi link texy_Passthru   Special
"
" color definitions (specific)
hi texyBar         term=bold        cterm=bold        gui=bold
hi texyBold        term=bold        cterm=bold        gui=bold
hi texyItalicBold  term=bold,italic cterm=bold,italic gui=bold,italic
hi texyItalic      term=italic      cterm=italic      gui=italic
hi texyUnderline   term=underline   cterm=underline   gui=underline
hi texyQuote       term=reverse     cterm=reverse     gui=reverse
hi texyTableAlign  term=reverse     cterm=reverse     gui=reverse
" hi texyComment     ctermfg=brown    guifg=brown
" hi texyCommentArea ctermfg=brown    guifg=brown
"
" color definitions (using Vim defaults)
hi link texyTitle         String
" hi link texyNumTitle      Error
" comment the following line to avoid having trailing whitespaces in red
hi link texyBlank         Error
hi link texyNumber        Number
hi link texyPercent       Number
hi link texyFoldMark      Special
hi link texyTodo          Todo
hi link texyCommand       Special
hi      texyIncluded      cterm=bold
hi link texyTargets       Type
hi link texyConfigKey     Special
hi link texyConfigValue   NONE
hi link texyConfigString  String
" hi link texyHeaderArea    texy_Raw
hi link texyUrlMark       texy_Delim
hi link texyUrlMarkImg    texy_Delim
hi link texyUrlLabel      texy_Delim
hi link texyTableTit      texy_Delim
hi link texyTableMark     texy_Delim
hi link texyTableBar      texy_Delim
hi link texyEmail         texy_Link
hi link texyUrl           texy_Link
hi link texyUrlLocal      texy_Link
" hi link texyTitleRef      texy_Link
hi link texyMacro         texy_Component
hi link texyImg           texy_Component
hi link texyList          texy_Component
hi link texyMacro         texy_Component
hi link texyTitleMark     Type
hi link texyVerbArea      texy_Verb
hi link texyVerb1Line     texy_Component
hi link texyMonospace     texy_Verb
" hi link texyRaw           texy_Raw
hi link texyRaw1Line      texy_Component
" hi link texyRawArea       texy_Raw
hi link texyPassthru      texy_Passthru
hi link texyPassthru1Line texy_Component
hi link texyPassthruArea  texy_Passthru
hi link texyEndAreaLine   texy_Component
hi link texyImgLabel      String
hi link texyModifier      Type
hi link texyUri           texy_Link

"
let b:current_syntax = 'txtexyags'
" vim:tw=0:et
"
