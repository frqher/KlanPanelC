function data()

	local time = getRealTime()
	return time.monthday.."/"..time.month + 1 .."/"..time.year + 1900
end


addEventHandler("onResourceStop", resourceRoot,
function()
	for i, player in ipairs(getElementsByType("player")) do
		setElementData(player, "Group", false)
		setElementData(player, "GroupRank", false)
	end
end)

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

gChatSpam = {}

-- function onGroupChat(player,_,...)
	-- local group = getElementData(player, "Group")
	-- if getElementData(player,"GroupMute") == "True" then outputChatBox("Klan: susturuldunuz",player,255,160,0) return end
	-- if isPlayerMuted(player) then outputChatBox("Klan:Susturuldunuz",player,255,160,0) return end
	-- if group then
		-- if not gChatSpam[player] then
			-- gChatSpam[player] = 0
			-- setTimer(function(player) gChatSpam[player] = nil end, 5000, 1, player)
		-- end
		-- if gChatSpam[player] == 3 then
			-- outputChatBox("*** Spam yapmayın! ***", player, 255, 0, 0)
		-- else
			-- gChatSpam[player] = gChatSpam[player] + 1
			-- local msg = table.concat({...}, " ")
			-- local nick = getPlayerName(player)
			-- local re, ge, be = getPlayerNametagColor(player)
			-- local color = string.format("#%02X%02X%02X", re, ge, be)
			-- local rank = getPlayerGroupRank(player)
			-- local CO = getGroupChatColor(group)
			-- local r, g, b = CO[1], CO[2], CO[3]
			-- local msgc = string.format("#%02X%02X%02X", r, g, b)
			-- local tagc = getGroupChatTagColor(group)
			-- local rt, gt, bt = tagc[1], tagc[2], tagc[3]
			-- local tagcolor = string.format("#%02X%02X%02X", rt, gt, bt)
			-- outputServerLog("(Group) ("..group..") [ ".. rank .. " ] " ..nick..": "..msg)
			-- for _,v in ipairs(getElementsByType("player")) do
				-- if getElementData(v ,"Group") == group then
					-- outputChatBox("(Klan) "..tagcolor.. "["..rank.."] "..color..""..nick.." : "..msgc..""..msg, v, 255, 255, 255, true)
					-- if getGroupFounderAccount(group) == getAccountName(getPlayerAccount(player)) then
						-- playSoundFrontEnd(v, 40)
					-- end
				-- end
			-- end
		-- end
	-- end
-- end
-- addCommandHandler("GroupChat",onGroupChat)

function onCreateGroup(name)
	if getPlayerGroup(source) then
		exports.GTIhud:dm("(Klan) Zaten klanın var.", source,255, 40, 0,true)
	elseif (getPlayerMoney(source) or 0) < 0 then
		exports.GTIhud:dm("(Klan) Klanı oluşturmak için 10.000$ sahip olmalısınız.",source, 255, 20, 0,true)
	elseif isHasSpace(name) then
		exports.GTIhud:dm("(Klan) Klan isminde boşluk kullanamazsınız.",source, 255, 40, 0,true)
	elseif not isASCII(name) then
		exports.GTIhud:dm("(Klan) Klan isminde sadece ingilizce harfler kullanılabilir.",source, 255, 40, 0,true)
	else
		CreateGroup(source, name)
	end
end
addEvent("Create_Group", true)
addEventHandler("Create_Group", root, onCreateGroup)

function isASCII(text)
    for i = 1, #text do
        local byte = text:byte(i)
        if(byte < 33 or byte > 126)then
            return false
        end
    end
    return true
end

function isHasSpace(text)
    for i = 1, #text do
        local byte = text:byte(i)
        if(byte == 32)then
            return true
        end
    end
    return false
end

local Ranks_Table = {
	{"Deneme", ""},
	{"Onbaşı", ""},
	{"Çavuş", "6"},
	{"UzmanOnbaşı", "1, 2, 3, 5, 6, 8, 16"},
	{"Lider", "1, 2, 3, 4, 5, 6, 8, 10, 11, 14, 16, 19, 22"},
	{"Kurucu", "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23"}
}

