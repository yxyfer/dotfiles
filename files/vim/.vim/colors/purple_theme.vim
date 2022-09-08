" =============================================================================
"   Name:        purple_theme
"   Author:      Mathieu Rivier
"   License:     The MIT License (MIT)
"
"   A dark vim color scheme based on one half dark.
" =============================================================================

set background=dark
highlight clear
syntax reset

" Turn on function highlighting
syn match dFunction "\zs\(\k\w*\)*\s*\ze("
highlight def link dFunction Function

let g:colors_name="purple_theme"
let colors_name="purple_theme"


let s:black       = { "gui": "#282c34", "cterm": "236" }
let s:gray        = { "gui": "#303030", "cterm": "237" }
let s:red         = { "gui": "#e06c75", "cterm": "168" }
let s:green       = { "gui": "#98c379", "cterm": "108" }
let s:yellow      = { "gui": "#e5c07b", "cterm": "179" }
let s:blue        = { "gui": "#61afef", "cterm": "110" }
let s:purple      = { "gui": "#A95AA5", "cterm": "176" }
let s:cyan        = { "gui": "#56b6c2", "cterm": "73"  }
let s:white       = { "gui": "#dcdfe4", "cterm": "188" }

let s:fg          = s:white
let s:bg          = s:black

let s:comment_fg  = { "gui": "#5c6370", "cterm": "244" }
let s:gutter_bg   = { "gui": "#282c34", "cterm": "236" }
let s:gutter_fg   = { "gui": "#919baa", "cterm": "247" }
let s:non_text    = { "gui": "#373C45", "cterm": "239" }

let s:cursor_line = { "gui": "#313640", "cterm": "237" }
let s:color_col   = { "gui": "#313640", "cterm": "237" }

let s:pop_up_fg   = { "gui": "#b2b2b2", "cterm": "249" }
let s:pop_up_bg   = s:gray

let s:selection   = { "gui": "#474e5d", "cterm": "239" }
let s:vertsplit   = { "gui": "#313640", "cterm": "237" }


function! s:highlighter(group, fg, bg, attr)

  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  else
    exec "hi " . a:group . " guifg=NONE cterm=NONE"
  endif

  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  else
    exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
  endif

  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE cterm=NONE"
  endif
endfun


" User interface colors {
call s:highlighter("Normal", s:fg, s:bg, "")

call s:highlighter("Cursor", s:bg, s:purple, "")
call s:highlighter("CursorColumn", "", s:cursor_line, "")
call s:highlighter("CursorLine", "", s:cursor_line, "")

call s:highlighter("LineNr", s:gutter_fg, s:gutter_bg, "")
call s:highlighter("CursorLineNr", s:fg, "", "")

call s:highlighter("DiffAdd", s:black, s:green, "")
call s:highlighter("DiffChange", s:black, s:yellow, "")
call s:highlighter("DiffDelete", s:black, s:red, "")
call s:highlighter("DiffText", s:black, s:blue, "")

call s:highlighter("IncSearch", s:bg, s:yellow, "")
call s:highlighter("Search", s:bg, s:yellow, "")

call s:highlighter("ErrorMsg", s:fg, "", "")
call s:highlighter("ModeMsg", s:bg, "", "")
call s:highlighter("MoreMsg", s:fg, "", "")
call s:highlighter("WarningMsg", s:red, "", "")
call s:highlighter("Question", s:purple, "", "")

call s:highlighter("Pmenu", s:pop_up_fg, s:pop_up_bg, "")
call s:highlighter("PmenuSel", s:black, s:purple, "")
call s:highlighter("PmenuSbar", "", s:white, "")
call s:highlighter("PmenuThumb", "", s:white, "")

call s:highlighter("SpellBad", s:red, "", "")
call s:highlighter("SpellCap", s:yellow, "", "")
call s:highlighter("SpellLocal", s:yellow, "", "")
call s:highlighter("SpellRare", s:yellow, "", "")

call s:highlighter("StatusLine", s:purple, s:cursor_line, "")
call s:highlighter("StatusLineNC", s:comment_fg, s:cursor_line, "")
call s:highlighter("TabLine", s:comment_fg, s:cursor_line, "")
call s:highlighter("TabLineFill", s:comment_fg, s:cursor_line, "")
call s:highlighter("TabLineSel", s:fg, s:pop_up_bg, "")

call s:highlighter("Visual", "", s:selection, "")
call s:highlighter("VisualNOS", "", s:selection, "")

call s:highlighter("ColorColumn", "", s:color_col, "")
call s:highlighter("Conceal", s:fg, "", "")
call s:highlighter("Directory", s:purple, "", "")
call s:highlighter("VertSplit", s:vertsplit, s:vertsplit, "")
call s:highlighter("Folded", s:fg, "", "")
call s:highlighter("FoldColumn", s:fg, "", "")
call s:highlighter("SignColumn", s:fg, "", "")

call s:highlighter("MatchParen", s:purple, "", "underline")
call s:highlighter("SpecialKey", s:fg, "", "")
call s:highlighter("Title", s:green, "", "")
call s:highlighter("WildMenu", s:fg, "", "")
" }


" Syntax colors {
" Whitespace is defined in Neovim, not Vim.
" See :help hl-Whitespace and :help hl-SpecialKey
call s:highlighter("Whitespace", s:non_text, "", "")
call s:highlighter("NonText", s:non_text, "", "")
call s:highlighter("Comment", s:comment_fg, "", "")
call s:highlighter("Constant", s:yellow, "", "")
call s:highlighter("String", s:green, "", "")
call s:highlighter("Character", s:green, "", "")
call s:highlighter("Number", s:yellow, "", "")
call s:highlighter("Boolean", s:yellow, "", "")
call s:highlighter("Float", s:yellow, "", "")

call s:highlighter("Identifier", s:red, "", "")
call s:highlighter("Function", s:blue, "", "")
call s:highlighter("Statement", s:purple, "", "")

call s:highlighter("Conditional", s:purple, "", "")
call s:highlighter("Repeat", s:purple, "", "")
call s:highlighter("Label", s:purple, "", "")
call s:highlighter("Operator", s:purple, "", "")
call s:highlighter("Keyword", s:cyan, "", "")
call s:highlighter("Exception", s:purple, "", "")

call s:highlighter("PreProc", s:yellow, "", "")
call s:highlighter("Include", s:purple, "", "")
call s:highlighter("Define", s:purple, "", "")
call s:highlighter("Macro", s:yellow, "", "")
call s:highlighter("PreCondit", s:purple, "", "")

call s:highlighter("Type", s:cyan, "", "")
call s:highlighter("StorageClass", s:yellow, "", "")
call s:highlighter("Structure", s:purple, "", "")
call s:highlighter("Typedef", s:blue, "", "")

call s:highlighter("Special", s:blue, "", "")
call s:highlighter("SpecialChar", s:yellow, "", "")
call s:highlighter("Tag", s:fg, "", "")
call s:highlighter("Delimiter", s:fg, "", "")
call s:highlighter("SpecialComment", s:fg, "", "")
call s:highlighter("Debug", s:fg, "", "")
call s:highlighter("Underlined", s:fg, "", "")
call s:highlighter("Ignore", s:fg, "", "")
call s:highlighter("Error", s:red, s:gutter_bg, "")
call s:highlighter("Todo", s:white, "", "")
" }


" Plugins {
" GitGutter
call s:highlighter("GitGutterAdd", s:green, s:gutter_bg, "")
call s:highlighter("GitGutterDelete", s:red, s:gutter_bg, "")
call s:highlighter("GitGutterChange", s:yellow, s:gutter_bg, "")
call s:highlighter("GitGutterChangeDelete", s:red, s:gutter_bg, "")
" Fugitive
call s:highlighter("diffAdded", s:green, "", "")
call s:highlighter("diffRemoved", s:red, "", "")
" }


" Git {
call s:highlighter("gitcommitComment", s:comment_fg, "", "")
call s:highlighter("gitcommitUnmerged", s:red, "", "")
call s:highlighter("gitcommitOnBranch", s:fg, "", "")
call s:highlighter("gitcommitBranch", s:purple, "", "")
call s:highlighter("gitcommitDiscardedType", s:red, "", "")
call s:highlighter("gitcommitSelectedType", s:green, "", "")
call s:highlighter("gitcommitHeader", s:fg, "", "")
call s:highlighter("gitcommitUntrackedFile", s:cyan, "", "")
call s:highlighter("gitcommitDiscardedFile", s:red, "", "")
call s:highlighter("gitcommitSelectedFile", s:green, "", "")
call s:highlighter("gitcommitUnmergedFile", s:yellow, "", "")
call s:highlighter("gitcommitFile", s:fg, "", "")
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile
" }

" Fix colors in neovim terminal buffers {
  if has('nvim')
    let g:terminal_color_0 = s:black.gui
    let g:terminal_color_1 = s:red.gui
    let g:terminal_color_2 = s:green.gui
    let g:terminal_color_3 = s:yellow.gui
    let g:terminal_color_4 = s:blue.gui
    let g:terminal_color_5 = s:purple.gui
    let g:terminal_color_6 = s:cyan.gui
    let g:terminal_color_7 = s:white.gui
    let g:terminal_color_8 = s:black.gui
    let g:terminal_color_9 = s:red.gui
    let g:terminal_color_10 = s:green.gui
    let g:terminal_color_11 = s:yellow.gui
    let g:terminal_color_12 = s:blue.gui
    let g:terminal_color_13 = s:purple.gui
    let g:terminal_color_14 = s:cyan.gui
    let g:terminal_color_15 = s:white.gui
    let g:terminal_color_background = s:bg.gui
    let g:terminal_color_foreground = s:fg.gui
  endif
" }
