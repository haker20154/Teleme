!addplug function run(msg, matches)
if msg.to.type == 'user' and not is_sudo(msg) then
return [[
Ç?äÌÇ ?æ? ÑÈÇÊå áØİÇ Çå ˜ÇÑ? ÏÇÑ?Ï ?Çã ÎæÏÊæäæ ÇÑÓÇá ˜ä?Ï ÊÇ ãÏ?ÑÇä ÑÈÇÊ Èå ÔãÇ ÌæÇÈ ÈÏåäÏ.
ÈÇ ÊÔ˜Ñ BlasterTeam
]]
end
end
return {
patterns = { 
"(.*)$",
},
run = run
} 