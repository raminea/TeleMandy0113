local function run(msg)
if msg.txt=="telemandy" then
 return "⛓TeleMandy its new and Best bot.\n⛓〰〰〰〰〰\n⛓SUDO user: @raminea\n⛓〰〰〰〰〰\n⛓GitHub address: https://github.com/raminea/TeleMandy0113\n⛓〰〰〰〰〰\n⛓SUDO id: 195092846\n⛓〰〰〰〰〰\n⛓Bot number: +13306675180\n⛓〰〰〰〰〰\n⛓Based on: TeleSeed\n⛓〰〰〰〰〰\n⛓Special thanks to Saeed & Ali\n⛓〰〰〰〰〰\n⛓API bot user: @TeleMady_bot\n⛓〰〰〰〰〰\n⛓ https://telegram.me/TeleMandy\n⛓〰〰〰〰〰〰"
end
if msg.tct=="/telemandy" then
 return "⛓TeleMandy its new and Best bot.\n⛓〰〰〰〰〰\n⛓SUDO user: @raminea\n⛓〰〰〰〰〰\n⛓GitHub address: https://github.com/raminea/TeleMandy0113\n⛓〰〰〰〰〰\n⛓SUDO id: 195092846\n⛓〰〰〰〰〰\n⛓Bot number: +13306675180\n⛓〰〰〰〰〰\n⛓Based on: TeleSeed\n⛓〰〰〰〰〰\n⛓Special thanks to Saeed & Ali\n⛓〰〰〰〰〰\n⛓API bot user: @TeleMady_bot\n⛓〰〰〰〰〰\n⛓ https://telegram.me/TeleMandy\n⛓〰〰〰〰〰〰"
end
if msg.txt=="!telemandy" then
 return "⛓TeleMandy its new and Best bot.\n⛓〰〰〰〰〰\n⛓SUDO user: @raminea\n⛓〰〰〰〰〰\n⛓GitHub address: https://github.com/raminea/TeleMandy0113\n⛓〰〰〰〰〰\n⛓SUDO id: 195092846\n⛓〰〰〰〰〰\n⛓Bot number: +13306675180\n⛓〰〰〰〰〰\n⛓Based on: TeleSeed\n⛓〰〰〰〰〰\n⛓Special thanks to Saeed & Ali\n⛓〰〰〰〰〰\n⛓API bot user: @TeleMady_bot\n⛓〰〰〰〰〰\n⛓ https://telegram.me/TeleMandy\n⛓〰〰〰〰〰〰"
 end
 if msg.txt=="ramin" then
  return "با بابام چیکا داری؟"
end
if msg.txt=="رامین" then
 return "با بابام چیکار داری؟"
end
if msg.txt=="@raminea" then
 return "با بابام چیکار داری؟"
end
end
 
 return {
  description = "chat with robot server",
  usage = "chat with robot"
  patterns = {
   "^telemandy$",
   "^(/telemandy)$",
   "^(!telemandy)$",
   "^[Rr]amin$",
   "^رامین$",
   "^(@raminoa)$",
   },
  run = run,
  pre_prcess = pro_process
 }
