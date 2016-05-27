local function callback_reply(extra, success, result)
	--icon & rank ------------------------------------------------------------------------------------------------
	userrank = "Member"
	if tonumber(result.from.id) == 195092846 then
		userrank = "Master ⭐⭐⭐⭐"
	نام	send_document(org_chat_id,"umbrella/stickers/master.webp", ok_cb, false)
	elseif is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/sudo.webp", ok_cb, false)
	elseif is_admin2(result.from.id) then
		userrank = "Admin ⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/admin.webp", ok_cb, false)
	elseif is_owner2(result.from.id, result.to.id) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/leader.webp", ok_cb, false)
	elseif is_momod2(result.from.id, result.to.id) then
		userrank = "Moderator ⭐"
		send_document(org_chat_id,"umbrella/stickers/mod.webp", ok_cb, false)
	elseif tonumber(result.from.id) == tonumber(our_id) then
		userrank = "TeleMandy ⭐⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/umb.webp", ok_cb, false)
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
			send_document(org_chat_id,"umbrella/stickers/api.webp", ok_cb, false)
		end
	end
	--custom rank ------------------------------------------------------------------------------------------------
	local file = io.open("./info/"..result.from.id..".txt", "r")
	if file ~= nil then
		usertype = file:read("*all")
	else
		usertype = "-----"
	end
	--cont ------------------------------------------------------------------------------------------------
	local user_info = {}
	local uhash = 'user:'..result.from.id
	local user = redis:hgetall(uhash)
	local um_hash = 'msgs:'..result.from.id..':'..result.to.id
	user_info.msgs = tonumber(redis:get(um_hash) or 0)
	--msg type ------------------------------------------------------------------------------------------------
	if result.media then
		if result.media.type == "document" then
			if result.media.text then
				msg_type = "sticker"
			else
				msg_type = "other files "
			end
		elseif result.media.type == "photo" then
			msg_type = "photo file "
		elseif result.media.type == "video" then
			msg_type = "video file "
		elseif result.media.type == "audio" then
			msg_type = "audio file"
		elseif result.media.type == "geo" then
			msg_type = "location"
		elseif result.media.type == "contact" then
			msg_type = "phone number "
		elseif result.media.type == "file" then
			msg_type = "file"
		elseif result.media.type == "webpage" then
			msg_type = "Preview Site" 
		elseif result.media.type == "unsupported" then
			msg_type = "moving file "
		else
			msg_type = "unknows"
		end
	elseif result.text then
		if string.match(result.text, '^%d+$') then
			msg_type = "number"
		elseif string.match(result.text, '%d+') then
			msg_type = "Including numbers and letters"
		elseif string.match(result.text, '^@') then
			msg_type = "user_name"
		elseif string.match(result.text, '@') then
			msg_type = "Including username"
		elseif string.match(result.text, '[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]') then
			msg_type = "telegram link"
		elseif string.match(result.text, '[Hh][Tt][Tt][Pp]') then
			msg_type = "site link"
		elseif string.match(result.text, '[Ww][Ww][Ww]') then
			msg_type = "site link "
		elseif string.match(result.text, '?') then
			msg_type = "question"
		else
			msg_type = "text"
		end
	end
	--hardware ------------------------------------------------------------------------------------------------
	if result.text then
		inputtext = string.sub(result.text, 0,1)
		if result.text then
			if string.match(inputtext, "[a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z]") then
				hardware = "computer"
			elseif string.match(inputtext, "[A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z]") then
				hardware = "mobile"
			else
				hardware = "-----"
			end
		else
			hardware = "-----"
		end
	else
		hardware = "-----"
	end
	--phone ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.from.phone then
			number = "0"..string.sub(result.from.phone, 3)
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\ncountry:islamic republic of iran"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nType of sim card: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\ntype of sim card: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nType of sim card: رایتل"
				else
					number = number.."\nType of sim card: others"
				end
			else
				number = number.."\ncountry: out\nType of sim card:other"
			end
		else
			number = "-----"
		end
	elseif access == 0 then
		if result.from.phone then
			number = "you do not may"      
			if string.sub(result.from.phone, 0,2) == '98' then
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\ncountry:islamic republic of iran"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nType of sim card: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\ntype of sim card: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nType of sim card: رایتل"
				else
					number = number.."\nType of sim card: others"
				end
			else
				number = number.."\ncountry: out\nType of sim card:other"
			end
		else
			number = "-----"
		end
	end
	--info ------------------------------------------------------------------------------------------------
	info = "🎊🎈🎊🎈🎊🎈🎊🎈🎊🎈\n"
		.." ⬇️your info⬇️\n"
	        .." 🔹full_name : "..string.gsub(msg.from.print_name, "_", " ").."\n"
		.." 🔸firs_name : "..(msg.from.first_name or "-----").."\n"
		.." 🔹last_name : "..(msg.from.last_name or "-----").."\n"
		.." 🔸phone_number "..number.."\n"
		.." 🔹user_name: @"..(msg.from.username or "-----").."\n"
		.." 🔸ID : "..msg.from.id.."\n"
		.." 🔹rank type: "..usertype.."\n"
		.." 🔸rank: "..userrank.."\n"
		.." 🔹Interface : "..hardware.."\n"
		.." 🔸The number of messages : "..user_info.msgs.."\n"
		.." 🔹group_name: "..string.gsub(msg.to.print_name, "_", " ").."\n"
                .." 🔸group_ID: "..msg.to.id
	send_large_msg(org_chat_id, info)
