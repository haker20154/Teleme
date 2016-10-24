local function callback_reply(extra, success, result)

	userrank = "Member"
	if is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
	elseif is_admin(result) then
		userrank = "Admin ⭐⭐⭐"
	elseif tonumber(result.from.id) == tonumber(gp_leader) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"./icons/6.webp", ok_cb, false)
	elseif is_momod(result) then
		userrank = "Moderator ⭐"
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
		end
	end
end

local function run(msg, matches)
local info = "Your Info🖇\n
Your Full Name: "..msg.from.print_name .."\n
Your First Name: "..(msg.from.first_name or "-----").."\n
Your Last Name: "..(msg.from.last_name or "-----").."\n
Your User Name: @"..msg.from.username.."\n
Your id : "..msg.from.id.." \n
Your Phone : "..msg.from.phone.." \n
Your Messages : "..user_info.msgs.." \n
Your Rank : "..userrank.." \n
Group Info📍\n
GP Nmae: "..msg.to.print_name.."\n
GP Id : "..msg.to.id.."\n
Another Info🔍\n
You Send This Word : "..msg.text.."\n
Your Msg Type : "..msg.type.." \n
Message Id : "..msg.id.."\n
Plugin Writer Info🚨\n
Name : S.Mikail\n
Id: 195651268\n
UserName: @MLsix\n
Phone: +989396290217\n
Channel: @PluginLua"

if matches[1] == "info" then
return info
end
end

return {
patterns = {
 "^[!/#](info)$",
},
 run = run
}
