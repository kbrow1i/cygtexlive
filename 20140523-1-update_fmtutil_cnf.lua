#! /usr/bin/env texlua

--[[
The script must be run as "texlua", not as "/usr/bin/texlua", or else
the shebang line is not ignored.
--]]

conf_dir = "/etc/texmf/web2c/"
assert(lfs.chdir(conf_dir))
conf_file = "fmtutil.cnf"
marker_file = ".20140523-1-fmtutil_cnf_updated"
if lfs.isfile(marker_file) then
   os.exit()
end

local f = assert(io.open(marker_file, "w"))
f:write("")
f:close()

if not lfs.isfile(conf_file) then
   os.exit()
end

new_name = conf_file .. ".bak"
assert(os.rename(conf_file, new_name))

f = assert(io.open(new_name, "r"))
for line in f:lines() do
   local fmt = string.match(line, "^%a+")
   if fmt then
      os.execute("fmtutil-sys --enablefmt " .. fmt)
   end
end
f:close()