end

local function callback_res(extra, success, result)
	if success == 0 then
		return send_large_msg(org_chat_id, "یوزرنیم وارد شده اشتباه است")
	end
	--icon & rank ------------------------------------------------------------------------------------------------
	if tonumber(result.id) == 195092846 then
		userrank = "Master ⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/master.webp", ok_cb, false)
	elseif is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/sudo.webp", ok_cb, false)
	elseif is_admin2(result.id) then
		userrank = "Admin ⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/admin.webp", ok_cb, false)
	elseif is_owner2(result.id, extra.chat2) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/leader.webp", ok_cb, false)
	elseif is_momod2(result.id, extra.chat2) then
		userrank = "Moderator ⭐"
		send_document(org_chat_id,"umbrella/stickers/mod.webp", ok_cb, false)
	elseif tonumber(result.id) == tonumber(our_id) then
		userrank = "Umbrella-Cp ⭐⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/umb.webp", ok_cb, false)
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
			send_document(org_chat_id,"umbrella/stickers/api.webp", ok_cb, false)
	else
		userrank = "Member"
	end
	end
	--custom rank ------------------------------------------------------------------------------------------------
	local file = io.open("./info/"..result.id..".txt", "r")
	if file ~= nil then
		usertype = file:read("*all")
	else
		usertype = "-----"
	end
	--phone ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.from.phone then
			number = "0"..string.sub(result.from.phone, 3)
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\ncountry:islamic republic of iran"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nType of sim card: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\ntype of sim card: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nType of sim card: رایتل"
				else
					number = number.."\nType of sim card: others"
				end
			else
				number = number.."\ncountry: out\nType of sim card:other"
			end
		else
			number = "-----"
		end
	elseif access == 0 then
		if result.from.phone then
			number = "you do not may"      
			if string.sub(result.from.phone, 0,2) == '98' then
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\ncountry:islamic republic of iran"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nType of sim card: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\ntype of sim card: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nType of sim card: رایتل"
				else
					number = number.."\nType of sim card: others"
				end
			else
				number = number.."\ncountry: out\nType of sim card:other"
			end
		else
			number = "-----"
		end
	end
	--info ------------------------------------------------------------------------------------------------
	info = "🎊🎈🎊🎈🎊🎈🎊🎈🎊🎈\n"
		.." ⬇️your info⬇️\n"
	        .." 🔹full_name : "..string.gsub(msg.from.print_name, "_", " ").."\n"
		.." 🔸firs_name : "..(msg.from.first_name or "-----").."\n"
		.." 🔹last_name : "..(msg.from.last_name or "-----").."\n"
		.." 🔸phone_number "..number.."\n"
		.." 🔹user_name: @"..(msg.from.username or "-----").."\n"
		.." 🔸ID : "..msg.from.id.."\n"
		.." 🔹rank type: "..usertype.."\n"
		.." 🔸rank: "..userrank.."\n"
		.." 🔹Interface : "..hardware.."\n"
		.." 🔸The number of messages : "..user_info.msgs.."\n"
		.." 🔹group_name: "..string.gsub(msg.to.print_name, "_", " ").."\n"
                .." 🔸group_ID: "..msg.to.id.."
	send_large_msg(org_chat_id, info)
end

