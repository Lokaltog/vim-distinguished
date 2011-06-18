" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-distinguished

" Initialization {{{
	set background=dark

	hi clear
	if exists('syntax_on')
		syntax reset
	endif

	let g:colors_name = 'distinguished'

	if &t_Co != 256 || has('gui_running')
		echoe 'The ' . g:colors_name . ' color scheme requires a 256-color terminal'

		finish
	endif
" }}}
" Color dictionary parser {{{
	function! s:ColorDictParser(color_dict)
		for [group, group_colors] in items(a:color_dict)
			exec 'hi ' . group
				\ . ( ! empty(group_colors[0]) ? ' ctermfg=' . group_colors[0]: '')
				\ . ( ! empty(group_colors[1]) ? ' ctermbg=' . group_colors[1]: '')
				\ . ( ! empty(group_colors[2]) ? '   cterm=' . group_colors[2]: '')
		endfor
	endfunction
" }}}

"        | Highlight group                |    FG |    BG |      Attributes |
"        |--------------------------------|-------|-------|-----------------|
call s:ColorDictParser({
	\   'Normal'                      : [    231, 'NONE',           'NONE']
	\ , 'Visual'                      : [ 'NONE',    239,           'NONE']
	\
	\ , 'CursorLine'                  : [    231,    237,           'NONE']
	\ , 'CursorColumn'                : [    231,    237,           'NONE']
	\
	\ , 'Folded'                      : [    249,    234,           'NONE']
	\ , 'FoldColumn'                  : [    243,    234,           'NONE']
	\ , 'SignColumn'                  : [    231,    233,           'bold']
	\ , 'ColorColumn'                 : [  'NONE',   235,           'NONE']
	\
	\ , 'StatusLine'                  : [    231,    236,           'bold']
	\ , 'StatusLineNC'                : [    244,    232,           'NONE']
	\
	\ , 'LineNr'                      : [    243,    235,           'NONE']
	\ , 'VertSplit'                   : [    240,    234,           'NONE']
	\
	\ , 'WildMenu'                    : [    234,    231,           'NONE']
	\ , 'Directory'                   : [    143, 'NONE',           'bold']
	\ , 'Underlined'                  : [    130, 'NONE',           'NONE']
	\
	\ , 'Question'                    : [     74, 'NONE',           'bold']
	\ , 'MoreMsg'                     : [    214, 'NONE',           'bold']
	\ , 'WarningMsg'                  : [    202, 'NONE',           'bold']
	\ , 'ErrorMsg'                    : [    196, 'NONE',           'bold']
	\
	\ , 'Comment'                     : [    243,    233,           'NONE']
	\ , 'vimCommentTitleLeader'       : [    250,    233,           'NONE']
	\ , 'vimCommentTitle'             : [    250,    233,           'NONE']
	\ , 'vimCommentString'            : [    245,    233,           'NONE']
	\
	\ , 'TabLine'                     : [    231,    238,           'NONE']
	\ , 'TabLineSel'                  : [    255, 'NONE',           'bold']
	\ , 'TabLineFill'                 : [    240,    238,           'NONE']
	\ , 'TabLineNumber'               : [    160,    238,           'bold']
	\ , 'TabLineClose'                : [    245,    238,           'bold']
	\
	\ , 'SpecialKey'                  : [    239, 'NONE',           'NONE']
	\ , 'NonText'                     : [     88, 'NONE',           'NONE']
	\ , 'MatchParen'                  : [    196,     88,           'bold']
	\
	\ , 'Constant'                    : [    137, 'NONE',           'bold']
	\ , 'Special'                     : [    150, 'NONE',           'NONE']
	\ , 'Identifier'                  : [     66, 'NONE',           'bold']
	\ , 'Statement'                   : [    186, 'NONE',           'bold']
	\ , 'PreProc'                     : [    144, 'NONE',           'NONE']
	\ , 'Type'                        : [     67, 'NONE',           'bold']
	\ , 'String'                      : [    143, 'NONE',           'NONE']
	\ , 'Number'                      : [    173, 'NONE',           'NONE']
	\ , 'Define'                      : [    173, 'NONE',           'NONE']
	\ , 'Error'                       : [    208,    124,           'NONE']
	\ , 'Function'                    : [    221, 'NONE',           'NONE']
	\ , 'Include'                     : [    173, 'NONE',           'NONE']
	\ , 'PreCondit'                   : [    173, 'NONE',           'NONE']
	\ , 'Keyword'                     : [    173, 'NONE',           'NONE']
	\ , 'Search'                      : [     16,    227, 'underline,bold']
	\ , 'Title'                       : [     15, 'NONE',           'NONE']
	\
	\ , 'TODO'                        : [    228,     94,           'bold']
	\
	\ , 'Pmenu'                       : [    248,    240,           'NONE']
	\ , 'PmenuSel'                    : [    253,    245,           'NONE']
	\ , 'PmenuSbar'                   : [    253,    248,           'NONE']
	\
	\ , 'phpEOL'                      : [    245, 'NONE',           'NONE']
	\ , 'phpStringDelim'              : [     94, 'NONE',           'NONE']
	\ , 'phpDelimiter'                : [    160, 'NONE',           'NONE']
	\ , 'phpFunctions'                : [    221, 'NONE',           'bold']
	\ , 'phpBoolean'                  : [    172, 'NONE',           'bold']
	\ , 'phpOperator'                 : [    215, 'NONE',           'NONE']
	\ , 'phpMemberSelector'           : [    138, 'NONE',           'bold']
	\ , 'phpParent'                   : [    227, 'NONE',           'NONE']
	\
	\ , 'PHPClassTag'                 : [    253, 'NONE',           'NONE']
	\ , 'PHPInterfaceTag'             : [    253, 'NONE',           'NONE']
	\ , 'PHPFunctionTag'              : [    222, 'NONE',           'bold']
	\
	\ , 'xmlTag'                      : [    149, 'NONE',           'bold']
	\ , 'xmlTagName'                  : [    250, 'NONE',           'NONE']
	\ , 'xmlEndTag'                   : [    209, 'NONE',           'bold']
	\
	\ , 'cssImportant'                : [    166, 'NONE',           'bold']
	\
	\ , 'DiffAdd'                     : [    112,     22,           'NONE']
	\ , 'DiffChange'                  : [    220,     94,           'NONE']
	\ , 'DiffDelete'                  : [    160, 'NONE',           'NONE']
	\ , 'DiffText'                    : [    220,     94,   'reverse,bold']
	\
	\ , 'diffLine'                    : [     68, 'NONE',           'bold']
	\ , 'diffFile'                    : [    242, 'NONE',           'NONE']
	\ , 'diffNewFile'                 : [    242, 'NONE',           'NONE']
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
