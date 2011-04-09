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
	\   'Normal'                      : [    231, 'none',           'none']
	\ , 'Visual'                      : [ 'none',    239,           'none']
	\
	\ , 'CursorLine'                  : [    231,    237,           'none']
	\ , 'CursorColumn'                : [    231,    237,           'none']
	\
	\ , 'Folded'                      : [    249,    234,           'none']
	\ , 'FoldColumn'                  : [    243,    234,           'none']
	\ , 'SignColumn'                  : [    231,    233,           'bold']
	\ , 'ColorColumn'                 : [  'none',   235,           'none']
	\
	\ , 'StatusLine'                  : [    231,    236,           'bold']
	\ , 'StatusLineNC'                : [    244,    232,           'none']
	\
	\ , 'LineNr'                      : [    243,    235,           'none']
	\ , 'VertSplit'                   : [    240,    234,           'none']
	\
	\ , 'WildMenu'                    : [    234,    231,           'none']
	\ , 'Directory'                   : [    143, 'none',           'bold']
	\ , 'Underlined'                  : [    130, 'none',           'none']
	\
	\ , 'Question'                    : [     74, 'none',           'bold']
	\ , 'MoreMsg'                     : [    214, 'none',           'bold']
	\ , 'WarningMsg'                  : [    202, 'none',           'bold']
	\ , 'ErrorMsg'                    : [    196, 'none',           'bold']
	\
	\ , 'Comment'                     : [    243,    233,           'none']
	\ , 'vimCommentTitleLeader'       : [    250,    233,           'none']
	\ , 'vimCommentTitle'             : [    250,    233,           'none']
	\ , 'vimCommentString'            : [    245,    233,           'none']
	\
	\ , 'TabLine'                     : [    231,    238,           'none']
	\ , 'TabLineSel'                  : [    255, 'none',           'bold']
	\ , 'TabLineFill'                 : [    240,    238,           'none']
	\ , 'TabLineNumber'               : [    160,    238,           'bold']
	\ , 'TabLineClose'                : [    245,    238,           'bold']
	\
	\ , 'SpecialKey'                  : [    239, 'none',           'none']
	\ , 'NonText'                     : [     88, 'none',           'none']
	\ , 'MatchParen'                  : [    196,     88,           'bold']
	\
	\ , 'Constant'                    : [    137, 'none',           'bold']
	\ , 'Special'                     : [    150, 'none',           'none']
	\ , 'Identifier'                  : [     66, 'none',           'bold']
	\ , 'Statement'                   : [    186, 'none',           'bold']
	\ , 'PreProc'                     : [    144, 'none',           'none']
	\ , 'Type'                        : [     67, 'none',           'bold']
	\ , 'String'                      : [    143, 'none',           'none']
	\ , 'Number'                      : [    173, 'none',           'none']
	\ , 'Define'                      : [    173, 'none',           'none']
	\ , 'Error'                       : [    208,    124,           'none']
	\ , 'Function'                    : [    221, 'none',           'none']
	\ , 'Include'                     : [    173, 'none',           'none']
	\ , 'PreCondit'                   : [    173, 'none',           'none']
	\ , 'Keyword'                     : [    173, 'none',           'none']
	\ , 'Search'                      : [     16,    227, 'underline,bold']
	\ , 'Title'                       : [     15, 'none',           'none']
	\
	\ , 'TODO'                        : [    228,     94,           'bold']
	\
	\ , 'Pmenu'                       : [    248,    240,           'none']
	\ , 'PmenuSel'                    : [    253,    245,           'none']
	\ , 'PmenuSbar'                   : [    253,    248,           'none']
	\
	\ , 'phpEOL'                      : [    245, 'none',           'none']
	\ , 'phpStringDelim'              : [     94, 'none',           'none']
	\ , 'phpDelimiter'                : [    160, 'none',           'none']
	\ , 'phpFunctions'                : [    221, 'none',           'bold']
	\ , 'phpBoolean'                  : [    172, 'none',           'bold']
	\ , 'phpOperator'                 : [    215, 'none',           'none']
	\ , 'phpMemberSelector'           : [    138, 'none',           'bold']
	\ , 'phpParent'                   : [    227, 'none',           'none']
	\
	\ , 'PHPClassTag'                 : [    253, 'none',           'none']
	\ , 'PHPInterfaceTag'             : [    253, 'none',           'none']
	\ , 'PHPFunctionTag'              : [    222, 'none',           'bold']
	\
	\ , 'xmlTag'                      : [    149, 'none',           'bold']
	\ , 'xmlTagName'                  : [    250, 'none',           'none']
	\ , 'xmlEndTag'                   : [    209, 'none',           'bold']
	\
	\ , 'cssImportant'                : [    166, 'none',           'bold']
	\
	\ , 'DiffAdd'                     : [    112,     22,           'none']
	\ , 'DiffChange'                  : [    220,     94,           'none']
	\ , 'DiffDelete'                  : [    160, 'none',           'none']
	\ , 'DiffText'                    : [    220,     94,   'reverse,bold']
	\
	\ , 'diffLine'                    : [     68, 'none',           'bold']
	\ , 'diffFile'                    : [    242, 'none',           'none']
	\ , 'diffNewFile'                 : [    242, 'none',           'none']
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