local function callback_info(extra, success, result)
	if success == 0 then
		return send_large_msg(org_chat_id, "آی دی وارد شده اشتباه است")
	end
	--icon & rank ------------------------------------------------------------------------------------------------
	if tonumber(result.id) == 195092846 then
		userrank = "Master ⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/master.webp", ok_cb, false)
	elseif is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/sudo.webp", ok_cb, false)
	elseif is_admin2(result.id) then
		userrank = "Admin ⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/admin.webp", ok_cb, false)
	elseif is_owner2(result.id, extra.chat2) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/leader.webp", ok_cb, false)
	elseif is_momod2(result.id, extra.chat2) then
		userrank = "Moderator ⭐"
		send_document(org_chat_id,"umbrella/stickers/mod.webp", ok_cb, false)
	elseif tonumber(result.id) == tonumber(our_id) then
		userrank = "Umbrella-Cp ⭐⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/umb.webp", ok_cb, false)
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
			send_document(org_chat_id,"umbrella/stickers/api.webp", ok_cb, false)
	else
		userrank = "Member"
	end
	end
	--custom rank ------------------------------------------------------------------------------------------------
	local file = io.open("./info/"..result.id..".txt", "r")
	if file ~= nil then
		usertype = file:read("*all")
	else
		usertype = "-----"
	end
	--phone ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.from.phone then
			number = "0"..string.sub(result.from.phone, 3)
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\ncountry:islamic republic of iran"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nType of sim card: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\ntype of sim card: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nType of sim card: رایتل"
				else
					number = number.."\nType of sim card: others"
				end
			else
				number = number.."\ncountry: out\nType of sim card:other"
			end
		else
			number = "-----"
		end
	elseif access == 0 then
		if result.from.phone then
			number = "you do not may"      
			if string.sub(result.from.phone, 0,2) == '98' then
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\ncountry:islamic republic of iran"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nType of sim card: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\ntype of sim card: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nType of sim card: رایتل"
				else
					number = number.."\nType of sim card: others"
				end
			else
				number = number.."\ncountry: out\nType of sim card:other"
			end
		else
			number = "-----"
		end
	end
	--name ------------------------------------------------------------------------------------------------
	if string.len(result.print_name) > 15 then
		fullname = string.sub(result.print_name, 0,15).."..."
	else
		fullname = result.print_name
	end
	if result.first_name then
		if string.len(result.first_name) > 15 then
			firstname = string.sub(result.first_name, 0,15).."..."
		else
			firstname = result.first_name
		end
	else
		firstname = "-----"
	end
	if result.last_name then
		if string.len(result.last_name) > 15 then
			lastname = string.sub(result.last_name, 0,15).."..."
		else
			lastname = result.last_name
		end
	else
		lastname = "-----"
	end
	--info ------------------------------------------------------------------------------------------------
	info = "🎊🎈🎊🎈🎊🎈🎊🎈🎊🎈\n"
		.." ⬇️your info⬇️\n"
	        .." 🔹full_name : "..string.gsub(msg.from.print_name, "_", " ").."\n"
		.." 🔸firs_name : "..(msg.from.first_name or "-----").."\n"
		.." 🔹last_name : "..(msg.from.last_name or "-----").."\n"
		.." 🔸phone_number "..number.."\n"
		.." 🔹user_name: @"..(msg.from.username or "-----").."\n"
		.." 🔸ID : "..msg.from.id.."\n"
		.." 🔹rank type: "..usertype.."\n"
		.." 🔸rank: "..userrank.."\n"
		.." 🔹Interface : "..hardware.."\n"
		.." 🔸The number of messages : "..user_info.msgs.."\n"
		.." 🔹group_name: "..string.gsub(msg.to.print_name, "_", " ").."\n"
                .." 🔸group_ID: "..msg.to.id.."
	send_large_msg(org_chat_id, info)
end

