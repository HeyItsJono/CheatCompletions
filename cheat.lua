-- Must obviously have Cheat (https://github.com/cheat/cheat) installed and available in PATH.
-- Run a subprocess of 'cheat -l', errors suppressed. This lists all available cheatsheets. Then use gsub to isolate the 'title' column and drop the headers row. Return list of cheatsheet names.
local function get_cheats()
    local cheats = {}
	local cheatlist = io.popen('2>nul cheat -l')
    
    if cheatlist then
        for line in cheatlist:lines() do
        	line = line:gsub(' .*',''):gsub('title:.*','')
            if line ~= '' then
            	table.insert(cheats, line)
            end
        end
        cheatlist:close()
    end

    return cheats
end

clink.argmatcher("cheat")
:addflags("-a", "--all", "-c", "--colorize", "-d", "--directories", "-e", "--edit=", "-l", "--list", "-p", "--path=", "-r", "--regex", "-s", "--search=", "-t", "--tag=", "-T", "--tags", "-v", "--version", "--init", "--rm=")
:addarg({get_cheats})
:nofiles()
:adddescriptions(
	{"--init",									description = "Write a default config file to stdout"},
	{"-a", "--all",								description = "Search among all cheatpaths"},
	{"-c", "--colorize",						description = "Colorize output"},
	{"-d", "--directories",						description = "List cheatsheet directories"},
	{"-e", "--edit=",							description = "Edit <cheatsheet>"},
	{"-l", "--list",							description = "List cheatsheets"},
	{"-p", "--path=",        					description = "Return only sheets found on cheatpath <name>"},
	{"-r", "--regex",              				description = "Treat search <phrase> as a regex"},
	{"-s", "--search=",    						description = "Search cheatsheets for <phrase>"},
	{"-t", "--tag=",          					description = "Return only sheets matching <tag>"},
	{"-T", "--tags",               				description = "List all tags in use"},
	{"-v", "--version",            				description = "Print the version number"},
	{"--rm=",       							description = "Remove (delete) <cheatsheet>"}
)