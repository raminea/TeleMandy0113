do
function run(msg, matches)
local reply_id = msg['id']

local info = '🔺 #نام: '..msg.from.first_name..'\n'
..'🆔 #ایدی : '..msg.from.id..'\n'
..'🔹 #نام کاربری: @'..msg.from.username..'\n\n'
..'🔸 #ایدی گروه: '..msg.to.id..'\n'
..'🔻 #نام گروه: '..msg.to.title

reply_msg(reply_id, info, ok_cb, false)
end

return {
patterns = {
"^[/#!]([Ii]nfome"

},
run = run
}

end

