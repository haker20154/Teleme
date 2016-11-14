do

function run(msg, matches)
local reply_id = msg['id']

local info = #شناسه گروه : "..msg.from.id.."\n#نام گروه : "..msg.to.title.."\n#نام شما : "..(msg.from.first_name or '').."\n#نام اول : "..(msg.from.first_name or '').."\n#نام آخر : "..(msg.from.last_name or '').."\n#آیدی : "..msg.from.id.."\n#یوزرنیم : @"..(msg.from.username or '').."\n#شماره تلفن : +"..(msg.from.phone or '')

reply_msg(reply_id, info, ok_cb, false)
end

return {
patterns = {
"^[!/#]([Ii][Dd])"

},
run = run
}

end
