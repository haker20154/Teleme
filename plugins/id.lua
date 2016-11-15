do
local username = matches[2]
    local username = username:gsub("@","")
    savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested ID for: @"..username)
    resolve_username(username,  callbackres, cbres_extra)
   else
    userrank = "کاربر معمولی"
    if is_sudo(msg) then
      userrank = "مالک ربات"
    elseif is_admin1(msg) then
      userrank = "مدیر"
    elseif is_owner(msg) then
      userrank = "مالک ابرگروه"
    elseif is_momod(msg) then
      userrank = "ناظر"
    end
    number = "----"
    if msg.from.phone then
     number = "+98"..string.sub(msg.from.phone, 3, 8).."****"
     if string.sub(msg.from.phone, 0,4) == '9891' then
      number = number.."\n🔷simcard : ir-mci"
     elseif string.sub(msg.from.phone, 0,5) == '98932' then
      number = number.."\n🔷simcard : Taliya"
     elseif string.sub(msg.from.phone, 0,4) == '9893' then
      number = number.."\n🔷simcard : Irancell"
     elseif string.sub(msg.from.phone, 0,4) == '9890' then
      number = number.."\n🔷simcard : Irancell"
     elseif string.sub(msg.from.phone, 0,4) == '9892' then
      number = number.."\n🔷simcard : Rightel"
     else
      number = number.."\n🔷simcard : another"
     end
    end
    local user_info = {}
    local uhash = 'user:'..msg.from.id
    local user = redis:hgetall(uhash)
    local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
    user_info.msgs = tonumber(redis:get(um_hash) or 0)
    user_info.msgs = string.gsub(user_info.msgs,'1','1⃣')
    user_info.msgs = string.gsub(user_info.msgs,'2','2⃣')
    user_info.msgs = string.gsub(user_info.msgs,'3','3⃣')
    user_info.msgs = string.gsub(user_info.msgs,'4','4⃣')
    user_info.msgs = string.gsub(user_info.msgs,'5','5⃣')
    user_info.msgs = string.gsub(user_info.msgs,'6','6⃣')
    user_info.msgs = string.gsub(user_info.msgs,'7','7⃣')
    user_info.msgs = string.gsub(user_info.msgs,'8','8⃣')
    user_info.msgs = string.gsub(user_info.msgs,'9','9⃣')
    user_info.msgs = string.gsub(user_info.msgs,'0','0⃣')
    savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup ID")
    local userid = "---"
    if msg.from.username then
     userid = "@"..msg.from.username
    end
    local userlink = ""
    if msg.from.username then
     userlink = "لینک شما : telegram.me/"..msg.from.username
    end
    return "نام : "..(msg.from.first_name or "ندارد").."\nنام خانوادگی : "..(msg.from.last_name or "ندارد").."\nنام کاربری : "..userid.."\nمقام : "..userrank.."\nشناسه کاربری : "..msg.from.id.."\nتعداد پیام ها : \n"..user_info.msgs.."\nنام ابرگروه : "..string.gsub(msg.to.print_name, "_", " ").."\nشناسه ابرگروه : "..msg.to.id.."\n"..userlink
   end
return {
  description = "", 
  usage = "",
  patterns = {
    "^[!/#]id$",
  },
  run = run
}
end
