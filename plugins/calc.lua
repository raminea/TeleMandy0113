local function mathjs(exp)
  local url = 'http://api.mathjs.org/v1/'
  url = url..'?expr='..URL.escape(exp)
  local b,c = http.request(url)
  local text = nil
  if c == 200 then
    text = '= '..b
  
  elseif c == 400 then
    text = b
  else
    text = 'error!'
  end
  return text
end

local function run(msg, matches)
  return mathjs(matches[1])
end

return {
description = "commands: / and * and ^ and + and -",
 usage = {
  "/calc (Formula) : Calculate a Formula",
  "calc (Formula) : Calculate a Formula",
 },
  patterns = {
	"^[!/#](calc) (.*)$"
  },
  run = run
}