local function run(msg, matches)
	local data = load_data(_config.moderation.data)
	org_chat_id = "chat#id"..msg.to.id
	if is_sudo(msg) then
		access = 1
	else
		access = 0
	end
	if matches[1] == '/infodel' and is_sudo(msg) then
		azlemagham = io.popen('rm ./info/'..matches[2]..'.txt'):read('*all')
		return 'Was removed from his position✅'
	elseif matches[1] == '/info' and is_sudo(msg) then
		local name = string.sub(matches[2], 1, 50)
		local text = string.sub(matches[3], 1, 10000000000)
		local file = io.open("./info/"..name..".txt", "w")
		file:write(text)
		file:flush()
		file:close() 
		return "rank saved✅"
	elseif #matches == 2 then
		local cbres_extra = {chatid = msg.to.id}
		if string.match(matches[2], '^%d+$') then
			return user_info('user#id'..matches[2], callback_info, cbres_extra)
		else
			return res_user(matches[2]:gsub("@",""), callback_res, cbres_extra)
		end
	else
		--custom rank ------------------------------------------------------------------------------------------------
		local file = io.open("./info/"..msg.from.id..".txt", "r")
		if file ~= nil then
			usertype = file:read("*all")
		else
			usertype = "-----"
		end
		--hardware ------------------------------------------------------------------------------------------------
		if matches[1] == "info" then
			hardware = "computer"
		else
			hardware = "mobile"
		end
		if not msg.reply_id then
			--contor ------------------------------------------------------------------------------------------------
			local user_info = {}
			local uhash = 'user:'..msg.from.id
			local user = redis:hgetall(uhash)
			local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
			user_info.msgs = tonumber(redis:get(um_hash) or 0)
			--icon & rank ------------------------------------------------------------------------------------------------
			if tonumber(msg.from.id) == 195092846 then
				userrank = "Master ⭐⭐⭐⭐"
				send_document("chat#id"..msg.to.id,"umbrella/stickers/master.webp", ok_cb, false)
			elseif is_sudo(msg) then
				userrank = "Sudo ⭐⭐⭐⭐⭐"
				send_document("chat#id"..msg.to.id,"umbrella/stickers/sudo.webp", ok_cb, false)
			elseif is_admin(msg) then
				userrank = "Admin ⭐⭐⭐"
				send_document("chat#id"..msg.to.id,"umbrella/stickers/admin.webp", ok_cb, false)
			elseif is_owner(msg) then
				userrank = "Leader ⭐⭐"
				send_document("chat#id"..msg.to.id,"umbrella/stickers/leader.webp", ok_cb, false)
			elseif is_momod(msg) then
				userrank = "Moderator ⭐"
				send_document("chat#id"..msg.to.id,"umbrella/stickers/mod.webp", ok_cb, false)
			else
				userrank = "Member"
			end
			--number ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.from.phone then
			number = "0"..string.sub(result.from.phone, 3)
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\ncountry:islamic republic of iran"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nType of sim card: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\ntype of sim card: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nType of sim card: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nType of sim card: رایتل"
				else
					number = number.."\nType of sim card: others"
				end
			else
				number = number.."\ncountry: out\nType of sim card:other"
			end
		else
			number = "-----"
		end
			--info ------------------------------------------------------------------------------------------------
			local info = "🎊🎈🎊🎈🎊🎈🎊🎈🎊🎈\n"
			                .." ⬇️your info⬇️\n"
			                .." 🔹full_name : "..string.gsub(msg.from.print_name, "_", " ").."\n"
					.." 🔸firs_name : "..(msg.from.first_name or "-----").."\n"
					.." 🔹last_name : "..(msg.from.last_name or "-----").."\n"
					.." 🔸phone_number "..number.."\n"
					.." 🔹user_name: @"..(msg.from.username or "-----").."\n"
					.." 🔸ID : "..msg.from.id.."\n"
					.." 🔹rank type: "..usertype.."\n"
					.." 🔸rank: "..userrank.."\n"
					.." 🔹Interface : "..hardware.."\n"
					.." 🔸The number of messages : "..user_info.msgs.."\n"
					.." 🔹group_name: "..string.gsub(msg.to.print_name, "_", " ").."\n"
					.." 🔸group_ID: "..msg.to.id.."
			return info
		else
			get_message(msg.reply_id, callback_reply, false)
		end
	end
end

return {
	description = "User Infomation",
	usagehtm = '<tr><td align="center">info</td><td align="right">Complete information Rajbh you, who are in and the authorities with information Rply a person can also see </ td> </ tr> '
	..'<tr><td align="center">/info The ID </td><td align="right">Granting authority to the persons current main positions</td></tr>',
	..'<tr><td align="center">/infodel id</td><td align="right">Remove authority granted</td></tr>',
	usage = {
		user = {
			"info: your info",
			"info (reply):  Granting others",
			},
		sudo = {
			"/info (id) (txt) : set rank",
			"/infodel : delet rank",
			},
		},
	patterns = {
		"^(/infodel) (.*)$",
		"^(/info) ([^%s]+) (.*)$",
		"^([Ii]nfo) (.*)$",
		"^(info)$",
		"^(Info)$",
	},
	run = run,
}
