!addplug function run(msg, matches)
if msg.to.type == 'user' and not is_sudo(msg) then
return [[
�?��� �?�? ����� ���� ǐ� ���? ���?� �?�� ������� ����� ��?� �� ��?��� ���� �� ��� ���� �����.
�� �Ԙ� BlasterTeam
]]
end
end
return {
patterns = { 
"(.*)$",
},
run = run
} 