function CreateGroup(player, name)
	if not IsGroupExists(name) then
		local name = string.gsub (name, "#%x%x%x%x%x%x", "")
		local data = data()
		local playerName = getPlayerName(player)
		local accountName = getAccountName(getPlayerAccount(player))
		local color = math.random(255)..", "..math.random(255)..", "..math.random(255)
		dbExec(db, "INSERT INTO groups VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", name, 1, 100, "Burayı doldurun.", 0, color, color, color, accountName, 0, 10)
		for i, R in ipairs(Ranks_Table) do
			if R[1] == "Kurucu" then
				dbExec(db, "INSERT INTO group_ranks VALUES(?, ?, ?, ?)", name, R[1], R[2], 1)
			elseif R[1] == "Deneme" then
				dbExec(db, "INSERT INTO group_ranks VALUES(?, ?, ?, ?)", name, R[1], R[2], 2)
			else
				dbExec(db, "INSERT INTO group_ranks VALUES(?, ?, ?, ?)", name, R[1], R[2], 3)
			end
		end
		ss = getPlayerMoney(source)
		if ss >= 100000 then
		dbExec(db, "INSERT INTO group_members VALUES(?, ?, ?, ?, ?, ?, ?)", name, accountName, playerName, "Yes", "Kurucu", data, 0)
		setElementData(player, "Group", name)
		setElementData(player, "GroupRank", {getGroupRanks(name), getPlayerGroupRank(player)})
		exports.GTIhud:dm("(Klan) "..name.." başarıyla oluşturuldu.",player, 0, 255, 0, true)
		groupAddNewHistoryLog ( name, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu klanı oluşturdu.")
		takePlayerMoney ( source, 100000 )
	else
	exports.GTIhud:dm("(Klan) Klanı oluşturmak için yeterli paranız yok !", player, 255, 0, 0,true)
	end
	else
		exports.GTIhud:dm("(Klan) "..name.." adlı klan zaten var.", player,255, 0, 0,true)
	end
end

addCommandHandler("tagrenk",
function (player, cmd, r, g, b)
	local Group = getElementData(player, "Group")
	local r = tonumber(r)
	local g = tonumber(g)
	local b = tonumber(b)
	if Group then
		if doesPlayerHavePermission(player, 13) then
			if r and g and b then
				if r <= 255 and r >= 0 and g <= 255 and g >= 0 and b <= 255 and b >= 0 then
					local color = r..", "..g..", "..b
					dbExec(db, "UPDATE groups SET tag_color = ? WHERE group_name = ?", color, Group)
					exports.GTIhud:dm("[Klan] "..string.format("#%.2X%.2X%.2X", r, g, b).."Tag rengi başarıyla değiştirildi.",player, r, g, b,true)
					groupAddNewHistoryLog ( Group, "("..getPlayerName( player )..")["..getAccountName(getPlayerAccount(player)).."] adlı oyuncu Tag rengini değiştirdi. Renk kodu -  "..r.." , "..g.." , "..b)
				else
					exports.GTIhud:dm("[Klan] 0-255 Arası bir sayı olmalıdır.", player,255, 255, 0,true)
				end
				else
				exports.GTIhud:dm("[Klan] Sözdizimi: /tagrenk [r] [g] [b]",player, 255, 255, 0,true)
				exports.GTIhud:dm("[Klan] Örnek: /tagrenk 255 0 0", player,0, 250, 150,true)
			end
		else
			exports.GTIhud:dm("[Klan] Tag rengini değiştirme izniniz yok.",player, 255, 0, 0,true)
		end
	end
end
)

addCommandHandler("sohbetrenk",
function(player, cmd, r, g, b)
	local Group = getElementData(player, "Group")
	local r = tonumber(r)
	local g = tonumber(g)
	local b = tonumber(b)
	if Group then
		if doesPlayerHavePermission(player, 13) then
			if r and g and b then
				if r <= 255 and r >= 0 and g <= 255 and g >= 0 and b <= 255 and b >= 0 then
					local color = r..", "..g..", "..b
					dbExec(db, "UPDATE groups SET chat_color = ? WHERE group_name = ?", color, Group)
					exports.GTIhud:dm("[Klan] "..string.format("#%.2X%.2X%.2X", r, g, b).."Sohbet rengi başarıyla değiştirildi.",player, r, g, b,true)
					groupAddNewHistoryLog(Group, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu Sohbet rengini değiştirdi. Renk kodu - "..r.." , "..g.. " , "..b.."")
				else
					exports.GTIhud:dm("[Klan]  0-255 Arası bir sayı olmalıdır.",player, 255, 255, 0,true)
				end
				else
				exports.GTIhud:dm("[Klan] Sözdizimi: /sohbetrenk [r] [g] [b]",player, 255, 255, 0,true)
				exports.GTIhud:dm("[Klan] Örnek: /sohbetrenk 255 0 0",player, 0, 250, 150,true)
			end
		else
			exports.GTIhud:dm("[Klan] Sohbet rengini değiştirme izniniz yok.",player, 255, 0, 0,true)
		end
	end
end
)


addEvent("KlanKapasite", true)
addEventHandler("KlanKapasite", root, function(sayi, para)
	if getPlayerMoney(source) >= para then
	takePlayerMoney(source, para)
	local Group = getElementData(source, "Group")
	local result  = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, group_owner FROM groups"), -1)
	GroupTotal = 0
	MemberTotal = 0
	for i, group in pairs(result) do
		GroupTotal = GroupTotal + 1
		MemberTotal = MemberTotal + group["members_limit"]
	end
	dbExec(db, "UPDATE groups SET members_limit = ? WHERE group_name = ?", sayi+MemberTotal, Group)
	else
		exports.GTIhud:dm("[Klan] Klan kapasitesini arttıracak paran yok.",source, 255, 0, 0,true)
	end
end)

turfTimer = {}

addCommandHandler("turfrenk",
function(player, cmd, r, g, b)
	if not turfTimer[player] then
		turfTimer[player] = true
		setTimer(function(player) turfTimer[player] = nil end, 2500, 1, player)
		local Group = getElementData(player, "Group")
		local r = tonumber(r)
		local g = tonumber(g)
		local b = tonumber(b)
		if Group then
			if doesPlayerHavePermission(player, 12) then
				if r and g and b then
					if r <= 255 and r >= 0 and g <= 255 and g >= 0 and b <= 255 and b >= 0 then
						local color = r..", "..g..", "..b
						dbExec(db, "UPDATE groups SET turf_color = ? WHERE group_name = ?", color, Group)
						exports.GTIhud:dm("[Turf] "..string.format("#%.2X%.2X%.2X", r, g, b).."Turf rengi başarıyla değiştirildi.",player, r, g, b,true)
						groupAddNewHistoryLog ( Group, "("..getPlayerName( player )..")["..getAccountName(getPlayerAccount(player)).."] adlı oyuncu Turf rengini değiştirdi. Renk kodu - "..r.." , "..g.." , "..b.." , ")
					else
						exports.GTIhud:dm("[Turf]  0-255 Arası bir sayı olmalıdır.",player, 255, 255, 0,true)
					end
				else
					exports.GTIhud:dm("[Turf] Sözdizimi: /turfrenk [r] [g] [b]",player, 255, 255, 0,true)
					exports.GTIhud:dm("[Turf] Örnek: /turfrenk 255 0 0", player,0, 250, 150,true)
				end
			else
				exports.GTIhud:dm("[Turf] Turf rengini değiştirme izniniz yok.",player, 255, 0, 0,true)
			end
		end
	end
end)

addEvent("guiChangeChatTagColor", true)
addEventHandler("guiChangeChatTagColor",root,
function (Red, Green, Blue)
	local Group = getElementData(source,"Group")
	if Group then
		if doesPlayerHavePermission(source, 13) then
			local color = Red..", "..Green..", "..Blue
			dbExec(db, "UPDATE groups SET tag_color = ? WHERE group_name = ?", color, Group)
			exports.GTIhud:dm("[Klan] "..string.format("#%.2X%.2X%.2X", Red, Green, Blue).."Tag rengi başarıyla değiştirildi.",source, Red, Green, Blue,true)
			groupAddNewHistoryLog ( Group, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu Tag rengini değiştirdi. Renk kodu - "..Red.. " , "..Green.." , "..Blue.."")
		else
			exports.GTIhud:dm("[Klan] Tag rengini değiştirme izniniz yok.", source, 255, 0, 0,true)
		end
	end
end
)

addEvent("guiChangeTurfColor", true)
addEventHandler("guiChangeTurfColor",getRootElement(),
function (Red, Green, Blue)
	if not turfTimer[source] then
		turfTimer[source] = true
		setTimer(function(source) turfTimer[source] = nil end, 2500, 1, source)
		local Group = getElementData(source,"Group")
		if Group then
			if doesPlayerHavePermission(source, 12) then
				local color = Red..", "..Green..", "..Blue
				dbExec(db, "UPDATE groups SET turf_color = ? WHERE group_name = ?", color, Group)
				exports.GTIhud:dm("[Turf] "..string.format("#%.2X%.2X%.2X", Red, Green, Blue).."Turf rengi başarıyla değiştirildi.", source,Red, Green, Blue,true)
				groupAddNewHistoryLog ( Group, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu Turf rengini değiştirdi. Renk kodu - "..Red.. " , "..Green.." , "..Blue.."")
			else
				exports.GTIhud:dm("#[Turf] Turf rengini değiştirme izniniz yok.", source, 255, 0, 0,true)
			end
		end
	end
end
)

addEvent("guiChangeChatColor", true)
addEventHandler("guiChangeChatColor",root,
function (Red, Green, Blue)
local Group = getElementData(source,"Group")
	if Group then
		if doesPlayerHavePermission(source, 13) then
			local color = Red..", "..Green..", "..Blue
			dbExec(db, "UPDATE groups SET chat_color = ? WHERE group_name = ?", color, Group)
			exports.GTIhud:dm("[Klan] "..string.format("#%.2X%.2X%.2X", Red, Green, Blue).."Sohbet rengi başarıyla değiştirildi.", source,Red, Green, Blue,true)
			groupAddNewHistoryLog ( Group, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu Sohbet rengini değiştirdi. Renk kodu - "..Red.. " , "..Green.." , "..Blue.."")
		else
			exports.GTIhud:dm("[Klan] Sohbet rengini değiştirme izniniz yok.", source, 255, 0, 0,true)
		end
	end
end
)

addEvent("groupMutePlayer", true)
addEventHandler("groupMutePlayer",getRootElement(),
function (Player)
	local mgroup = getElementData(source,"Group")
	local data = data()
	local groupName = getPlayerGroup(source)
	if Player then
		if doesPlayerHavePermission(source, 16) then
		if getGroupFounderAccount(mgroup) == getAccountName(getPlayerAccount(Player)) then exports.GTIhud:dm("(Klan)  Klan Sahibine mute atamazsın !",source, 255, 0, 0,true) return end
		if getElementData(Player,"GroupMute") == "True" then
			setElementData(Player,"GroupMute","False")
			groupAddNewHistoryLog ( groupName, "("..getPlayerName( Player )..")["..getAccountName(getPlayerAccount(Player)).."] adlı oyuncunun konuşma yetkisini geri verdi. By ("..getPlayerName(source)..")["..getAccountName(getPlayerAccount(source)).."]")
			triggerClientEvent("myGroupList", source, getGroupMembers(groupName), data)
			for k, v in ipairs(getElementsByType("player")) do
				if getElementData(v, "Group") == mgroup then
					outputChatBox("(Klan) #C80000"..getPlayerName(Player).." adlı oyuncunun konuşma yetkisini geri verdi By.#C80000"..getPlayerName(source).." .",v , 0,255,0,true)
				end
			end
		else
			setElementData(Player,"GroupMute","True")
			groupAddNewHistoryLog ( mgroup, "("..getPlayerName( Player )..")["..getAccountName(getPlayerAccount(Player)).."] adlı oyuncunun konuşma yetkisini aldı By ("..getPlayerName(source)..")["..getAccountName(getPlayerAccount(source)).."]")
			triggerClientEvent( "myGroupList", source, getGroupMembers(groupName), data)
				for k, v in ipairs (getElementsByType("player")) do
					if getElementData(v, "Group") == mgroup then
						outputChatBox("(Klan) #C80000"..getPlayerName(Player).." adlı oyuncunun konuşma yetksini aldı By. #C80000"..getPlayerName(source).." .", v, 0, 255, 0,true)
					end
				end
			end
		end
	end
end
)

function getGroupTurfColor(group)
	if group and IsGroupExists(group) then
		local h = dbQuery(db, "SELECT turf_color FROM groups WHERE group_name = ?", group)
		local result = dbPoll(h, -1)
		return split(result[1]["turf_color"], ',')
	end
end

function getGroupTagName(group)
	if group and IsGroupExists(group) then
		local tagName = dbQuery(db, "SELECT KlanTag FROM groups WHERE group_name = ?", group)
		local resultTag = dbPoll(tagName, -1)
		return resultTag[1]["KlanTag"], ','
	end
end

function getGroupHistoryLog(Group)
	if Group and IsGroupExists(Group) then
		local his = dbQuery(db, "SELECT * FROM group_history WHERE group_name = ?", Group)
		local result = dbPoll(his, -1)
		return result
	end
end

function getGroupChatColor(group)
	if group and IsGroupExists(group) then
		local h = dbQuery(db, "SELECT chat_color FROM groups WHERE group_name = ?", group)
		local result = dbPoll(h, -1)
		return split(result[1]["chat_color"], ',')
	end
end

function getGroupChatTagColor(group)
	if group and IsGroupExists(group) then
		local h = dbQuery(db, "SELECT tag_color FROM groups WHERE group_name = ?", group)
		local result = dbPoll(h, -1)
		return split(result[1]["tag_color"], ',')
	end
end

function getGroupBankBalance(group)
	if group and IsGroupExists(group) then
		local h = dbQuery(db, "SELECT group_bank FROM groups WHERE group_name = ?", group)
		local result = dbPoll(h, -1)
		return result[1]["group_bank"]
	end
end

function getGroupTurfPoints(Group)
	if Group and IsGroupExists(Group) then
		local h = dbQuery(db, "SELECT turf_points FROM groups WHERE group_name = ?", Group)
		local result = dbPoll(h, -1)
		return result[1]["turf_points"]
	end
end

function setGroupTurfPoints(Group, Points)
	if Group and IsGroupExists(Group) then
		dbExec(db, "UPDATE groups SET turf_points = ? WHERE group_name = ?", Points, Group)
	end
end

addEvent("getGroupBalance", true)
addEventHandler("getGroupBalance", root,
function()
	local groupName = getPlayerGroup(source)
	if groupName then
		local balance = getGroupBankBalance(groupName) or 0
		triggerClientEvent(source, "receiveGroupBankBalance", source, balance)
	end
end)

addEvent("DepositMoneyInGroupBank", true)
addEventHandler("DepositMoneyInGroupBank", root,
function(money)
	local groupName = getPlayerGroup(source)
	if money and groupName then
		if doesPlayerHavePermission(source, 10) then
			local balance = getGroupBankBalance(groupName) or 0
			local pMoney = getPlayerMoney(source) or 0
			if balance and pMoney >= money and balance+money > 0 then
				dbExec(db, "UPDATE groups SET group_bank = ? WHERE group_name = ?", balance+money, groupName)
				-- exports.mysql:exec("UPDATE hesap SET altin=? WHERE Kullanici_adi=?", getElementData(source, "altin"), getAccountName(getPlayerAccount(source)))
				groupAddNewHistoryLog ( groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu klan bankasına "..money.." miktarda para  yatırdı.")
				for i, player in ipairs(getElementsByType("player")) do
					if getElementData(player, "Group") == groupName then
						outputChatBox("* (Klan) #C80000"..getPlayerName(source).." adlı oyuncu klan bankasına "..money.." miktarda para yatırdı.", player, 255, 255, 0, true)
						triggerClientEvent(player, "receiveGroupBankBalance", player, getGroupBankBalance(groupName) or 0)
					end
				end
			else
				exports.GTIhud:dm("(Klan) Yeteri kadar paran yok.", source, 0, 255, 0,true)
			end
		else
			exports.GTIhud:dm("(Klan) Klan bankasına para yatırma izniniz yok.", source, 255, 0, 0,true)
		end
	end
end)

addEvent("WithdrawMoneyInGroupBank", true)
addEventHandler("WithdrawMoneyInGroupBank", root,
function(money)
	local groupName = getPlayerGroup(source)
	if money and groupName then
		if doesPlayerHavePermission(source, 11) then
			local balance = getGroupBankBalance(groupName) or 0
			local pMoney = getPlayerMoney(source) or 0
			if balance and balance-money >= 0 then
				dbExec(db, "UPDATE groups SET group_bank = ? WHERE group_name = ?", balance-money, groupName)
				givePlayerMoney(source, pMoney+money)
				-- exports.mysql:exec("UPDATE hesap SET altin=? WHERE Kullanici_adi=?", getElementData(source, "altin"), getAccountName(getPlayerAccount(source)))
				groupAddNewHistoryLog ( groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu klan bankasından "..money.." mıktarda para  çekti.")
				for i, player in ipairs(getElementsByType("player")) do
					if getElementData(player, "Group") == groupName then
						outputChatBox("* (Klan) #C80000"..getPlayerName(source).." #FFA600adlı oyuncu klan bankasından "..money.." miktarda para çekti.", player, 255, 255, 0, true)
						triggerClientEvent(player, "receiveGroupBankBalance", player, getGroupBankBalance(groupName) or 0)
					end
				end
			else
				exports.GTIhud:dm("(Klan) Klan bankanızda bu kadar paran yok.", source, 0, 255, 0,true)
			end
		else
			exports.GTIhud:dm("(Klan) Klan bankasından paraçekme izniniz yok.", source, 255, 0, 0,true)
		end
	end
end)

function getGroupOnlineMember(group)
	local Table = {}
	for i, player in ipairs(getElementsByType("player")) do
		if getElementData(player, "Group") == group then
			table.insert(Table, player)
		end
	end
	return Table
end

addEvent("GiveAllPlayerMoneyInGroupBank", true)
addEventHandler("GiveAllPlayerMoneyInGroupBank",root,
function (money)
local Group = getElementData(source, "Group")
local members = getGroupOnlineMember(Group)
local balance = getGroupBankBalance(Group) or 0
local amount = math.ceil(money / #members)
	if balance and balance-money >= 0 then
		if doesPlayerHavePermission(source, 15) then
			for k, v in ipairs(members) do
				dbExec(db, "UPDATE groups SET group_bank = ? WHERE group_name = ?", balance-money, Group)
				givePlayerMoney(v,amount)
				outputChatBox("* (Klan) #C80000"..getPlayerName(source).." #FFA600 adlı oyuncu $"..amount.."'ı tüm üyelere eşit şekilde dağıttı",v,255,255,0, true)
				triggerClientEvent("receiveGroupBankBalance", source, getGroupBankBalance(Group) or 0)
			end
			groupAddNewHistoryLog ( Group, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu $"..amount.."'ı tüm üyelere eşit şekilde dağıttı.")
		end
	end
end
)

addEvent("guiGiveMemberMoney", true)
addEventHandler("guiGiveMemberMoney",getRootElement(),
function (name2, moneys)
	local name = getPlayerFromName(name2)
	local name4 = getPlayerName(source)
	local Group = getElementData(source, "Group")
	local ItemGroup = getElementData(name, "Group")
	local balance = getGroupBankBalance(Group) or 0
	if Group then
		if doesPlayerHavePermission(source, 17) then
			if Group == ItemGroup then
				if name4 ~= name2 then
					if moneys <= balance then
						if balance and balance-moneys >= 0 then

					givePlayerMoney ( name, moneys )
							dbExec(db, "UPDATE groups SET group_bank = ? WHERE group_name = ?", balance-moneys, Group)
							groupAddNewHistoryLog ( Group, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..name2..")["..getAccountName(getPlayerAccount(name2)).."] adlı oyuncuya klan bankasından $"..moneys.." verdi")
							triggerClientEvent("receiveGroupBankBalance", source, balance)
							for k, v in ipairs (getElementsByType("player")) do
								if getElementData(v, "Group") == Group then
									outputChatBox("* (Klan) #C80000"..getPlayerName(source).."#FFA600 adlı oyuncu #C80000"..name2.." adlı oyuncuya klan bankasından $"..moneys.." verdi",v,255,255,255, true)
								end
							end
						end
					end
				else
					exports.GTIhud:dm("(Klan) Parayı kendine veremezsin !", source,255, 0, 0,true)
				end
			else
				exports.GTIhud:dm("(Klan)  Klanda Bu İsimde Bir Oyuncu Yok.",source, 255, 0, 0,true)
			end
		else
			exports.GTIhud:dm("(Klan) Klan üyelerine Para Verme izniniz yok.",source, 255, 0, 0,true)
		end
	end
end
)

addEvent("setWarningLevel", true)
addEventHandler("setWarningLevel", root,
function(Account, level, oLevel, Reason)
	local _, rankType = getPlayerGroupRank(source)
	if rankType ~= 1 and getAccountName(getPlayerAccount(source)) == Account then return end
	local groupName = getPlayerGroup(source)
	if groupName then
		if doesPlayerHavePermission(source, 14) then
			if getGroupFounderAccount(groupName) == Account then exports.GTIhud:dm("(Klan)  Klan sahibini uyaramazsınız !", source, 255, 0, 255,true) return end
			dbExec(db, "UPDATE group_members SET WL = ? WHERE group_name = ? AND member_account = ?", level, groupName, Account)
			groupAddNewHistoryLog ( groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..getGroupMemberName(Account)..") adlı oyuncuyu uyardı ["..Account.."] ("..oLevel..") ("..Reason..")." )
			local data = data()
			triggerClientEvent(source, "myGroupList", source, getGroupMembers(groupName), data)
			for i, player in ipairs(getElementsByType("player")) do
				if getElementData(player, "Group") == groupName then
					outputChatBox("* (Klan) #C80000"..getPlayerName(source).." adlı oyuncu "..getGroupMemberName(Account).." adlı oyuncuyu uyardı ! ("..oLevel..") ("..Reason..").", player, 255, 255, 0, true)
				end
			end
		else
			exports.GTIhud:dm("(Klan) Üyeleri uyarma izniniz yok.", source, 255, 0, 0,true)
		end
	end
end)

addEvent("AddNewRank", true)
addEventHandler("AddNewRank", root,
function(rankName, addAfterRank, permission)
	local groupName = getPlayerGroup(source)
	local _, rankType = getPlayerGroupRank(source)
	if groupName and rankType == 1 then
		local result = dbPoll(dbQuery(db, "SELECT group_rank_name FROM group_ranks WHERE group_name = ? AND group_rank_name = ?", groupName, rankName), -1)
		if type(result) == "table" and #result == 0 then
			local result = dbPoll(dbQuery(db, "SELECT * FROM group_ranks WHERE group_name = ?", groupName), -1)
			if type(result) == "table" and #result ~= 0 then
				dbExec(db, "DELETE FROM group_ranks WHERE group_name = ?", groupName)
				for i, R in pairs(result) do
					dbExec(db, "INSERT INTO group_ranks VALUES(?, ?, ?, ?)", groupName, R["group_rank_name"], R["group_rank_permission"], R["rank_type"])
					if R["group_rank_name"] == addAfterRank then
						dbExec(db, "INSERT INTO group_ranks VALUES(?, ?, ?, ?)", groupName, rankName, permission, 3)
						exports.GTIhud:dm(source, "(Klan) "..rankName.." adlı rütbe başarıyla oluşturuldu!",source, 0, 255, 0,true)
						groupAddNewHistoryLog ( groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..rankName..") adlı bir rütbe oluşturdu.")
					end
				end
				for i, player in ipairs(getElementsByType("player")) do
					if getElementData(player, "Group") == groupName then
						setElementData(player, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(player)})
					end
				end
			end
		end
	end
end)

addEvent("RemoveRank", true)
addEventHandler("RemoveRank", root,
function(rankName)
	local groupName = getPlayerGroup(source)
	local _, rankType = getPlayerGroupRank(source)
	if groupName and rankType == 1 then
		local result = dbPoll(dbQuery(db, "SELECT rank_type FROM group_ranks WHERE group_name = ? AND group_rank_name = ?", groupName, rankName), -1)
		if type(result) == "table" and #result ~= 0 then
			if result[1]["rank_type"] == 3 then
				local result = dbPoll(dbQuery(db, "SELECT group_rank_name FROM group_ranks WHERE group_name = ?", groupName), -1)
				if type(result) == "table" and #result ~= 0 then
					for i, R in pairs(result) do
						if R["group_rank_name"] == rankName then
							dbExec(db, "UPDATE group_members SET member_rank = ? WHERE group_name = ? AND member_rank = ?", result[i-1]["group_rank_name"], groupName, rankName)
						end
					end
				end
				dbExec(db, "DELETE FROM group_ranks WHERE group_name = ? AND group_rank_name = ?", groupName, rankName)
				exports.GTIhud:dm("(Klan) "..rankName.." adlı rütbe başarıyla kaldırıldı!", source, 0, 255, 0,true)
				groupAddNewHistoryLog(groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..rankName..") adlı rütbeyi kaldırdı.")
				for i, player in ipairs(getElementsByType("player")) do
					if getElementData(player, "Group") == groupName then
						setElementData(player, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(player)})
					end
				end
			else
				exports.GTIhud:dm("(Klan) Bu rütbe kaldırılamaz.",source, 255, 40, 0,true)
			end
		end
	end
end)

addEvent("EditRank", true)
addEventHandler("EditRank", root,
function(rankName, newRankName, permission)
	local groupName = getPlayerGroup(source)
	local _, rankType = getPlayerGroupRank(source)
	if groupName and rankType == 1 then
		dbExec(db, "UPDATE group_ranks SET group_rank_permission = ? WHERE group_name = ? AND group_rank_name = ?", permission, groupName, rankName)
		exports.GTIhud:dm("(Klan) "..rankName.." adlı rütbe başarıyla düzenlendi!", source, 0, 255, 0, true)
		groupAddNewHistoryLog(groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..rankName..") adlı rütbeyi düzenlendi.")
		if rankName ~= newRankName then
			groupAddNewHistoryLog(groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..rankName..") adlı rütbeyi değiştirerek ("..newRankName..") yaptı")
		end
		local result = dbPoll(dbQuery(db, "SELECT group_rank_name FROM group_ranks WHERE group_name = ? AND group_rank_name = ?", groupName, newRankName), -1)
		if type(result) == "table" and #result == 0 then
			dbExec(db, "UPDATE group_ranks SET group_rank_name = ? WHERE group_name = ? AND group_rank_name = ?", newRankName, groupName, rankName)
			dbExec(db, "UPDATE group_members SET member_rank = ? WHERE group_name = ? AND member_rank = ?", newRankName, groupName, rankName)
		end
		for i, player in ipairs(getElementsByType("player")) do
			if getElementData(player, "Group") == groupName then
				setElementData(player, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(player)})
			end
		end
	end
end)

function IsGroupExists(name)
	local h = dbQuery(db, "SELECT * FROM group_members WHERE group_name = ?", name)
	local result = dbPoll(h, -1)
	if type(result) == "table" and #result ~= 0 and tostring(result[1]["group_name"]) == tostring(name) then
		return true
	end
end

addEventHandler("onPlayerLogin", root,
function(_, accountName)
	local groupName = getPlayerGroup(source)
	if groupName then
		local data = data()
		local hesap = getAccountName(getPlayerAccount(source))
		dbExec(db, "UPDATE group_members SET member_name = ?, member_status = ?, last_online = ? WHERE group_name = ? AND member_account = ?", getPlayerName(source), "Yes", data, groupName, getAccountName(accountName))
		setElementData(source, "Group", groupName)
		setElementData(source, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(source)})
		setElementData(source, "KlanRutbe", tostring(getPlayerGroupRank(source)))
		-- exports.mysql:exec("UPDATE hesap SET isim=?, son_giris=?, klan_isim=?, klan_rutbe=? WHERE Kullanici_adi=?", string.gsub (getPlayerName(source), "#%x%x%x%x%x%x", ""), "Aktif", groupName, tostring(getPlayerGroupRank(source)), getAccountName(getPlayerAccount(source)))
		-- for _, v in ipairs(exports.mysql:query("SELECT * FROM hesap")) do
			-- if hesap == v.Kullanici_adi then 
				-- setElementData(source, "altin", v.altin)
			-- end
		-- end
	else
		-- exports.mysql:exec("UPDATE hesap SET isim=?, son_giris=? WHERE Kullanici_adi=?", string.gsub (getPlayerName(source), "#%x%x%x%x%x%x", ""), data, getAccountName(getPlayerAccount(source)))
		setElementData(source, "Group", false)
		setElementData(source, "GroupRank", false)
	end
end)

function getGroupRanks(groupName)
	local Rank = dbPoll(dbQuery(db, "SELECT * FROM group_ranks WHERE group_name = ?", groupName), -1)
	if type(Rank) == "table" and #Rank ~= 0 then
		return Rank
	end
end

function getPlayerGroupRank(player)
	local groupName = getPlayerGroup(player)
	if groupName then
		local Rank = dbPoll(dbQuery(db, "SELECT member_rank FROM group_members WHERE group_name = ? AND member_account = ?", groupName, getAccountName(getPlayerAccount(player))), -1)
		if type(Rank) == "table" and #Rank ~= 0 then
			local tt = dbPoll(dbQuery(db, "SELECT rank_type FROM group_ranks WHERE group_name = ? AND group_rank_name = ?", groupName, Rank[1]["member_rank"]), -1)
			return Rank[1]["member_rank"], tt[1]["rank_type"]
		end
	end
end

function doesPlayerHavePermission(player, permission)
	permission = tonumber(permission)
	local groupName = getPlayerGroup(player)
	if groupName then
		local Rank = dbPoll(dbQuery(db, "SELECT member_rank FROM group_members WHERE group_name = ? AND member_account = ?", groupName, getAccountName(getPlayerAccount(player))), -1)
		if type(Rank) == "table" and #Rank ~= 0 then
			local Permission = dbPoll(dbQuery(db, "SELECT group_rank_permission FROM group_ranks WHERE group_name = ? AND group_rank_name = ?", groupName, Rank[1]["member_rank"]), -1)
			local pre = split(Permission[1]["group_rank_permission"], ',')
			if type(pre) == "table" then
				for i, p in ipairs(pre) do
					if tonumber(p) == permission then return true
					end
				end
			end
		end
	end
end

function getPlayerGroup(player)
	local h = dbQuery(db, "SELECT group_name FROM group_members WHERE member_account = ?", getAccountName(getPlayerAccount(player)))
	local result = dbPoll(h, -1)
	if type(result) == "table" and #result ~= 0 and result[1]["group_name"] then
		return tostring(result[1]["group_name"])
	end
end

function addMemberToGroup(player, groupName)
	local accountss = getAccountName(getPlayerAccount(player))
	local serialsv = getPlayerSerial(player)
	if IsGroupExists(groupName) and not getPlayerGroup(player) then
		if not isAccountBlocked(groupName, accountss) and not isSerialBlocked(groupName, serialsv) then
			local h = dbQuery(db, "SELECT group_members FROM groups WHERE group_name = ?", groupName)
			local result = dbPoll(h, -1)
			local cont = result[1]["group_members"] + 1
			local data = data()
			local playerName = getPlayerName(player)
			local accountName = getAccountName(getPlayerAccount(player))
			local tag = getGroupTagName(groupName)
			dbExec(db, "INSERT INTO group_members VALUES(?, ?, ?, ?, ?, ?, ?)", groupName, accountName, playerName, "Yes", getGroupRanks(groupName)[1]["group_rank_name"], data, 0)
			dbExec(db, "UPDATE groups SET group_members = ? WHERE group_name = ?", cont, groupName)
			dbExec(db, "DELETE FROM group_invite WHERE player_account = ?", accountName)
			setElementData(player, "Group", groupName)
			setElementData(player, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(player)})
			triggerClientEvent(player, "Send_Invite_List", player, getPlayerInviteGroupList(player))
			groupAddNewHistoryLog ( groupName, "("..getPlayerName( player )..")["..getAccountName(getPlayerAccount(player)).."] adlı oyuncu klana katıldı.")
			if tag ~= "" then 
			local hesap = getPlayerAccount (player)
			setAccountData(hesap, "KlanTagiEtkin", true )
			triggerClientEvent(player, "KlanTags", player, true)
			end
			for _,v in ipairs(getElementsByType("player")) do
				if getElementData(v, "Group") == groupName then
					outputChatBox("* (Klan) "..getPlayerName(player).." adlı oyuncu klana katıldı.", v, 255, 255, 0, true)
				end
			end
		else
			outputChatBox("(Klan)  Klanın Kara Listesinde Olduğunuz İçin Katılamazsınız", player, 255, 0, 0, true)
		end
	end
end

function removeMemberFromGroup(player)
	local groupName = getPlayerGroup(player)
	if groupName then
		local RankName, rankType = getPlayerGroupRank(source)
		if rankType ~= 1 then
			local result = dbPoll(dbQuery(db, "SELECT group_members FROM groups WHERE group_name = ?", groupName), -1)
			local cont = result[1]["group_members"] - 1
			dbExec(db, "DELETE FROM group_members WHERE member_account = ?", getAccountName(getPlayerAccount(player)))
			dbExec(db, "UPDATE groups SET group_members = ? WHERE group_name = ?", cont, groupName)
			setElementData(player, "Group", false)
			groupAddNewHistoryLog ( groupName, "("..getPlayerName( player )..")["..getAccountName(getPlayerAccount(player)).."] adlı oyuncu klandan ayrıldı.")
			if getElementData(player, "GroupMute") == "True" then
				setElementData(player, "GroupMute", "False")
			end
		elseif rankType == 1 then
			local result = dbPoll(dbQuery(db, "SELECT member_rank FROM group_members WHERE group_name = ? AND member_rank = ?", groupName, RankName), -1)
			if type(result) == "table" and #result == 1 then
				exports.GTIhud:dm("(Klan) Klandan ayrılamazsın çünkü Kurucusun ", player,255, 40, 0,true)
			else
				local result = dbPoll(dbQuery(db, "SELECT group_members FROM groups WHERE group_name = ?", groupName), -1)
				local cont = result[1]["group_members"] - 1
				dbExec(db, "DELETE FROM group_members WHERE member_account = ?", getAccountName(getPlayerAccount(player)))
				dbExec(db, "UPDATE groups SET group_members = ? WHERE group_name = ?", cont, groupName)
				setElementData(player, "Group", false)
				setElementData(player, "GroupRank", false)
			if getElementData(player, "GroupMute") == "True" then
				setElementData(player, "GroupMute", "False")
			end
			end
		end
		if getElementData(player, "Group") then return end
		for _,v in ipairs(getElementsByType("player")) do
			if getElementData(v, "Group") == groupName then
				outputChatBox("* (Klan) "..getPlayerName(player).." adlı oyuncu klandan ayrıldı.",v,255,255,0,true)
			end
		end
	end
end

function setGroupInfo(player, name, Texts)
	if IsGroupExists(name) and doesPlayerHavePermission(player, 5) then
		local Text = Texts.." Updated by "..getAccountName(getPlayerAccount(player)).."\n"
		dbExec(db, "UPDATE groups SET group_info = ? WHERE group_name = ?", Text, name)
		dbExec(db, "UPDATE groups SET group_members = ? WHERE group_name = ?", cont, groupName)
		groupAddNewHistoryLog ( name, "("..getPlayerName( player )..")["..getAccountName(getPlayerAccount(player)).."] adlı oyuncu klan bilgisini düzenledi.")
		triggerClientEvent(player, "Send_Group_Info", player, getGroupInfo(name))
		for _,v in ipairs(getElementsByType("player")) do
			if getElementData(v, "Group") == name then
				outputChatBox("* (Klan) "..getPlayerName(player).." adlı oyuncu klan bilgisini düzenledi.", v, 0, 255, 0, true)
			end
		end
	end
end

function getGroupInfo(name)
	if IsGroupExists(name) then
		local h = dbQuery(db, "SELECT group_info FROM groups WHERE group_name = ?", name)
		local result = dbPoll(h, -1)
		return tostring(result[1]["group_info"])
	end
end

function getGroupMembers(name)
	local M = dbQuery(db, "SELECT * FROM group_members WHERE group_name = ?", name)
	local resM = dbPoll(M, -1)
	if type(resM) == "table" and #resM ~= 0  then
		return resM
	end
end

function getGroupMemberName(account)
	local h = dbQuery(db, "SELECT member_name FROM group_members WHERE member_account = ?", account)
	local result = dbPoll(h, -1)
	if type(result) == "table" and #result ~= 0 then
		return tostring(result[1]["member_name"])
	end
end

function isGroupMemberExists(Group, Member)
	local h = dbQuery(db, "SELECT member_account FROM group_members WHERE group_name = ?", Group)
	local result = dbPoll(h, -1)
	if type(result) == "table" and #result ~= 0 then
		return result[1]["member_account"]
	end
end

function GroupBlockAccount(Group, by, account, Reason)
	if IsGroupExists(Group) then
		local time = getRealTime()
		local year = time.year + 1900
		local month = time.month + 1
		local day = time.monthday
		local hour = time.hour
		local minute = time.minute
		if isAccountBlocked(Group, account) then
			exports.GTIhud:dm("(Klan) The Account Is Already Blocked.",source,255,255,0,true)
		else
			dbExec(db, "INSERT INTO group_blackaccount VALUES (?, ?, ?, ?, ?)", Group, tostring(by), tostring(account),tostring(Reason),"[" .. hour ..":" .. minute .."][" .. month .."/" .. day .."/" .. year .."]")
			exports.GTIhud:dm("(Klan) The Account Was Blocked Successfully.",source,255,255,0,true)
		end
	end
end

function GroupUnBlockAccount(Group, BannedAccount)
	if IsGroupExists(Group) then
		dbExec(db, "DELETE FROM group_blackaccount WHERE group_name = ? AND account_name = ?", Group, tostring(BannedAccount))
		exports["guimessages"]:outputServer(source, "(Klan) The Account Was UnBlocked Successfully.",255,255,0)
	end
end

function GroupBlockSerial(Group, by, serial, Reason)
	if IsGroupExists(Group) then
		local time = getRealTime()
		local year = time.year + 1900
		local month = time.month + 1
		local day = time.monthday
		local hour = time.hour
		local minute = time.minute
		if isSerialBlocked(Group, serial) then
			exports["guimessages"]:outputServer(source, "(Klan) The Serial Is Already Blocked.",255,255,0)
		else
			dbExec(db, "INSERT INTO group_blackserial VALUES (?, ?, ?, ?, ?)", Group, tostring(by), tostring(serial),tostring(Reason),"[" .. hour ..":" .. minute .."][" .. month .."/" .. day .."/" .. year .."]")
			exports["guimessages"]:outputServer(source, "(Klan) The Serial Was Blocked Successfully.",255,255,0)
		end
	end
end

function GroupUnBlockSerial(Group, BannedSerial)
	if IsGroupExists(Group) then
		dbExec(db, "DELETE FROM group_blackserial WHERE group_name = ? AND serial = ?", Group, BannedSerial)
		exports["guimessages"]:outputServer(source, "(Klan) The Serial Was UnBlocked Successfully.",255,255,0)
	end
end

function isAccountBlocked(Group, Account)
	local result = dbQuery(db, "SELECT * FROM group_blackaccount WHERE group_name = ? AND account_name = ?", Group, Account)
	local result2 = dbPoll(result, -1)
	if result2 and type(result2) == "table" and #result2 ~= 0 then
		return result2
	end
end

function isSerialBlocked(Group, Serial)
	local result = dbQuery(db, "SELECT * FROM group_blackserial WHERE group_name = ? AND serial = ?", Group, Serial)
	local result2 = dbPoll(result, -1)
	if result2 and type(result2) == "table" and #result2 ~= 0 then
		return result2
	end
end

function getGroupBlockedAccounts(Group)
	if IsGroupExists(Group) then
		local h = dbQuery(db, "SELECT * FROM group_blackaccount WHERE group_name = ?", Group)
		local result = dbPoll(h, -1)
		return result
	end
end

addEvent("Request_Group_BlackList", true)
addEventHandler("Request_Group_BlackList",root,
function ()
	local mygroup = getPlayerGroup(source)
	local accountstable = getGroupBlockedAccounts(mygroup)
	local serialstable = getGroupBlockedSerials(mygroup)
	triggerClientEvent("Set_Group_BlackList", source, accountstable)
	triggerClientEvent("Set_Group_BlackListSerial", source, serialstable)
end
)

addEvent("Group_Block_Account", true)
addEventHandler("Group_Block_Account", root,
function (Account, Reason)
	if doesPlayerHavePermission(source, 20) then
		if getAccountName(getPlayerAccount(source)) == Account then exports["guimessages"]:outputServer(source, "* (Klan)  You Can't Block Yourself.!", 255, 0, 0) return end
		local Group = getPlayerGroup(source)
		if Reason == "Reason" or Reason == "" or Reason == " " then
			Reason = "Sebep Belirtilmedi"
		end
		GroupBlockAccount(Group, getPlayerName(source).."["..getAccountName(getPlayerAccount(source)).."]", Account, Reason)
		local accountstable = getGroupBlockedAccounts(Group)
		triggerClientEvent("Set_Group_BlackList", source, accountstable)
	end
end
)

addEvent("Group_Block_Serial", true)
addEventHandler("Group_Block_Serial", root,
function (Serial, Reason)
	if doesPlayerHavePermission(source, 21) then
		if getPlayerSerial(source) == Serial then exports["guimessages"]:outputServer(source, "* (Klan)  You Can't Block Yourself.!", 255, 0, 0) return end
		local Group = getPlayerGroup(source)
		if Reason == "Reason" or Reason == "" or Reason == " " then
			Reason = "Sebep Belirtilmedi"
		end
		GroupBlockSerial(Group, getPlayerName(source).."["..getAccountName(getPlayerAccount(source)).."]", Serial, Reason)
		local serialstable = getGroupBlockedSerials(Group)
		local Account = getAccountsBySerial(Serial)
		triggerClientEvent("Set_Group_BlackListSerial", source, serialstable)
	end
end
)

addEvent("Group_Unblock_Account", true)
addEventHandler("Group_Unblock_Account", root,
function (Account)
	if doesPlayerHavePermission(source, 22) then
		local Group = getPlayerGroup(source)
		GroupUnBlockAccount(Group, Account)
		local accountstable = getGroupBlockedAccounts(Group)
		triggerClientEvent("Set_Group_BlackList", source, accountstable)
	end
end
)

addEvent("Group_UnBlock_Serial", true)
addEventHandler("Group_UnBlock_Serial", root,
function (Account)
	if doesPlayerHavePermission(source, 23) then
		local Group = getPlayerGroup(source)
		GroupUnBlockSerial(Group, Account)
		local serialstable = getGroupBlockedSerials(Group)
		triggerClientEvent("Set_Group_BlackListSerial", source, serialstable)
	end
end
)

function getGroupBlockedSerials(Group)
	if IsGroupExists(Group) then
		local h = dbQuery(db, "SELECT * FROM group_blackserial WHERE group_name = ?", Group)
		local result = dbPoll(h, -1)
		return result
	end
end

function groupAddNewHistoryLog(Group, Event)
	if IsGroupExists(Group) then
		local time = getRealTime()
		local year = time.year + 1900
		local month = time.month + 1
		local day = time.monthday
		local hour = time.hour
		local minute = time.minute
		dbExec(db, "INSERT INTO group_history VALUES (?, ?, ?)", Group, tostring(Event), "[" .. hour ..":" .. minute .."][" .. month .."/" .. day .."/" .. year .."]")
	end
end

function InvitePlayerToGroup(name,player,by)
	if isGuestAccount(getPlayerAccount(player)) then outputChatBox("* (Klan) "..getPlayerName(player).."  adlı oyuncu hesabına giriş yapmadığı için davet edemezsiniz.", by, 0, 255, 0, true) return end
	local result = dbPoll(dbQuery(db, "SELECT * FROM group_invite WHERE group_name = ? AND player_account = ?", name, getAccountName(getPlayerAccount(player))), -1)
	local PAccount = getAccountName(getPlayerAccount(player))
	local groupnames = getPlayerGroup(by)
	local PSerial = getPlayerSerial(player)
	if type(result) == "table" and #result == 0 or not result and IsGroupExists(name) and not getPlayerGroup(player) then
		local totalMember, limit = getGroupMemberLimit(name)
		if totalMember < limit then
			if not isAccountBlocked(groupnames, PAccount) then
				if not isSerialBlocked(groupnames, PSerial) then
					outputChatBox("* (Klan) "..getPlayerName(player).." adlı oyuncuyu klana davet ettin.", by, 0, 255, 0, true)
					outputChatBox("* (Klan) Sizi ("..name..") adlı klana davet ettiler. | Davet eden kişi -  "..getPlayerName(by)..".", player, 0, 255, 0, true)
					playSoundFrontEnd(player, 40)
					dbExec(db, "INSERT INTO group_invite VALUES(?, ?, ?)", name, getAccountName(getPlayerAccount(player)), getPlayerName(by).." ("..getAccountName(getPlayerAccount(by))..")")
					groupAddNewHistoryLog ( name, "("..getPlayerName( player )..")["..getAccountName(getPlayerAccount(player)).."] adlı oyuncuyu ("..getPlayerName(by)..")["..getAccountName(getPlayerAccount(by)).."] klana davet etti.")
				else
					outputChatBox("", by, 255, 0, 0, true)
				end
			else
				outputChatBox("", by, 255, 0, 0, true)
			end
		else
			outputChatBox("* (Klan) Klan dolu olduğu için Davet Etemezsiniz.", by, 255, 0, 0, true)
		end
	end
end

function getPlayerInviteGroupList(player)
	local h = dbQuery(db, "SELECT * FROM group_invite WHERE player_account = ?", getAccountName(getPlayerAccount(player)))
	local result = dbPoll(h, -1)
	if type(result) == "table" and #result ~= 0 then
		return result
	end
end

function getGroupMemberLimit(name)
	local result = dbPoll(dbQuery(db, "SELECT group_members,members_limit FROM groups WHERE group_name = ?", name), -1)
	if type(result) == "table" and #result ~= 0 then
		return tonumber(result[1]["group_members"]), tonumber(result[1]["members_limit"])
	end
end

addEvent("Send_Groups_List", true)
addEventHandler("Send_Groups_List", root,
function()
	local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, group_owner FROM groups"), -1)
	if type(result) == "table" then
		triggerClientEvent(source, "GroupList", source, result)
	end
end
)
function getGroups()
	local h = dbQuery(db, "SELECT group_name FROM groups")
	local result = dbPoll(h, -1)
	if result and type(result) == "table" then
		return result
	end
end

function getGroupKillPoints(Group)
	if Group and IsGroupExists(Group) then
		local h = dbQuery(db, "SELECT kill_points FROM groups WHERE group_name = ?", Group)
		local result = dbPoll(h, -1)
		if result and type(result) == 'table' then
			return result
		end
	end
end

function setGroupKillPoints(Group, Points)
	if Group and Points and IsGroupExists(Group) then
		local h = dbExec(db, "UPDATE groups SET kill_points = ? WHERE group_name = ?", Points, Group)
	end
end

addEvent("Request_Top_Kill", true)
addEventHandler("Request_Top_Kill", root,
function ()
	local killtable = {}
	for index, groups in pairs(getGroups()) do
		local kills = getGroupKillPoints(groups.group_name) or 0
		if kills and kills >= 100 then
			table.insert(killtable, {groups.group_name, getGroupKillPoints(groups.group_name)})
		end
	end
	triggerClientEvent(source, "Set_Top_Kills", source, killtable)
end
)

addEvent("Request_Top_Bank", true)
addEventHandler("Request_Top_Bank", root,
function ()
	local banktable = {}
	for index, groups in pairs(getGroups()) do
		local balance = getGroupBankBalance(groups.group_name)
		if balance and balance > 5000 then
			table.insert(banktable, {groups.group_name, getGroupBankBalance(groups.group_name)})
		end
	end
	triggerClientEvent(source, "Set_Top_Bank", source, banktable)
end
)

addEvent("Request_Top_Turf", true)
addEventHandler("Request_Top_Turf", root,
function ()
	local topTable = {}
	for index, groups in pairs(getGroups()) do
		local turfpoints = getGroupTurfPoints(groups.group_name)
		if turfpoints and turfpoints >= 1 then
			table.insert(topTable, {groups.group_name, getGroupTurfPoints(groups.group_name)})
		end
	end
	triggerClientEvent(source, "Set_Top_Turf", source, topTable)
end
)

addEvent("Invite_Player", true)
addEventHandler("Invite_Player", root,
function(name, invited)
	InvitePlayerToGroup(name, invited, source)
end)

addEvent("Request_Invite_List", true)
addEventHandler("Request_Invite_List", root,
function()
	triggerClientEvent(source, "Send_Invite_List", source, getPlayerInviteGroupList(source))
end)

addEvent("Request_Group_Info", true)
addEventHandler("Request_Group_Info", root,
function(name)
	triggerClientEvent(source, "Send_Group_Info", source, getGroupInfo(name))
end)

addEvent("History_Remove_Event", true)
addEventHandler("History_Remove_Event", root,
function (theLogID, theLogTime)
	if doesPlayerHavePermission(source, 18) then
		dbExec(db, "DELETE FROM group_history WHERE group_name = ? AND groupaction = ? AND thetime = ? ", getPlayerGroup(source), theLogID, theLogTime)
		exports.GTIhud:dm("(Klan) İşlem başarıyla silindi",source, 255, 255, 0,true)
		local Name = getPlayerGroup(source)
		local MyGroupHistory = getGroupHistoryLog( Name )
		triggerClientEvent("Set_Group_History", source, MyGroupHistory)
	else
		exports.GTIhud:dm("(Klan) İşlemi silme izniniz yok.", source,255, 255, 0,true)
	end
end
)

addEvent("Show_Manager_History", true)
addEventHandler("Show_Manager_History", root,
function (GroupName)
	local MyGroupHistory = getGroupHistoryLog(GroupName)
	triggerClientEvent("SetManagerGroupHistory", source, MyGroupHistory)
end
)

addEvent("Request_myGroup_MembersList", true)
addEventHandler("Request_myGroup_MembersList", root,
function(name)
	local data = data()
	local member = getGroupMembers(name)
	return triggerClientEvent(source, "myGroupList", source, member, data)
end)

addEventHandler("onPlayerChangeNick", root,
function(_,new)
	local groupName = getPlayerGroup(source)
	if groupName then
		local data = data()
		dbExec(db, "UPDATE group_members SET member_name = ?, member_status = ?, last_online = ? WHERE group_name = ? AND member_account = ?", new, "Yes", data, groupName, getAccountName(getPlayerAccount(source)))
	end
end)

addEventHandler("onPlayerLogout", root,
function(acc)
	local groupName = getElementData(source, "Group")
	if groupName then
		local data = data()
		dbExec(db, "UPDATE group_members SET member_name = ?, member_status = ?, last_online = ? WHERE group_name = ? AND member_account = ?", getPlayerName(source), "No", data, groupName, getAccountName(acc))
		setElementData(source, "Group", false)
		setElementData(source, "GroupRank", false)
		-- exports.mysql:exec("UPDATE hesap SET isim=?, son_giris=? WHERE Kullanici_adi=?", string.gsub (getPlayerName(source), "#%x%x%x%x%x%x", ""), data, getAccountName(acc))
	end
end)

-- addEventHandler("onPlayerLogout", root,
-- function()
		-- exports.mysql:exec("UPDATE hesap SET isim=? WHERE Kullanici_adi=?", string.gsub (getPlayerName(source), "#%x%x%x%x%x%x", ""), getAccountName(getPlayerAccount(source)))
-- end)

addEventHandler("onPlayerQuit", root,
function()
	local groupName = getPlayerGroup(source)
	if groupName then
		local data = data()
		dbExec(db, "UPDATE group_members SET member_name = ?, member_status = ?, last_online = ? WHERE group_name = ? AND member_account = ?", string.gsub (getPlayerName(source), "#%x%x%x%x%x%x", ""), "No", data, groupName, getAccountName(getPlayerAccount(source)))
		-- exports.mysql:exec("UPDATE hesap SET isim=?, son_giris=? WHERE Kullanici_adi=?", string.gsub (getPlayerName(source), "#%x%x%x%x%x%x", ""), data, getAccountName(getPlayerAccount(source)))
		else
		-- exports.mysql:exec("UPDATE hesap SET isim=?, son_giris=? WHERE Kullanici_adi=?", string.gsub (getPlayerName(source), "#%x%x%x%x%x%x", ""), data, getAccountName(getPlayerAccount(source)))
	end
end)



addEvent("update_Group_Info", true)
addEventHandler("update_Group_Info", root,
function(name,Text)
	setGroupInfo(source, name, Text)
end)

addEvent("Accept_Invite", true)
addEventHandler("Accept_Invite", root,
function(group)
	local totalMember, limit = getGroupMemberLimit(group)
	if totalMember < limit then
		addMemberToGroup(source,group)
	else
		outputChatBox("* (Klan) Davet kabul edilemiyor, Klan Dolu !!!",source,255,0,0,true)
	end
end)

addEvent("Reject_Invite", true)
addEventHandler("Reject_Invite", root,
function(groupName)
	dbExec(db, "DELETE FROM group_invite WHERE group_name = ? AND player_account = ?", groupName, getAccountName(getPlayerAccount(source)))
	triggerClientEvent(source, "Send_Invite_List", source, getPlayerInviteGroupList(source))
end)

addEvent("Leave_Group", true)
addEventHandler("Leave_Group", root,
function()
	if getPlayerGroup(source) then
		removeMemberFromGroup(source)
	end
end)

addEvent("Leader_Group_Delete", true)
addEventHandler("Leader_Group_Delete", root,
function (GroupName, AccountName, AccountPassword)
	if not doesPlayerHavePermission(source, 7) then
		exports.GTIhud:dm("(Klan) Klanı silme yetkiniz yok.", source,255, 0, 0,true)
	elseif not IsGroupExists(GroupName) then
		exports.GTIhud:dm("(Klan) Klan adı hatalı.", source,255, 0, 0,true)
	elseif not getAccount(AccountName) then
		exports.GTIhud:dm("(Klan) Kullanıcı adı hatalı.", source,255, 0, 0,true)
	elseif not getAccount(AccountName, AccountPassword) then
		exports.GTIhud:dm("(Klan) Kullanıcı adı ve Şifre eşleşmiyor.", source,255, 0, 0,true)
	elseif getElementData(source, "Group") ~= GroupName then
		exports.GTIhud:dm("(Klan) Klan adı eşleşmiyor.",source, 255, 0, 0,true)
	else
		for i, player in ipairs(getElementsByType("player")) do
			if getElementData(player, "Group") == GroupName then
				dbExec(db, "DELETE FROM groups WHERE group_name = ?", GroupName)
				dbExec(db, "DELETE FROM group_ranks WHERE group_name = ?", GroupName)
				dbExec(db, "DELETE FROM group_members WHERE group_name = ?", GroupName)
				dbExec(db, "DELETE FROM group_invite WHERE group_name = ?", GroupName)
				dbExec(db, "DELETE FROM group_history WHERE group_name = ?", GroupName)
				dbExec(db, "DELETE FROM group_blackaccount WHERE group_name = ?", GroupName)
				dbExec(db, "DELETE FROM group_blackserial WHERE group_name = ?", GroupName)
				outputChatBox("(Klan) "..getPlayerName(source).." adlı oyuncu klanı sildi.", player, 255, 255, 255, true)
				setElementData(player, "Group", false)
				setElementData(player, "GroupRank", false)
				setElementData(player, "GroupMute", "False")
			end
		end
	end
end
)

addCommandHandler("klanlarisil1530", function()
	tbl = {}
	for i, v in ipairs(dbPoll(dbQuery(db, "SELECT * FROM `groups`"), -1)) do
	table.insert(tbl, {v})
	end
	for i2,v2 in pairs(tbl) do
	local kodlar = unpack(v2)
	if 8 > kodlar["group_members"] then
	dbExec(db, "DELETE FROM groups WHERE group_name = ?", kodlar["group_name"])
	dbExec(db, "DELETE FROM group_ranks WHERE group_name = ?", kodlar["group_name"])
	dbExec(db, "DELETE FROM group_members WHERE group_name = ?", kodlar["group_name"])
	dbExec(db, "DELETE FROM group_invite WHERE group_name = ?", kodlar["group_name"])
	dbExec(db, "DELETE FROM group_history WHERE group_name = ?", kodlar["group_name"])
	dbExec(db, "DELETE FROM group_blackaccount WHERE group_name = ?", kodlar["group_name"])
	dbExec(db, "DELETE FROM group_blackserial WHERE group_name = ?", kodlar["group_name"])
	end
	end
end)

addCommandHandler("puanlarisil1530", function()
	tbl = {}
	for i, v in ipairs(dbPoll(dbQuery(db, "SELECT * FROM `groups`"), -1)) do
	table.insert(tbl, {v})
	end
	for i2,v2 in pairs(tbl) do
	local kodlar = unpack(v2)
	if 0 < kodlar["turf_points"] then
	dbExec(db, "UPDATE groups SET turf_points=? WHERE group_name = ?", 0, kodlar["group_name"])
	end
	end
end)

function getGroupFounderAccount(group)
	if group and IsGroupExists(group) then
		local h = dbQuery(db, "SELECT group_owner FROM groups WHERE group_name = ?", group)
		local result = dbPoll(h, -1)
		return result[1]["group_owner"]
	end
end

addEvent("Promote_Demote", true)
addEventHandler("Promote_Demote", root,
function(cmd, Account, newRankName, currentRankName, Reason)
	local groupName = getPlayerGroup(source)
	local accountName = getAccountName(getPlayerAccount(source))
	local player = getAccountPlayer(getAccount(Account))
	local data = data()
	local founderaccount = getGroupFounderAccount(groupName)
	if cmd == "Yükselt" and groupName then
		if doesPlayerHavePermission(source, 2) then
			if accountName == Account then
				exports.GTIhud:dm("(Klan) Kendi rütbeni yükseltemezsin.",source, 255, 0, 0,true)
			else
				dbExec(db, "UPDATE group_members SET member_rank = ? WHERE group_name = ? AND member_rank = ? AND member_account = ?", newRankName, groupName, currentRankName, Account)
				groupAddNewHistoryLog ( groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..getGroupMemberName(Account)..")["..Account.."] adlı oyuncunun rütbesini yükseltti. | ("..currentRankName..") adlı rütbeden ("..newRankName..") adlı rütbeye yükseltti. Sebep ("..Reason..")")
				triggerClientEvent(source, "myGroupList", source, getGroupMembers(groupName), data)
				for i, player in ipairs(getElementsByType("player")) do
					if getElementData(player, "Group") == groupName then
						outputChatBox("* (Klan) #C80000"..getPlayerName(source).."#C80000 adlı oyuncu "..getGroupMemberName(Account).." adlı oyuncunun rütbesini yükseltti. | Rütbe ("..newRankName..") Sebep ("..Reason..").", player, 255, 255, 0, true)
					end
				end
				if player then
					setElementData(player, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(player)})
				end
			end
		else
			exports.GTIhud:dm("(Klan) Rütbe yükseltme yetkiniz yok.", source, 255, 0, 0,true)
		end
	elseif cmd == "Düşür" and groupName then
		if doesPlayerHavePermission(source, 1) then
			if accountName == Account then
				exports.GTIhud:dm("(Klan) Kendi rütbeni düşüremezsin.",source, 255, 0, 0,true)
			elseif newRankName == "Klandan At" then
				if founderaccount == Account then exports.GTIhud:dm("(Klan)  Klan sahibini klandan atamazsın", source,255, 0, 0,true) return end
				if doesPlayerHavePermission(source, 3) then
					for i, player in ipairs(getElementsByType("player")) do
						if getElementData(player, "Group") == groupName then
							outputChatBox("* (Klan) #C80000"..getPlayerName(source).." adlı oyuncu "..getGroupMemberName(Account).." adlı oyuncuyu klandan attı. Sebep ("..Reason..").", player, 255, 255, 0, true)
							outputChatBox("* (Klan) "..getGroupMemberName(Account).." adlı oyuncu klandan ayrıldı.", player, 255, 255, 0, true)
						end
					end
					local result = dbPoll(dbQuery(db, "SELECT group_members FROM groups WHERE group_name = ?", groupName), -1)
					dbExec(db, "DELETE FROM group_members WHERE member_account = ? AND group_name = ?", Account, groupName)
					dbExec(db, "UPDATE groups SET group_members = ? WHERE group_name = ?", result[1]["group_members"] - 1, groupName)
					triggerClientEvent(source, "myGroupList", source, getGroupMembers(groupName), data)
					if player then
						setElementData(player, "Group", false)
						setElementData(player, "GroupRank", false)
					end
					groupAddNewHistoryLog ( groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..getGroupMemberName(Account)..")["..Account.."] adlı oyuncuyu klandan attı. Sebep ("..Reason..")")
				else
					exports.GTIhud:dm("(Klan) Üyeyi klandan atmak için yetkiniz yok.",source, 255, 0, 0,true)
				end
			else
				if founderaccount == Account then exports.GTIhud:dm("(Klan)  Klan sahibinin rütbesini düşüremezsin", source,255, 0, 0,true) return end
				dbExec(db, "UPDATE group_members SET member_rank = ? WHERE group_name = ? AND member_rank = ? AND member_account = ?", newRankName, groupName, currentRankName, Account)
				groupAddNewHistoryLog ( groupName, "("..getPlayerName( source )..")["..getAccountName(getPlayerAccount(source)).."] adlı oyuncu ("..getGroupMemberName(Account)..")["..Account.."] adlı oyuncunun rütbesini ("..currentRankName..") adlı rütbeden ("..newRankName..") adlı rütbeye düşürdü. Sebep ("..Reason..")")
				triggerClientEvent(source, "myGroupList", source, getGroupMembers(groupName), data)
				for i, player in ipairs(getElementsByType("player")) do
					if getElementData(player, "Group") == groupName then
						outputChatBox("* (Klan) #C80000"..getPlayerName(source).." #C80000adlı oyuncu "..getGroupMemberName(Account).." adlı oyuncunun rütbesin "..newRankName.." yaptı. Sebep ("..Reason..").", player, 255, 255, 0, true)
					end
				end
				if player then
					setElementData(player, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(player)})
				end
			end
		else
			exports.GTIhud:dm("(Klan) Rütbe düşürme yetkiniz yok.", source, 255, 0, 0,true)
		end

	end
end)


addCommandHandler("groupmanager",
function(player)
	local serial = getPlayerSerial(player)
	if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin")) then
		local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, turf_points, group_owner FROM groups"), -1)
		if type(result) == "table" then
			triggerClientEvent(player, "OpenGroupManager", player, result)
		end
	end
end)

addEvent("setGroupMemberLimit", true)
addEventHandler("setGroupMemberLimit", root,
function(name, NewLimit)
	if IsGroupExists(name) then
		local CurrentMember = getGroupMemberLimit(name)
		if CurrentMember <= tonumber(NewLimit) then
			dbExec(db, "UPDATE groups SET members_limit = ? WHERE group_name = ?", NewLimit, name)
			local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, turf_points, group_owner FROM groups"), -1)
			triggerClientEvent(source, "OpenGroupManager", source, result, true)
		else
			exports.GTIhud:dm("[Klan Yönetimi] Üye limiti geçerli şuanki üye limitinden düşük olamak.",source, 255, 0, 0,true)
		end
	else
		exports.GTIhud:dm("[Klan Yönetimi] Klan mevcut değil.",source, 255, 0, 0,true)
	end
end)


addEvent("set_Group_M_Turf_Points", true)
addEventHandler("set_Group_M_Turf_Points", root,
function (GroupName, points)
	if IsGroupExists(GroupName) then
		if string.find (points, "-") then
			dbExec(db, "UPDATE groups SET turf_points = ? WHERE group_name = ?", getGroupTurfPoints(GroupName)-tonumber(points), GroupName)
			local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, turf_points, group_owner FROM groups"), -1)
			triggerClientEvent(source, "OpenGroupManager", source, result, true)
		elseif string.find (points, "+") then
			dbExec(db, "UPDATE groups SET turf_points = ? WHERE group_name = ?", getGroupTurfPoints(GroupName)+tonumber(points), GroupName)
			local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, turf_points, group_owner FROM groups"), -1)
			triggerClientEvent(source, "OpenGroupManager", source, result, true)
		else
			dbExec(db, "UPDATE groups SET turf_points = ? WHERE group_name = ?", tonumber(points), GroupName)
			local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, turf_points, group_owner FROM groups"), -1)
			triggerClientEvent(source, "OpenGroupManager", source, result, true)
		end
	end
end
)

addEvent("klanTag", true)
addEventHandler("klanTag", root, function (klanTagi)
	if klanTagi then
		if klanTagi == "" then return outputChatBox("Klan tagında boşluk bırakmayın !", source, 255,0,0, true) end
        if klanTagi == " " then return outputChatBox("Klan tagında boşluk bırakmayın !", source, 255,0,0, true) end
        if klanTagi == "  " then return outputChatBox("Klan tagında boşluk bırakmayın !", source, 255,0,0, true) end
        if klanTagi == "   " then return outputChatBox("Klan tagında boşluk bırakmayın !", source, 255,0,0, true) end
        if klanTagi == "    " then return outputChatBox("Klan tagında boşluk bırakmayın !", source, 255,0,0, true) end
        if klanTagi == "     " then return outputChatBox("Klan tagında boşluk bırakmayın !", source, 255,0,0, true) end
     	local para = getPlayerMoney(source)
     	if para >= 100000 then
    if getElementData(source, "Group") then
    	local klanIsim = getElementData(source, "Group")
		dbExec(db, "UPDATE groups SET KlanTag = ? WHERE group_name = ?", klanTagi, klanIsim)
		outputChatBox("Klan tagı başarıyla değiştirildi", source, 0,255,0, true)
		takePlayerMoney(source, 100000)
	end
else
	outputChatBox("Klan tagını değiştirmek için 100.000$ ihtiyacınız var !", source, 255,0,0, true)
	end
	end
end)

addEvent("klanTagEtkinlestir", true)
addEventHandler("klanTagEtkinlestir", root, function (etkin)
	if etkin == true then
		local hesap = getPlayerAccount ( source )
		setAccountData (hesap, "KlanTagiEtkin", etkin )
	else
		local hesap = getPlayerAccount ( source )
		setAccountData (hesap, "KlanTagiEtkin", etkin )
	end
end)

addEvent("setGroupName", true)
addEventHandler("setGroupName", root,
function(name, NewName)
	if IsGroupExists(name) then
		if isHasSpace(NewName) then
			exports.GTIhud:dm("[Klan Yönetimi] Klan isminde boşluk bırakmayın.",source, 255, 40, 0,true)
		elseif not isASCII(NewName) then
			exports.GTIhud:dm("[Klan Yönetimi] Klan isminde sadece ingilizce harfler olmalıdır.",source, 255, 40, 0,true)
		elseif IsGroupExists(NewName) then
			exports.GTIhud:dm("[Klan Yönetimi] "..NewName.." adlı klan zaten var.", source,255, 0, 0,true)
		else
			dbExec(db, "UPDATE groups SET group_name = ? WHERE group_name = ?", NewName, name)
			dbExec(db, "UPDATE group_ranks SET group_name = ? WHERE group_name = ?", NewName, name)
			dbExec(db, "UPDATE group_members SET group_name = ? WHERE group_name = ?", NewName, name)
			dbExec(db, "UPDATE group_invite SET group_name = ? WHERE group_name = ?", NewName, name)
			dbExec(db, "UPDATE group_history SET group_name = ? WHERE group_name = ?", NewName, name)
			dbExec(db, "UPDATE group_blackaccount SET group_name = ? WHERE group_name = ?", NewName, name)
			dbExec(db, "UPDATE group_blackserial SET group_name = ? WHERE group_name = ?", NewName, name)
			local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, turf_points, group_owner FROM groups"), -1)
			triggerClientEvent(source, "OpenGroupManager", source, result, true)
			for _, player in ipairs(getElementsByType("player")) do
				if getElementData(player, "Group") == name then
					setElementData(player, "Group", NewName)
				end
			end
		end
	else
		exports.GTIhud:dm("[Klan Yönetimi] Klan mevcut değil.",source, 255, 0, 0,true)
	end
end)

addEvent("Delete_Group", true)
addEventHandler("Delete_Group", root,
function(GroupName)
	if not IsGroupExists(GroupName) then
		exports.GTIhud:dm(source, "[Klan Yönetimi] Klan mevcut değil.",source, 255, 0, 0,true)
	else
		dbExec(db, "DELETE FROM groups WHERE group_name = ?", GroupName)
		dbExec(db, "DELETE FROM group_ranks WHERE group_name = ?", GroupName)
		dbExec(db, "DELETE FROM group_members WHERE group_name = ?", GroupName)
		dbExec(db, "DELETE FROM group_invite WHERE group_name = ?", GroupName)
		dbExec(db, "DELETE FROM group_history WHERE group_name = ?", GroupName)
		dbExec(db, "DELETE FROM group_blackaccount WHERE group_name = ?", GroupName)
		dbExec(db, "DELETE FROM group_blackserial WHERE group_name = ?", GroupName)
		local result = dbPoll(dbQuery(db, "SELECT group_name, group_members, members_limit, turf_points, group_owner FROM groups"), -1)
		triggerClientEvent(source, "OpenGroupManager", source, result, true)
		for i, player in pairs(getElementsByType("player")) do
			if getElementData(player, "Group") == GroupName then
				setElementData(player, "Group", false)
				setElementData(player, "GroupRank", false)
			end
		end
	end
end)

addEvent("Request_Group_History", true )
addEventHandler("Request_Group_History", root,
function ()
	local Name = getPlayerGroup(source)
	local MyGroupHistory = getGroupHistoryLog( Name )
	triggerClientEvent("Set_Group_History", source, MyGroupHistory)
end
)

addEvent("Request_Group_MembersList", true)
addEventHandler("Request_Group_MembersList", root,
function(name)
	local member = getGroupMembers(name)
	local data = data()
	triggerClientEvent(source, "ViewGroupMember", source, member, data)
end)

addEvent("Request_Group_Info", true)
addEventHandler("Request_Group_Info", root,
function(name)
	triggerClientEvent(source, "Send_Group_Info", source, getGroupInfo(name))
end)

addEvent("Change_Group_Info", true)
addEventHandler("Change_Group_Info", root,
function(name, Text)
	if IsGroupExists(name) then
		dbExec(db, "UPDATE groups SET group_info = ? WHERE group_name = ?", Text, name)
		exports.GTIhud:dm("[Klan Yönetimi] Klan Bilgisi Başarıyla Güncellendi!",source, 0, 255, 0,true)
	else
		exports.GTIhud:dm("[Klan Yönetimi] Klan mevcut değil.", source,255, 0, 0,true)
	end
end)

addEvent("get_Group_InviteList", true)
addEventHandler("get_Group_InviteList", root,
function(name)
	local h = dbQuery(db, "SELECT * FROM group_invite WHERE group_name = ?", name)
	local result = dbPoll(h, -1)
	if type(result) == "table" and #result ~= 0 then
		triggerClientEvent(source, "Send_Group_InviteList", source, result)
	end
end)

addEvent("Delete_Invite", true)
addEventHandler("Delete_Invite", root,
function(name,To,From)
	dbExec(db, "DELETE FROM group_invite WHERE group_name = ? AND player_account = ? AND byy = ?", name, To, From)
	local h = dbQuery(db, "SELECT * FROM group_invite WHERE group_name = ?", name)
	local result = dbPoll(h, -1)
	triggerClientEvent(source, "Send_Group_InviteList", source, result)
end)

addEvent("get_Group_Manager_Blacklist", true)
addEventHandler("get_Group_Manager_Blacklist", root,
function (GroupName)
	local Accounts = getGroupBlockedAccounts(GroupName)
	local Serials = getGroupBlockedSerials(GroupName)
	triggerClientEvent("set_Group_Manager_Blacklist_Serial", source, Serials)
	triggerClientEvent("set_Group_Manager_Blacklist_Account", source, Accounts)
end
)

addEvent("UnBlock_Member_By_Manager", true)
addEventHandler("UnBlock_Member_By_Manager", root,
function (GroupName, member)
	dbExec(db, "DELETE FROM group_blackaccount WHERE group_name = ? AND account_name = ?", GroupName, member)
	exports["guimessages"]:outputServer(source, "(Klan) The Account Was UnBlocked Successfully.",255,255,0)
	local Accounts = getGroupBlockedAccounts(GroupName)
	local Serials = getGroupBlockedSerials(GroupName)
	triggerClientEvent("set_Group_Manager_Blacklist_Serial", source, Serials)
	triggerClientEvent("set_Group_Manager_Blacklist_Account", source, Accounts)
end
)

addEventHandler("onPlayerLogin", getRootElement(), function ()
	local hesap = getPlayerAccount ( source )
	local klanTagDurum = getAccountData(hesap, "KlanTagiEtkin")
	if hesap then
		if getAccountData(hesap, "KlanTagiEtkin") == true then
		local durum = getAccountData(hesap, "KlanTagiEtkin")
		triggerClientEvent(source,"KlanTags",source,durum)
		end
	end
end)



addEvent("blip:olusutur", true)
addEventHandler("blip:olusutur", getRootElement(), function (x, y, z, klan)
	for _, player in ipairs(getElementsByType("player")) do
	if getElementData(player, "Group") == false then return end
		if getElementData(player, "Group") == klan then  
		triggerClientEvent(player, "blip:olustur", player, source, x, y, z, klan)
		end
	end
end)

addEvent("blip:kaldir", true)
addEventHandler("blip:kaldir", getRootElement(), function (klan)
	for _, player in ipairs(getElementsByType("player")) do
		if getElementData(player, "Group") == false then return end
		if getElementData(player, "Group") == klan then  
		triggerClientEvent(player, "blip:kaldir", player, source)
		end
	end
end)