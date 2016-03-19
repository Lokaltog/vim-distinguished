" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-distinguished

" Initialization {{{
	set background=dark

	hi clear
	if exists('syntax_on')
		syntax reset
	endif

	let g:colors_name = 'distinguished'

	if ! has('gui_running')
		if &t_Co != 256
			echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'

			finish
		endif
	endif
" }}}
" Color dictionary parser {{{
	function! s:ColorDictParser(color_dict)
		for [group, group_colors] in items(a:color_dict)
			exec 'hi ' . group
				\ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
				\ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
				\ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
				\
				\ . '   guifg=' . (group_colors[3] == '' ? 'NONE' : '#' . group_colors[3])
				\ . '   guibg=' . (group_colors[4] == '' ? 'NONE' : '#' . group_colors[4])
				\ . '     gui=' . (group_colors[5] == '' ? 'NONE' :       group_colors[5])
		endfor
	endfunction
" }}}

"	   | Highlight group                |  CTFG |  CTBG |    CTAttributes | || |   GUIFG |    GUIBG |   GUIAttributes |
"	   |--------------------------------|-------|-------|-----------------| || |---------|----------|-----------------|
call s:ColorDictParser({
	\   'Normal'                      : [    251,     16,               '',      'c6c6c6',  '000000',               '']
	\ , 'Visual'                      : [     '',    237,               '',            '',  '3a3a3a',               '']
	\
	\ , 'Cursor'                      : [     '',     '',               '',      'c6c6c6',  'dd4010',               '']
	\ , 'lCursor'                     : [     '',     '',               '',      'c6c6c6',  '89b6e2',               '']
	\
	\ , 'CursorLine'                  : [     '',    234,               '',            '',  '1c1c1c',               '']
	\ , 'CursorLineNr'                : [    249,    234,               '',      'b2b2b2',  '1c1c1c',               '']
	\ , 'CursorColumn'                : [    251,    237,               '',      'c6c6c6',  '3a3a3a',               '']
	\
	\ , 'Folded'                      : [    249,    234,               '',      'b2b2b2',  '1c1c1c',               '']
	\ , 'FoldColumn'                  : [    243,    234,               '',      '767676',  '1c1c1c',               '']
	\ , 'SignColumn'                  : [    251,    233,           'bold',      'c6c6c6',  '121212',           'bold']
	\ , 'ColorColumn'                 : [      '',   233,               '',            '',  '262626',               '']
	\
	\ , 'StatusLine'                  : [    251,    236,           'bold',      'c6c6c6',  '303030',           'bold']
	\ , 'StatusLineNC'                : [    244,    232,               '',      '808080',  '080808',               '']
	\
	\ , 'LineNr'                      : [    234,    '',               '',       '1c1c1c',        '',               '']
	\ , 'VertSplit'                   : [    240,    '',               '',       '585858',        '',               '']
	\
	\ , 'WildMenu'                    : [    234,    251,               '',      '1c1c1c',  'c6c6c6',               '']
	\ , 'Directory'                   : [    143,     '',           'bold',      'afaf5f',        '',           'bold']
	\ , 'Underlined'                  : [    130,     '',               '',      'af5f00',        '',               '']
	\
	\ , 'Question'                    : [     74,     '',           'bold',      '5fafd7',        '',           'bold']
	\ , 'MoreMsg'                     : [    214,     '',           'bold',      'ffaf00',        '',           'bold']
	\ , 'WarningMsg'                  : [    202,     '',           'bold',      'ff5f00',        '',           'bold']
	\ , 'ErrorMsg'                    : [    196,     '',           'bold',      'ff0000',        '',           'bold']
	\
	\ , 'Comment'                     : [    243,    233,               '',      '767676',  '121212',               '']
	\ , 'vimCommentTitleLeader'       : [    251,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentTitle'             : [    251,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentString'            : [    245,    233,               '',      '8a8a8a',  '121212',               '']
	\
	\ , 'TabLine'                     : [    251,    238,               '',      'c6c6c6',  '444444',               '']
	\ , 'TabLineSel'                  : [    255,     '',           'bold',      'eeeeee',        '',           'bold']
	\ , 'TabLineFill'                 : [    240,    238,               '',      '585858',  '444444',               '']
	\ , 'TabLineNumber'               : [    160,    238,           'bold',      'd70000',  '444444',           'bold']
	\ , 'TabLineClose'                : [    245,    238,           'bold',      '8a8a8a',  '444444',           'bold']
	\
	\ , 'SpellCap'                    : [    251,     31,           'bold',      'c6c6c6',  '0087af',           'bold']
	\
	\ , 'SpecialKey'                  : [    239,     '',               '',      '4e4e4e',        '',               '']
	\ , 'NonText'                     : [     88,     '',               '',      '870000',        '',               '']
	\ , 'MatchParen'                  : [    251,     25,           'bold',      'c6c6c6',  '005faf',           'bold']
	\
	\ , 'Constant'                    : [    137,     '',           'bold',      'af875f',        '',           'bold']
	\ , 'Special'                     : [    150,     '',               '',      'afd787',        '',               '']
	\ , 'Identifier'                  : [     66,     '',           'bold',      '5f8787',        '',           'bold']
	\ , 'Statement'                   : [    186,     '',           'bold',      'd7d787',        '',           'bold']
	\ , 'PreProc'                     : [    247,     '',               '',      '9e9e9e',        '',               '']
	\ , 'Type'                        : [     67,     '',           'bold',      '5f87af',        '',           'bold']
	\ , 'String'                      : [    143,     '',               '',      'afaf5f',        '',               '']
	\ , 'Number'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Define'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Error'                       : [    208,    124,               '',      'ff8700',  'af0000',               '']
	\ , 'Function'                    : [    179,     '',               '',      'd7af5f',        '',               '']
	\ , 'Include'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'PreCondit'                   : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Keyword'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Search'                      : [    251,    131,               '',      '000000',  'ffff5f', 'underline,bold']
	\ , 'Title'                       : [    251,     '',               '',      'c6c6c6',        '',               '']
	\ , 'Delimiter'                   : [    246,     '',               '',      '949494',        '',               '']
	\ , 'StorageClass'                : [    187,     '',               '',      'd7d7af',        '',               '']
	\ , 'Operator'                    : [    180,     '',               '',      'd7af87',        '',               '']
	\
	\ , 'TODO'                        : [    228,     94,           'bold',      'ffff87',  '875f00',           'bold']
	\
	\ , 'SyntasticWarning'            : [    220,     94,               '',      'ffff87',  '875f00',           'bold']
	\ , 'SyntasticError'              : [    202,     52,               '',      'ffff87',  '875f00',           'bold']
	\
	\ , 'Pmenu'                       : [    248,    234,               '',      'a8a8a8',  '1c1c1c',               '']
	\ , 'PmenuSel'                    : [    234,    251,               '',      '1c1c1c',  'c6c6c6',               '']
	\ , 'PmenuSbar'                   : [    253,    233,               '',      'dadada',  '121212',               '']
	\ , 'PmenuThumb'                  : [    253,    236,               '',      'dadada',  '3a3a3a',               '']
	\
	\ , 'phpEOL'                      : [    245,     '',               '',      'dadada',        '',               '']
	\ , 'phpStringDelim'              : [     94,     '',               '',      '875f00',        '',               '']
	\ , 'phpDelimiter'                : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'phpFunctions'                : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'phpBoolean'                  : [    172,     '',           'bold',      'd78700',        '',           'bold']
	\ , 'phpOperator'                 : [    215,     '',               '',      'ffaf5f',        '',               '']
	\ , 'phpMemberSelector'           : [    138,     '',           'bold',      'af8787',        '',           'bold']
	\ , 'phpParent'                   : [    227,     '',               '',      'ffff5f',        '',               '']
	\
	\ , 'PHPClassTag'                 : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPInterfaceTag'             : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPFunctionTag'              : [    222,     '',           'bold',      'ffd787',        '',           'bold']
	\
	\ , 'pythonDocString'             : [    240,    233,               '',      '585858',  '121212',               '']
	\ , 'pythonDocStringTitle'        : [    245,    233,               '',      'dadada',  '121212',               '']
	\ , 'pythonRun'                   : [     65,     '',               '',      '5f875f',        '',               '']
	\ , 'pythonBuiltinObj'            : [     67,     '',           'bold',      '5f87af',        '',           'bold']
	\ , 'pythonSelf'                  : [    251,     '',           'bold',      'bcbcbc',        '',           'bold']
	\ , 'pythonFunction'              : [    179,     '',           'bold',      'd7af5f',        '',           'bold']
	\ , 'pythonClass'                 : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'pythonExClass'               : [    130,     '',               '',      'af5f00',        '',               '']
	\ , 'pythonException'             : [    130,     '',           'bold',      'af5f00',        '',           'bold']
	\ , 'pythonOperator'              : [    186,     '',               '',      'd7d787',        '',               '']
	\ , 'pythonPreCondit'             : [    152,     '',           'bold',      'afd7d7',        '',           'bold']
	\ , 'pythonDottedName'            : [    166,     '',               '',      'd75f00',        '',               '']
	\ , 'pythonDecorator'             : [    124,     '',           'bold',      'af0000',        '',           'bold']
	\
	\ , 'PythonInterfaceTag'          : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonClassTag'              : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'PythonFunctionTag'           : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonVariableTag'           : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PythonMemberTag'             : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'CTagsImport'                 : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsClass'                  : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'CTagsFunction'               : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsGlobalVariable'         : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'CTagsMember'                 : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'xmlTag'                      : [    149,     '',           'bold',      'afd75f',        '',           'bold']
	\ , 'xmlTagName'                  : [    251,     '',               '',      'bcbcbc',        '',               '']
	\ , 'xmlEndTag'                   : [    209,     '',           'bold',      'ff875f',        '',           'bold']
	\
	\ , 'cssImportant'                : [    166,     '',           'bold',      'd75f00',        '',           'bold']
	\
	\ , 'DiffAdd'                     : [    112,     22,               '',      '87d700',  '005f00',               '']
	\ , 'DiffChange'                  : [    220,     94,               '',      'ffd700',  '875f00',               '']
	\ , 'DiffDelete'                  : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'DiffText'                    : [    220,     94,   'reverse,bold',      'ffd700',  '875f00',   'reverse,bold']
	\
	\ , 'diffLine'                    : [     68,     '',           'bold',      '5f87d7',        '',           'bold']
	\ , 'diffFile'                    : [    242,     '',               '',      '6c6c6c',        '',               '']
	\ , 'diffNewFile'                 : [    242,     '',               '',      '6c6c6c',        '',               '']
\ })

hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete
