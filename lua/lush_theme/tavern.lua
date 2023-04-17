local lush = require('lush')
local hsl = lush.hsl
local colors = {
    -- Shades and Tints
    base00 = hsl('#1b1413'), -- Background
    base01 = hsl('#41302e'),
    base02 = hsl('#58413f'),
    base03 = hsl('#6f524f'),
    base04 = hsl('#bba2a0'),
    base05 = hsl('#cbb8b7'), -- Foreground
    base06 = hsl('#dccfcd'),
    base07 = hsl('#ece5e4'),

    -- Colors
    base08 = hsl('#cb6077'),
    base09 = hsl('#c58920'),
    base0A = hsl('#e8e80e'),
    base0B = hsl('#05b876'),
    base0C = hsl('#8ab3b5'),
    base0D = hsl('#5a86d3'),
    base0E = hsl('#a34d5f'),
    base0F = hsl('#b0987a'),
}

---@diagnostic disable: undefined-global
local theme = lush(function()
    return {
        ColorColumn  {  bg = colors.base00.lighten(15) }, -- Columns set with 'colorcolumn'
        -- Conceal      { bg = colors.base00 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor       { fg = colors.base05.rotate(180) }, -- Character under the cursor
        -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
        CursorColumn { bg = colors.base00.lighten(10) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine   { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory    { fg = colors.base0F, gui = 'bold'}, -- Directory names (and other special names in listings)
        DiffAdd      { bg = colors.base0B, fg = colors.base07 }, -- Diff mode: Added line |diff.txt|
        DiffChange   { bg = colors.base0E.darken(30), fg = colors.base07 }, -- Diff mode: Changed line |diff.txt|
        DiffDelete   { bg = colors.base08, fg = colors.base07 }, -- Diff mode: Deleted line |diff.txt|
        DiffText     { bg = colors.base0D, fg = colors.base00 }, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer  { fg = colors.base05.darken(30) }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor   { }, -- Cursor in a focused terminal
        -- TermCursorNC { }, -- Cursor in an unfocused terminal
        ErrorMsg     { fg = colors.base0E.saturate(20) }, -- Error messages on the command line
        VertSplit    { bg = colors.base00, fg = colors.base05 }, -- Column separating vertically split windows
        Folded       { bg = colors.base03, gf = colors.base05 }, -- Line used for closed folds
        FoldColumn   { Folded }, -- 'foldcolumn'
        SignColumn   { bg = colors.base00 }, -- Column where |signs| are displayed
        IncSearch    { bg = colors.base0A, fg = colors.base00 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute   { IncSearch }, -- |:substitute| replacement text highlighting
        LineNr       { fg = colors.base01.lighten(10) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        CursorLineNr { fg = colors.base09 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen   { bg = colors.base03 }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg      { bg = colors.base00, fg = colors.base05, gui = 'bold'}, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea      { }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- MoreMsg      { }, -- |more-prompt|
        NonText      { fg = colors.base05.darken(30) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal       { bg = colors.base00, fg = colors.base05 }, -- Normal text
        NormalFloat  { bg = colors.base00.darken(10), fg = Normal.fg }, -- Normal text in floating windows.
        NormalNC     { Normal }, -- normal text in non-current windows
        Pmenu        {  bg = colors.base00.lighten(10), fg = Normal.fg }, -- Popup menu: Normal item.
        PmenuSel     { bg = CursorLine.bg.lighten(10), gui = 'bold' }, -- Popup menu: Selected item.
        PmenuSbar    { bg = colors.base02 }, -- Popup menu: Scrollbar.
        PmenuThumb   { bg = colors.base05 }, -- Popup menu: Thumb of the scrollbar.
        Question     { fg = colors.base05, gui = 'italic' }, -- |hit-enter| prompt and yes/no questions
        QuickFixLine { fg = colors.base0A }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search       { IncSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        SpecialKey   { fg = colors.base0E }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad     { fg = colors.base0E, gui = 'underline italic' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap     { fg = colors.base0D, gui = 'italic' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal   { fg = colors.base0F }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare    { fg = colors.base0C}, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine   { bg = colors.base02 }, -- Status line of current window
        StatusLineNC { bg = colors.base01}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine      { bg = colors.base01 }, -- Tab pages line, not active tab page label
        TabLineFill  { bg = colors.base01 }, -- Tab pages line, where there are no labels
        TabLineSel   { bg = colors.base00, gui = 'bold' }, -- Tab pages line, active tab page label
        Title        { fg = colors.base05, gui = 'bold' }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual       { bg = colors.base02.darken(20), gui = 'bold'}, -- Visual mode selection
        VisualNOS    { bg = colors.base02.darken(30) }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg   { fg = colors.base0A, gui = 'bold italic' }, -- Warning messages
        Whitespace   { fg = colors.base00.desaturate(25).lighten(25) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Winseparator { Normal }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        WildMenu     { bg = colors.base01, fg = colors.base05 }, -- Current match in 'wildmenu' completion

        Comment        { fg = colors.base03.desaturate(15), gui = 'italic' }, -- Any comment

        Constant       { fg = colors.base09 }, -- (*) Any constant
        String         { fg = colors.base0B }, --   A string constant: "this is a string"
        Character      { fg = colors.base0B }, --   A character constant: 'c', '\n'
        Number         { fg = colors.base09 }, --   A number constant: 234, 0xff
        Boolean        { fg = colors.base09 }, --   A boolean constant: TRUE, false
        Float          { fg = colors.base09 }, --   A floating point constant: 2.3e10

        Identifier     { fg = colors.base0F }, -- (*) Any variable name
        Function       { fg = colors.base08 }, --   Function name (also: methods for classes)

        Statement      { fg = colors.base09 }, -- (*) Any statement
        Conditional    { fg = colors.base0E }, --   if, then, else, endif, switch, etc.
        Repeat         { fg = colors.base0E }, --   for, do, while, etc.
        Label          { fg = colors.base0E }, --   case, default, etc.
        Operator       { fg = colors.base09 }, --   "sizeof", "+", "*", etc.
        Keyword        { fg = colors.base0E }, --   any other keyword
        Exception      { fg = colors.base0E }, --   try, catch, throw

        PreProc        { fg = colors.base0F }, -- (*) Generic Preprocessor
        Include        { fg = colors.base0F }, --   Preprocessor #include
        Define         { fg = colors.base0F }, --   Preprocessor #define
        Macro          { fg = colors.base0F }, --   Same as Define
        PreCondit      { fg = colors.base0F }, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = colors.base0D }, -- (*) int, long, char, etc.
        StorageClass   { fg = colors.base0E }, --   static, register, volatile, etc.
        Structure      { fg = colors.base0D }, --   struct, union, enum, etc.
        Typedef        { fg = colors.base0D }, --   A typedef

        Special        { fg = colors.base0C }, -- (*) Any special symbol
        SpecialChar    { fg = colors.base0C }, --   Special character in a constant
        SpecialComment { fg = colors.base0C }, --   Special things inside a comment (e.g. '\n')
        Tag            { fg = colors.base09 }, --   You can use CTRL-] on this
        Delimiter      { fg = colors.base09 }, --   Character that needs attention
        Debug          { fg = colors.base09 }, --   Debugging statements

        -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
        -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        -- Error          { }, -- Any erroneous construct
        -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        DiagnosticError            { ErrorMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticWarn             { fg = colors.base0A } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo             { fg = colors.base0C } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint             { fg = colors.base0B } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
        -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
        -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
        -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

        -- Tree-Sitter syntax groups. Most link to corresponding
        -- vim syntax groups (e.g. TSKeyword => Keyword) by default.
        --
        -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
        -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
        -- TSCharacter          { } , -- Character literals: `'a'` in C.
        -- TSCharacterSpecial   { } , -- Special characters.
        -- TSComment            { } , -- Line comments and block comments.
        -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
        -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
        -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
        -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
        -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
        -- TSDebug              { } , -- Debugging statements.
        -- TSDefine             { } , -- Preprocessor #define statements.
        -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
        -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
        -- TSField              { } , -- Object and struct fields.
        -- TSFloat              { } , -- Floating-point number literals.
        -- TSFunction           { } , -- Function calls and definitions.
        -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
        -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
        -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
        -- TSKeyword            { } , -- Keywords that don't fit into other categories.
        -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
        -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
        -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
        -- TSMethod             { } , -- Method calls and definitions.
        -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
        -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
        -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
        -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
        -- TSParameter          { } , -- Parameters of a function.
        -- TSParameterReference { } , -- References to parameters of a function.
        -- TSPreProc            { } , -- Preprocessor #if, #else, #endif, etc.
        -- TSProperty           { } , -- Same as `TSField`.
        -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
        -- TSPunctBracket       { } , -- Brackets, braces, parentheses, etc.
        -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
        -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
        -- TSStorageClass       { } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
        -- TSString             { } , -- String literals.
        -- TSStringRegex        { } , -- Regular expression literals.
        -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
        -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
        -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
        -- TSTag                { } , -- Tags like HTML tag names.
        -- TSTagAttribute       { } , -- HTML tag attributes.
        -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
        -- TSText               { } , -- Non-structured text. Like text in a markup language.
        -- TSStrong             { } , -- Text to be represented in bold.
        -- TSEmphasis           { } , -- Text to be represented with emphasis.
        -- TSUnderline          { } , -- Text to be represented with an underline.
        -- TSStrike             { } , -- Strikethrough text.
        -- TSTitle              { } , -- Text that is part of a title.
        -- TSLiteral            { } , -- Literal or verbatim text.
        -- TSURI                { } , -- URIs like hyperlinks or email addresses.
        -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
        -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
        -- TSEnvironment        { } , -- Text environments of markup languages.
        -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        -- TSNote               { } , -- Text representation of an informational note.
        -- TSWarning            { } , -- Text representation of a warning note.
        -- TSDanger             { } , -- Text representation of a danger note.
        -- TSType               { } , -- Type (and class) definitions and annotations.
        -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
        -- TSVariable           { } , -- Variable names that don't fit into other categories.
        -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.

        -- Gitsigns
        GitSignsAdd      { bg = colors.base00, fg = colors.base09 },
        GitSignsChange   { bg = colors.base00, fg = colors.base0A },
        GitSignsDelete   { bg = colors.base00, fg = colors.base08 },
    }
end)

return theme
