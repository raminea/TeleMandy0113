do

function run(msg, matches)
local reply_id = msg['id']
local text = 'سلام باباجونم😋😊'
if matches[1] == 'سلام پسرم' or 'سلام دوستان' or 'سلام' or 'slm' then
    if is_sudo(msg) then
reply_msg(reply_id, text, ok_cb, false)
end
end 
end
return {
patterns = {
    "^سلام پسرم$",
    "^سلام دوستان$",
    "^سلام$",
    "^slm$"
},
run = run
}

end


