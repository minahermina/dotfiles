vim.cmd('highlight clear')
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd('syntax reset')
end

vim.o.background = "dark"
vim.g.colors_name = "gruber"

local colors = {
	black     = {"#070707", 234},
	brown     = {"#af875f", 137},
	blue      = {"#6D8AA8", 235},
	lgreen    = {"#afd7af", 113},
	red       = {"#F38BA8", 203},
	-- white     = {"#F8F8FF", 254},
	white     = {"#DEDEDE", 254},
	non       = {"#777777", 100},
	comment   = {"#6D6E85", 201},
	gray      = {"#727272", 241},
	variable  = {"#F9E2AF", 176},
	yellow    = {"#FADF0F", 177},
	green     = {"#9f9f9f", 178},
	lolo      = {"#222222", 180},
}

local function hl(group, attrs)
	local command = {"highlight", group}
	if attrs.fg then
		table.insert(command, "guifg=" .. attrs.fg[1])
		table.insert(command, "ctermfg=" .. attrs.fg[2])
	end
	if attrs.bg then
		table.insert(command, "guibg=" .. attrs.bg[1])
		table.insert(command, "ctermbg=" .. attrs.bg[2])
	end
	if attrs.style then
		table.insert(command, "gui=" .. attrs.style)
		table.insert(command, "cterm=" .. attrs.style)
	end
	vim.cmd(table.concat(command, " "))
end

hl("CursorLine",    {bg = colors.lolo})
hl("ColorColumn",   {bg = colors.gray})
hl("Comment",       {fg = colors.comment})
hl("Constant",      {fg = colors.white, style = "bold"})
hl("DiffAdd",       {fg = colors.lgreen})
-- hl("DiffChange",    {fg = colors.white})
hl("DiffDelete",    {fg = colors.red})
hl("DiffText",      {fg = colors.white, style = "underline"})
hl("Directory",     {fg = colors.white})
hl("EndOfBuffer",   {fg = colors.black})
hl("Error",         {fg = colors.red})
hl("ErrorMsg",      {fg = colors.red})
hl("FoldColumn",    {fg = colors.brown, bg = colors.gray})
hl("Folded",        {fg = colors.brown, bg = colors.black, style = "italic"})
hl("Function",      {fg = colors.white, style = "bold"})
hl("identifier",    {fg = colors.white, style = "bold"})
hl("Ignore",        {fg = colors.black})
hl("MatchParen",    {fg = colors.gray, style = "bold"})
hl("MoreMsg",       {fg = colors.lgreen})
hl("NonText",       {fg = colors.white})
hl("Normal",        {fg = colors.white, bg = colors.black, style = "bold"})
hl("Pmenu",         {fg = colors.white, bg = colors.black, style = "bold"})
hl("PmenuSbar",     {bg = colors.black})
hl("PmenuThump",    {bg = colors.gray})
hl("PmenuSel",      {fg = colors.black, bg = colors.gray, style = "bold"})
hl("PreProc",       {fg = colors.blue})
hl("Question",      {fg = colors.white})
hl("Special",       {fg = colors.gray, style = "bold" })
hl("SpecialChar",   {fg = colors.gray, style = "bold"})
hl("SpecialComment",{fg = colors.brown})
hl("SpecialKey",    {fg = colors.white, style = "bold"})
hl("SpellBad",      {fg = colors.red, style = "underline"})
hl("SpellCap",      {fg = colors.white, style = "underline"})
hl("SpellLocal",    {fg = colors.gray, style = "underline"})
hl("SpellRare",     {style = "underline"})
hl("Statement",     {fg = colors.gray, style = "bold"})
hl("Keyword",       {fg = colors.gray, style = "bold"})
hl("StatusLine",    {fg = colors.white, bg = colors.black, style = "bold"})
hl("StatusLineNC",  {fg = colors.white, bg = colors.black})
hl("String",        {fg = colors.lgreen})
hl("Title",         {fg = colors.white, style = "bold"})
hl("IncSearch",     {fg = colors.black , bg = colors.gray})
hl("Todo",          {fg = colors.brown, style = "italic"})
hl("Type",          {fg = colors.gray, style = "bold"})
hl("Typedef",       {fg = colors.gray, style = "bold"})
hl("StorageClass",  {fg = colors.gray, style = "bold"})
hl("Structure",     {fg = colors.gray, style = "bold"})
hl("CursorLineNr",  {fg = colors.white})
hl("LIneNr",        {fg = colors.non})
hl("Underlined",    {style = "underline"})
hl("VertSplit",     {fg = colors.gray})
hl("WarningMsg",    {fg = colors.red})
hl("WildMenu",      {fg = colors.black, bg = colors.gray, style = "bold"})
hl("diffAdded",     {fg = colors.lgreen})
hl("diffRemoved",   {fg = colors.red})
hl("diffSubname",   {fg = colors.white})
hl("NonText",       { fg = colors.lolo})

-- Compile-mode nvim  plugin
hl("CompileModeError",          { fg = colors.red, style = "bold"})
hl("CompileModeWarning",        { fg = colors.variable, style = "bold"})
hl("CompileModeInfo",           { fg = colors.lgreen, style = "bold"})
hl("CompileModeMessageRow",     { fg = colors.gray, style = "bold"})
hl("CompileModeMessageCol",     { fg = colors.gray, style = "bold"})
hl("CompileModeOutputFile",     { fg = colors.gray, style = "bold"})
hl("CompileModeCommandOutput",  { fg = colors.gray, style = "bold"})

