-- local discordWebhookURL = "https://discord.com/api/webhooks/864164449094336566/oqSsGOdpRrFHngmJrCpXtyo8xUnyvQ-5fMv-xUll6qbOFVepSpqE6L4xsWm3u2MAGoPU"

-- function sendDiscordMessage(message)
-- sendOptions = {
    -- formFields = {
        -- content="```"..message.."```"
    -- },
-- }
-- fetchRemote ( discordWebhookURL, sendOptions, WebhookCallback )
-- end

-- function WebhookCallback(responseData) 
-- end

-- fetchRemote("http://checkip.dyndns.com/",function(rd,errno)
    -- if errno == 0 and rd ~= "ERROR" then
		-- outputDebugString("Lisans onaylanıyor...")
        -- local ip = rd:match("<body>Current IP Address: (.-)</body>")
        -- local server = getServerName()
        -- local sc = "TurfDoruk"
        -- local yazi = "["..sc.."]["..ip.."]["..server.."] %s"
        -- callRemote ("http://castilisans.000webhostapp.com/mta/ip_kontrol.php", function(cevap)
		-- if cevap == "ERROR" then 
		-- outputDebugString("Lisans onaylanmadı !")
			-- local msg = server.." adlı sunucunun "..sc.." lisansı onaylanmadı !"
			-- sendDiscordMessage(msg)
		-- return end
		-- if cevap == nil then 
		-- outputDebugString("Lisans onaylanmadı !")
			-- local msg = server.." adlı sunucunun "..sc.." lisansı onaylanmadı !"
			-- sendDiscordMessage(msg)
		-- return end
            -- if cevap then
			-- outputDebugString("Lisans onaylandı = )")
			-- local msg = server.." adlı sunucunun "..sc.." lisansı başarıyla onaylandı !"
			-- sendDiscordMessage(msg)
            -- scriptiBaslat()
            -- end
            -- callRemote ("http://castilisans.000webhostapp.com/mta/startlog.php", function() end,string.format(yazi,cevap and "Kontrol Saglandi" or "Kontrol Saglanmadi"))
        -- end, sc,ip )
    -- end
-- end)

-- function scriptiBaslat()

local RadarAreasTurf = {};
local RadarAreaColTurf = {};
local MainDB = dbConnect("sqlite", "TurfDB.db");
local isStorageExistent


local AreaPosition = {
	{aPosX = 2777.515, aPosY = 833.628, aSizeX = 115, aSizeY = 189.304, spawn = {2891.078, 912.008, 9.898, 0}},
	{aPosX = 2758.526, aPosY = 1224.066, aSizeX = 180, aSizeY = 158.261, spawn = {2857.239, 1297.781, 10.391, 0}},
	{aPosX = 2135.655, aPosY = 630.327, aSizeX = 284.100, aSizeY = 125.607, spawn = {1399.510, 666.488, 10.023, 0}},
	{aPosX = 2238.116, aPosY = 2723.884, aSizeX = 156.694, aSizeY = 98.906, spawn = {2244.140, 2821.667, 9.820, 0}},
	{aPosX = 1698.271, aPosY = 2724.686, aSizeX = 217.874, aSizeY = 157.281, spawn = {1848.561, 2837.922, 9.836, 0}},
	{aPosX = 918.288, aPosY = 2043.859, aSizeX = 78.217, aSizeY = 138.449, spawn = {930.424, 2093.204, 9.820, 0}},
	{aPosX = 1022.773, aPosY = 1383.665, aSizeX = 153.277, aSizeY = 318.214, spawn = {1164.665, 1528.324, 4.820, 0}},
	{aPosX = 1381.591, aPosY = 912.655, aSizeX = 114.990, aSizeY = 209.644, spawn = {1433.822, 1099.618, 9.820, 0}},
}

do isStorageExistent = dbPoll( MainDB:query("SELECT * FROM turfs"), -1) and true end

function getTurfInfoFromStorage(ID)
	if isStorageExistent then
		local result  = dbPoll( MainDB:query("SELECT * FROM turfs WHERE ID = ?", tostring(ID)), -1);
		if result and #result > 0 then
			return result[1]
		end
	end
	return false
end

for i, M in ipairs(AreaPosition) do
	local TurfArea = createRadarArea(M["aPosX"], M["aPosY"], M["aSizeX"], M["aSizeY"], 255, 255, 255, 175);
	local TurfAreaCol = createColRectangle(M["aPosX"], M["aPosY"], M["aSizeX"], M["aSizeY"]);
	if not isStorageExistent then
		RadarAreasTurf[TurfArea] = {
			ID = i,
			["Loyalty"] = { {"", 0, {255, 255, 255}}, {"", 0, {255, 255, 255}}},
			["WRNNING"] = {},
			["Spawn"] = {false, {M["spawn"][1], M["spawn"][2], M["spawn"][3], M["spawn"][4]}} 
		};
	else
		local info = getTurfInfoFromStorage(i);
		local r, g, b = unpack(fromJSON(info["color"]));
		local loyalty = fromJSON(info["loyalty"]);
		local spawn = fromJSON(info["spawn"]);
		setRadarAreaColor(TurfArea, r, g, b, 175);
		RadarAreasTurf[TurfArea] = {
			ID = i,
			["Loyalty"] = loyalty,
			["WRNNING"] = {},
			["Spawn"] = {spawn, {M["spawn"][1], M["spawn"][2], M["spawn"][3], M["spawn"][4]}}
		};
	end
	RadarAreaColTurf[TurfAreaCol] = TurfArea
	addEventHandler("onColShapeHit", TurfAreaCol,
	function(player)
		if getElementType(player) == "player" then
			local Area = RadarAreaColTurf[source]
			local Group = player:getData("Group");
			local oA = RadarAreasTurf[Area]["Loyalty"][1][1]
			local LA = RadarAreasTurf[Area]["Loyalty"][1][2]
			local r1, g1, b1 = RadarAreasTurf[Area]["Loyalty"][1][3][1], RadarAreasTurf[Area]["Loyalty"][1][3][2], RadarAreasTurf[Area]["Loyalty"][1][3][3]
			local oB = RadarAreasTurf[Area]["Loyalty"][2][1]
			local LB = RadarAreasTurf[Area]["Loyalty"][2][2]
			setElementData(player, "turf:etkin", true)
			local r2, g2, b2 = RadarAreasTurf[Area]["Loyalty"][2][3][1], RadarAreasTurf[Area]["Loyalty"][2][3][2], RadarAreasTurf[Area]["Loyalty"][2][3][3]
			if oA ~= "" and LA > 0 then player:setData("TurfStat1", {oA..": "..LA.."%", {r1, g1, b1}}) else player:setData("TurfStat1", false) end
			if oB ~= "" and LB > 0 then player:setData("TurfStat2", {oB..": "..LB.."%", {r2, g2, b2}}) else player:setData("TurfStat2", false) end
			if getElementData(player, "TurfStat1") then
				setPedWearingJetpack ( player, false )
			end
			if getElementData(player, "TurfStat2") then
				setPedWearingJetpack ( player, false )
			end
			if getElementData(player, "megaziplama") then
				killPed(player)
			end
			if getElementData(player,"oyuncugod.durum") == true then 
				killPed(player)
			end
		end
	end, false);
	addEventHandler("onColShapeLeave", TurfAreaCol,
	function(player)
		if getElementType(player) == "player" then
			player:setData("TurfStat1", false);
			player:setData("TurfStat2", false);
			setTimer(function()
			setElementData(player, "turf:etkin", false)
			end, 3000, 1)
		end
	end, false);
end

addEvent("setPlayerAlpha150", true)
addEventHandler("setPlayerAlpha150", getRootElement(), 
function()
   setElementAlpha (source,150)
end
)

addEvent("setPlayerAlpha255", true)
addEventHandler("setPlayerAlpha255", getRootElement(), 
function()
    setElementAlpha (source,255)
end
)

addEventHandler("onPlayerWasted", root,
function()
	local x, y, z = getElementPosition(source);
	source:setData("LastPosition", {x, y, z}, false);
	source:setData("LastTown", getElementZoneName(source, true), false);
end );

function getGroupsTurf(L)
	local Table = {};
	local sTable = {};
	for Col, Area in pairs(RadarAreaColTurf) do
		if RadarAreasTurf[Area]["Loyalty"][1][2] >= L then
			if L == 50 then
				table.insert(Table, 
				{
					RadarAreasTurf[Area]["Loyalty"][1][1]
				} );
			else
				if RadarAreasTurf[Area]["Spawn"][1] == true then
					table.insert(sTable, 
					{
						RadarAreasTurf[Area]["Spawn"][2][1],
						RadarAreasTurf[Area]["Spawn"][2][2],
						RadarAreasTurf[Area]["Spawn"][2][3],
						RadarAreasTurf[Area]["Spawn"][2][4],
						RadarAreasTurf[Area]["Loyalty"][1][1]
					} );
				end
			end
		elseif RadarAreasTurf[Area]["Loyalty"][2][2] >= L then
			if L == 50 then
				table.insert(Table, 
				{
					RadarAreasTurf[Area]["Loyalty"][2][1]
				} );
			else
				if RadarAreasTurf[Area]["Spawn"][1] == true then
					table.insert(sTable,
					{
						RadarAreasTurf[Area]["Spawn"][2][1],
						RadarAreasTurf[Area]["Spawn"][2][2],
						RadarAreasTurf[Area]["Spawn"][2][3],
						RadarAreasTurf[Area]["Spawn"][2][4],
						RadarAreasTurf[Area]["Loyalty"][2][1]
					} );
				end
			end
		end
	end
	local tTable = {};
	for i, M in pairs(Table) do
		if not tTable[M[1]] then
			tTable[M[1]] = 1
		else
			tTable[M[1]] = tTable[M[1]] + 1
		end
	end
	return {tTable, sTable};
end

function getGroupOnlineMember(group)
	local Table = {};
	for i, player in ipairs(getElementsByType("player")) do
		if player:getData("Group") == group then
			table.insert(Table, player);
		end
	end
	return Table
end

addEventHandler("onPlayerSpawn", root,
function()
	local Table = {};
	if source:getData("LegalStatus") ~= "Free" then return end
	if source:getData("LastTown") ~= "Las Venturas" then return end
	if getPlayerTeam(source) == getTeamFromName("Police") then return end
	local Group = source:getData("Group");
	local Pos = source:getData("LastPosition");
	local x, y, z = Pos[1], Pos[2], Pos[3]
	local Areas = getGroupsTurf(90)[2]
	table.insert(Table,
	{
		1607.5,
		1825.7,
		10.8,
		0,
		getDistanceBetweenPoints3D(x, y, z, math.random(1600, 1615), 1825.7, 10.8), 
		"Gta-IS"
	} );
	for G, X in pairs(Areas) do
		local dist = getDistanceBetweenPoints3D(x, y, z, X[1], X[2], X[3]);
		table.insert(Table, 
		{
			X[1],
			X[2],
			X[3],
			X[4],
			dist,
			X[5]
		} );
	end
	if #Table == 0 then return end
	table.sort(Table, function(a,b) return a[5] < b[5] end);
	for i = 1, #Table do
		if Table[i][6] == Group or Table[i][6] == "Gta-IS" then
			setElementPosition(source, Table[i][1], Table[i][2], Table[i][3]);
			setPedRotation(source, Table[i][4]);
			setTimer(function(source) setCameraTarget(source) end, 4000, 1, source);
			exports.GTIhud:dm("#FF9600[Turf] #74B3FFEn yakın Turf bölgenizde doğdunuz.", source,	0, 255, 255);
			break
		end
	end
end );

addEventHandler("onPlayerWasted", root,
function(_, killer)
	if killer and getElementType(killer) == "player" then
		local KGroup = killer:getData("Group");
		local SGroup = source:getData("Group");
		local x, y, z = getElementPosition(killer);
		local xs, ys, zs = getElementPosition(source);
		if z < 45 and z >= 1 and zs < 45 and zs >= 1 and getElementZoneName(killer, true) == "Las Venturas" then
			if not isPedInVehicle(killer) then
				if getElementDimension(killer) == 0 and getElementInterior(killer) == 0 then
					for Col, Area in pairs(RadarAreaColTurf) do
						if RadarAreasTurf[Area]["Loyalty"][1][1] == KGroup and RadarAreasTurf[Area]["Loyalty"][2][1] == SGroup then
							for i, player in ipairs(getElementsWithinColShape(Col, "player")) do
								if killer == player then
									local oA = RadarAreasTurf[Area]["Loyalty"][1][1]
									local LA = RadarAreasTurf[Area]["Loyalty"][1][2]
									local r1, g1, b1 = RadarAreasTurf[Area]["Loyalty"][1][3][1], RadarAreasTurf[Area]["Loyalty"][1][3][2], RadarAreasTurf[Area]["Loyalty"][1][3][3]
									local oB = RadarAreasTurf[Area]["Loyalty"][2][1]
									local LB = RadarAreasTurf[Area]["Loyalty"][2][2]
									local r2, g2, b2 = RadarAreasTurf[Area]["Loyalty"][2][3][1], RadarAreasTurf[Area]["Loyalty"][2][3][2], RadarAreasTurf[Area]["Loyalty"][2][3][3]
									RadarAreasTurf[Area]["Loyalty"][1][2] = RadarAreasTurf[Area]["Loyalty"][1][2] + 5
									RadarAreasTurf[Area]["Loyalty"][2][2] = RadarAreasTurf[Area]["Loyalty"][2][2] - 5
									if LB > 100 then
										RadarAreasTurf[Area]["Loyalty"][2][2] = 100
									end
									if LA > 100 then
										RadarAreasTurf[Area]["Loyalty"][1][2] = 100
									end
									if LB < 0 then
										RadarAreasTurf[Area]["Loyalty"][2][2] = 0
									end
									if LA < 0 then
										RadarAreasTurf[Area]["Loyalty"][1][2] = 0
									end
									local NewoA = RadarAreasTurf[Area]["Loyalty"][1][1]
									local NewLA = RadarAreasTurf[Area]["Loyalty"][1][2]
									local NewoB = RadarAreasTurf[Area]["Loyalty"][2][1]
									local NewLB = RadarAreasTurf[Area]["Loyalty"][2][2]
									if NewoA ~= "" and NewLA > 0 then killer:setData("TurfStat1", {NewoA..": "..NewLA.."%", {r1, g1, b1}}) else killer:setData("TurfStat1", false) end
									if NewoB ~= "" and NewLB > 0 then killer:setData("TurfStat2", {NewoB..": "..NewLB.."%", {r2, g2, b2}}) else killer:setData("TurfStat2", false) end
									if NewoA ~= "" and NewLA > 0 then source:setData("TurfStat1", {NewoA..": "..NewLA.."%", {r1, g1, b1}}) else source:setData("TurfStat1", false) end
									if NewoB ~= "" and NewLB > 0 then source:setData("TurfStat2", {NewoB..": "..NewLB.."%", {r2, g2, b2}}) else source:setData("TurfStat2", false) end
									-- exports["guimessages"]:outputServer(killer, "#FF9600[Turf] #00FF00Bölgenizi savundunuz", 0, 255, 255);
									-- exports["guimessages"]:outputServer(source, "#FF9600[Turf] #00FF00Turf bölgenizde öldürüldünüz", 0, 255, 255);
								end
							end
						end
						if RadarAreasTurf[Area]["Loyalty"][1][1] == SGroup and RadarAreasTurf[Area]["Loyalty"][2][1] == KGroup then
							for i, player in ipairs(getElementsWithinColShape(Col, "player")) do
								if killer and getElementType(killer) == "player" and killer == player then
									local oA = RadarAreasTurf[Area]["Loyalty"][1][1]
									local LA = RadarAreasTurf[Area]["Loyalty"][1][2]
									local r1, g1, b1 = RadarAreasTurf[Area]["Loyalty"][1][3][1], RadarAreasTurf[Area]["Loyalty"][1][3][2], RadarAreasTurf[Area]["Loyalty"][1][3][3]
									local oB = RadarAreasTurf[Area]["Loyalty"][2][1]
									local LB = RadarAreasTurf[Area]["Loyalty"][2][2]
									local r2, g2, b2 = RadarAreasTurf[Area]["Loyalty"][2][3][1], RadarAreasTurf[Area]["Loyalty"][2][3][2], RadarAreasTurf[Area]["Loyalty"][2][3][3]
									RadarAreasTurf[Area]["Loyalty"][1][2] = RadarAreasTurf[Area]["Loyalty"][1][2] - 5
									RadarAreasTurf[Area]["Loyalty"][2][2] = RadarAreasTurf[Area]["Loyalty"][2][2] + 5
									if LB > 100 then
										RadarAreasTurf[Area]["Loyalty"][2][2] = 100
									end
									if LA > 100 then
										RadarAreasTurf[Area]["Loyalty"][1][2] = 100
									end
									if LB < 0 then
										RadarAreasTurf[Area]["Loyalty"][2][2] = 0
									end
									if LA < 0 then
										RadarAreasTurf[Area]["Loyalty"][1][2] = 0
									end
									local NewoA = RadarAreasTurf[Area]["Loyalty"][1][1]
									local NewLA = RadarAreasTurf[Area]["Loyalty"][1][2]
									local NewoB = RadarAreasTurf[Area]["Loyalty"][2][1]
									local NewLB = RadarAreasTurf[Area]["Loyalty"][2][2]
									if NewoA ~= "" and NewLA > 0 then killer:setData("TurfStat1", {NewoA..": "..NewLA.."%", {r1, g1, b1}}) else killer:setData("TurfStat1", false) end
									if NewoB ~= "" and NewLB > 0 then killer:setData("TurfStat2", {NewoB..": "..NewLB.."%", {r2, g2, b2}}) else killer:setData("TurfStat2", false) end
									if NewoA ~= "" and NewLA > 0 then source:setData("TurfStat1", {NewoA..": "..NewLA.."%", {r1, g1, b1}}) else source:setData("TurfStat1", false) end
									if NewoB ~= "" and NewLB > 0 then source:setData("TurfStat2", {NewoB..": "..NewLB.."%", {r2, g2, b2}}) else source:setData("TurfStat2", false) end
									-- exports["guimessages"]:outputServer(killer, "#FF9600[Turf] #00FF00You've defended your land +[#00FF00 5%  #00FF00] turfing", 0, 255, 255);
									-- exports["guimessages"]:outputServer(source, "#FF9600[Turf] #00FF00You've Killed trying to turf Area -[#FF0000 5%  #00FF00] turfing", 0, 255, 255);
								end
							end
						end
	    			end
				else
					-- exports["guimessages"]:outputServer(killer,"#FF9600[Turf] #FF0000You can't turf with killing when you are in Interior", 0, 255, 255);
				end
			else
				-- exports["guimessages"]:outputServer(killer,"#FF9600[Turf] #FF0000You can't turf with killing when you are in vehicle.", 0, 255, 255);
			end
		end
	end
end );

addEventHandler("onResourceStart", resourceRoot,
function ()
	dbExec(MainDB, "CREATE TABLE IF NOT EXISTS turfs ( ID, color, loyalty, spawn)");
end );

addEventHandler("onResourceStop", resourceRoot,
function ()
	if not isStorageExistent then
		dbExec(MainDB, "CREATE TABLE IF NOT EXISTS turfs ( ID, color, loyalty, spawn)");
	end
	for radarArea, info in pairs(RadarAreasTurf) do
		local ID = tostring(info["ID"]);
		local color = toJSON({getRadarAreaColor(radarArea)});
		local loyalty = toJSON(info["Loyalty"]);
		local spawn = toJSON(info["Spawn"][1]);
		if isStorageExistent then
			dbExec(MainDB, "UPDATE turfs SET color=?, loyalty=?, spawn=? WHERE ID=?", color, loyalty, spawn, ID );
		else
			dbExec(MainDB, "INSERT INTO turfs (ID, color, loyalty, spawn) VALUES ( ?, ?, ?, ? )", ID, color, loyalty, spawn );
		end
	end
end );
 

function isTurfAlliances(player, groupName)
	local GroupAlliances = player:getData("GroupAlliances");
	if GroupAlliances and type(GroupAlliances) == "table" then
		for i, value in pairs(GroupAlliances) do
			if value["status"] == 1 then
				if value["group_name1"] == groupName or value["group_name2"] == groupName then
					return true
				end
			end
		end
	end
end

function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

function puanVer(G,X)
	if X == 4 then
	print("4")
	points = getGroupTurfPoints(G)
	setGroupTurfPoints(G, points+1)
	end
	if X == 5 then
	print("5")
	points = getGroupTurfPoints(G)
	setGroupTurfPoints(G, points+2)
	end
	if X == 6 then
	print("6")
	points = getGroupTurfPoints(G)
	setGroupTurfPoints(G, points+3)
	end
	if X == 7 then
	print("7")
	points = getGroupTurfPoints(G)
	setGroupTurfPoints(G, points+4)
	end
	if X == 8 then
	print("8")
	points = getGroupTurfPoints(G)
	setGroupTurfPoints(G, points+5)
	end
end

gMoneyTime = 0

setTimer(function()
	gMoneyTime = gMoneyTime + 1
	if gMoneyTime == 30 then
		gMoneyTime = 0
		for G, X in pairs(getGroupsTurf(50)[1]) do
			local OnlineMember = getGroupOnlineMember(G)
			if getPlayerCount() < 20 then outputChatBox("Sunucuda kişi sayısı 20 ve altı olduğunda turf gelirleri kapatılır.", root, 255,0,0, true) return end 
					MoneyPerOnlineMember = X*50
					puanVer(G,X)
			for i, player in ipairs(OnlineMember) do
				local x, y, z = getElementPosition(player)
				if getZoneName(x, y, z, true) == "Las Venturas" then
					
					local altini = getElementData(player, "altin") or 0
					setElementData(player, "altin", tonumber(altini)+tonumber(MoneyPerOnlineMember))
					
					exports.GTIhud:dm("[Turf] Bölgelerinizden "..MoneyPerOnlineMember.." miktarda altın kazandınız.", player, 219, 0, 0, true)
					exports.GTIhud:dm("[Turf] Bölgelerinizden "..X.." puan kazandınız.", player, 219, 0, 0, true)
					triggerClientEvent(player, "gTurfSound", player)
					
					local hesap = getAccountName(getPlayerAccount(player))
					for _, v in ipairs(exports.mysql:query("SELECT * FROM hesap")) do
						if hesap == v.Kullanici_adi then 
							if v.turf_puan == false then
								exports.mysql:exec("UPDATE hesap SET turf_puan=? WHERE Kullanici_adi=?", X, hesap)
							else
								exports.mysql:exec("UPDATE hesap SET turf_puan=?, altin=? WHERE Kullanici_adi=?", v.turf_puan+X, getElementData(player, "altin"), hesap)
							end
						end
					end
					else 
					exports.GTIhud:dm("[Turf] Las Venturas şehrinde olmadığınız için turf parası alamıyorsunuz !", player, 219, 0, 0, true)
				end
			end
		end
	end
	for Col, Area in pairs(RadarAreaColTurf) do
		for i, player in ipairs(getElementsWithinColShape(Col, "player")) do
			if isPedDead(player) == false and getElementDimension(player) == 0 and getElementInterior(player) == 0 then
				if getElementData(player, "TurfStat1") then
				setPedWearingJetpack ( player, false )
				setPedAnimation(player)
			end
			if getElementData(player, "TurfStat2") then
				setPedWearingJetpack ( player, false )
				setPedAnimation(player)
			end
				local Group = player:getData("Group");
				if Group then
					if getElementData(player,"BandTurf") then exports.GTIhud:dm("[Turf] Bölge alamazsınız çünkü yasaklandınız !", 219, 0, 0, true) return end
					if not isPedInVehicle(player) then
						local x, y, z = getElementPosition(player);
						if z < 45 and z >= 1 and not doesPedHaveJetPack(player) then
							local oA = RadarAreasTurf[Area]["Loyalty"][1][1]
							local LA = RadarAreasTurf[Area]["Loyalty"][1][2]
							local r1, g1, b1 = RadarAreasTurf[Area]["Loyalty"][1][3][1], RadarAreasTurf[Area]["Loyalty"][1][3][2], RadarAreasTurf[Area]["Loyalty"][1][3][3]
							local oB = RadarAreasTurf[Area]["Loyalty"][2][1]
							local LB = RadarAreasTurf[Area]["Loyalty"][2][2]
							local r2, g2, b2 = RadarAreasTurf[Area]["Loyalty"][2][3][1], RadarAreasTurf[Area]["Loyalty"][2][3][2], RadarAreasTurf[Area]["Loyalty"][2][3][3]
							if (Group ~= oA and LA >= 50 and isTurfAlliances(player, oA)) or (Group ~= oB and LB >= 50 and isTurfAlliances(player, oB)) then
								exports.GTIhud:dm("[Turf] İttifak klanın bölgesini alamazsınız!", player, 219, 0, 0, true);
							else
								if LA < 99 and LB < 99 then
								setRadarAreaFlashing(Area, true);
								else
									if isRadarAreaFlashing(Area) then
									setRadarAreaFlashing(Area, false);
									RadarAreasTurf[Area]["WRNNING"] = {};
									end
								end
							end
							if RadarAreasTurf[Area]["WRNNING"][Group] == nil then
								if oA ~= Group and LA > 50 and LA < 75 then
									RadarAreasTurf[Area]["WRNNING"][Group] = true
									for i, p in ipairs(getGroupOnlineMember(oA)) do
										exports.GTIhud:dm("[Turf] Uyarı!! Bölgenizden birisi saldırı altında ! "..Group..".", p, 219, 0, 0, true);
									end
								elseif oB ~= Group and LB > 50 and LB < 75 then
									RadarAreasTurf[Area]["WRNNING"][Group] = true
									for i, p in ipairs(getGroupOnlineMember(oB)) do
										exports.GTIhud:dm("[Turf] Uyarı!! Bölgenizden birisi saldırı altında "..Group..".", p, 219, 0, 0, true);
									end
								end
							end
							if LA < 90 and LB < 90 then
								RadarAreasTurf[Area]["Spawn"][1] = false
							end
							if LA >= 55 and oA == Group then
								if LA == 55 then
									triggerEvent("onGroupTurf", player, Group)
									for i, player in ipairs(getGroupOnlineMember(Group)) do
										exports.GTIhud:dm("[Turf] Artık bölge sizin kontrolünüzde!", player, 219, 0, 0, true);
										-- exports.GTIhud:dm("[Turf] Çevrimiçi Klan üyeleri her 5 dakikada bir $400 kazanacak.", player, 219, 0, 0, true);
										playSoundFrontEnd(player, 101);
									end
								elseif LA == 100 and not RadarAreasTurf[Area]["Spawn"][1] then
									RadarAreasTurf[Area]["Spawn"][1] = true
								end
								setRadarAreaColor(Area, r1, g1, b1, 175);
							elseif LB >= 55 and oB == Group then
								if LB == 55 then
									for i, player in ipairs(getGroupOnlineMember(Group)) do
										triggerEvent("onGroupTurf", player, Group);
										exports.GTIhud:dm("[Turf] Artık bölge sizin kontrolünüzde!", player, 219, 0, 0, true);
										-- exports.GTIhud:dm("[Turf] Çevrimiçi Klan üyeleri her 5 dakikada bir $2000 kazanacak.", player, 219, 0, 0, true);
										playSoundFrontEnd(player, 101);
									end
								elseif LB == 100 and not RadarAreasTurf[Area]["Spawn"][1] then
									RadarAreasTurf[Area]["Spawn"][1] = true
								end
								setRadarAreaColor(Area, r2, g2, b2, 175);
							end
							if oA == "" and oB == "" then
								RadarAreasTurf[Area]["Loyalty"][1][1] = Group
								RadarAreasTurf[Area]["Loyalty"][1][2] = RadarAreasTurf[Area]["Loyalty"][1][2] + 1
								local color = getGroupTurfColor(Group);
								local r, g, b = color[1], color[2], color[3]
								RadarAreasTurf[Area]["Loyalty"][1][3][1] = r
								RadarAreasTurf[Area]["Loyalty"][1][3][2] = g
								RadarAreasTurf[Area]["Loyalty"][1][3][3] = b
							elseif oA == Group and oB == "" and LA < 100 then
									RadarAreasTurf[Area]["Loyalty"][1][2] = RadarAreasTurf[Area]["Loyalty"][1][2] + 1
							elseif oB == Group and oA == "" and LB < 100 then
									RadarAreasTurf[Area]["Loyalty"][2][2] = RadarAreasTurf[Area]["Loyalty"][2][2] + 1
							elseif oA == Group and oB ~= "" and LA < 100 then
								RadarAreasTurf[Area]["Loyalty"][1][2] = RadarAreasTurf[Area]["Loyalty"][1][2] + 1
								RadarAreasTurf[Area]["Loyalty"][2][2] = RadarAreasTurf[Area]["Loyalty"][2][2] - 1
								if RadarAreasTurf[Area]["Loyalty"][2][2] < 0 then
									RadarAreasTurf[Area]["Loyalty"][2][2] = 0
									RadarAreasTurf[Area]["Loyalty"][2][1] = ""
								end
							elseif oB == Group and oA ~= "" and LB < 100 then
								RadarAreasTurf[Area]["Loyalty"][2][2] = RadarAreasTurf[Area]["Loyalty"][2][2] + 1
								RadarAreasTurf[Area]["Loyalty"][1][2] = RadarAreasTurf[Area]["Loyalty"][1][2] - 1
								if RadarAreasTurf[Area]["Loyalty"][1][2] < 0 then
									RadarAreasTurf[Area]["Loyalty"][1][2] = 0
									RadarAreasTurf[Area]["Loyalty"][1][1] = ""
								end
							elseif oA ~= Group and oB ~= Group then
								local MinL = math.min(LA, LB)
								if MinL == LA then
									if RadarAreasTurf[Area]["Loyalty"][1][2] <= 0 then
										RadarAreasTurf[Area]["Loyalty"][1][1] = Group
										RadarAreasTurf[Area]["Loyalty"][1][2] = 1
										local color = exports.ATA_Klan:getGroupTurfColor(Group);
										local r, g, b = color[1], color[2], color[3]
										RadarAreasTurf[Area]["Loyalty"][1][3][1] = r
										RadarAreasTurf[Area]["Loyalty"][1][3][2] = g
										RadarAreasTurf[Area]["Loyalty"][1][3][3] = b
									else
										RadarAreasTurf[Area]["Loyalty"][1][2] = RadarAreasTurf[Area]["Loyalty"][1][2] - 1
									end
								elseif MinL == LB then
									if RadarAreasTurf[Area]["Loyalty"][2][2] <= 0 then
										RadarAreasTurf[Area]["Loyalty"][2][1] = Group
										RadarAreasTurf[Area]["Loyalty"][2][2] = 1
										local color = exports.ATA_Klan:getGroupTurfColor(Group);
										local r, g, b = color[1], color[2], color[3]
										RadarAreasTurf[Area]["Loyalty"][2][3][1] = r
										RadarAreasTurf[Area]["Loyalty"][2][3][2] = g
										RadarAreasTurf[Area]["Loyalty"][2][3][3] = b
									else
										RadarAreasTurf[Area]["Loyalty"][2][2] = RadarAreasTurf[Area]["Loyalty"][2][2] - 1
									end
								end
							end
						else
							exports.GTIhud:dm(player, "[Turf] Bu yükseklikten bölge alamazsınız, Lütfen yere inin !", player, 219, 0, 0, true);
						end
					else
						exports.GTIhud:dm(player, "[Turf] Araçtayken bölge alamazsınız !", player, 219, 0, 0, true);
					end
				else
					exports.GTIhud:dm("[Turf] Bölge ele geçirmek için bir klana katılın veya bir klan oluşturun !", player, 219, 0, 0, true);
				end
			end
			local oA = RadarAreasTurf[Area]["Loyalty"][1][1]
			local LA = RadarAreasTurf[Area]["Loyalty"][1][2]
			local r1, g1, b1 = RadarAreasTurf[Area]["Loyalty"][1][3][1], RadarAreasTurf[Area]["Loyalty"][1][3][2], RadarAreasTurf[Area]["Loyalty"][1][3][3]
			local oB = RadarAreasTurf[Area]["Loyalty"][2][1]
			local LB = RadarAreasTurf[Area]["Loyalty"][2][2]
			local r2, g2, b2 = RadarAreasTurf[Area]["Loyalty"][2][3][1], RadarAreasTurf[Area]["Loyalty"][2][3][2], RadarAreasTurf[Area]["Loyalty"][2][3][3]
			if oA ~= "" and LA > 0 then player:setData("TurfStat1", {oA..": "..LA.."%", {r1, g1, b1}}) else player:setData("TurfStat1", false) end
			if oB ~= "" and LB > 0 then player:setData("TurfStat2", {oB..": "..LB.."%", {r2, g2, b2}}) else player:setData("TurfStat2", false) end
		end
	end
end, 6000, 0);

komutlar = {
	["sp"] = true,
	["drop"] = true,
	["ss"] = true,
	["anim"] = true,
	["otur"] = true,
	["evisinlan"] = true,
	["grav"] = true,
	["repair"] = true,
	["flip"] = true,
	["jetpack"] = true,
}

addEventHandler("onPlayerCommand",root,function(komut)
	local durum = getElementData(source,"TurfStat1")
	if durum and durum == "TurfStat1" and  komutlar[komut] then
		cancelEvent()
	end	
end)

addEventHandler("onPlayerCommand",root,function(komut)
	local durum = getElementData(source,"TurfStat2")
	if durum and durum == "TurfStat2" and  komutlar[komut] then
		cancelEvent()
	end	
end)


addEventHandler( "onPlayerWasted", getRootElement( ),
	function(ammo, attacker, weapon, bodypart)
	if getElementData(source, "turf:etkin") == true then
		local hesap = getAccountName(getPlayerAccount(source))
		
		
		if ( attacker ) then
		local hesap_atk = getAccountName(getPlayerAccount(attacker))
		if ( getElementType ( attacker ) == "player" ) then
		for _, v in ipairs(exports.mysql:query("SELECT * FROM hesap")) do
		    if hesap_atk == v.Kullanici_adi then 
			if tonumber(v.saat) < 50 then return end
			if getElementData(source, "Group") == getElementData(attacker, "Group") then  return end
			if v.turf_kill == false then
				exports.mysql:exec("UPDATE hesap SET turf_kill=?, kills=? WHERE Kullanici_adi=?", 1, 1, hesap_atk)
			else
                exports.mysql:exec("UPDATE hesap SET turf_kill=?, kills=? WHERE Kullanici_adi=?", v.turf_kill+1, v.kills+1, hesap_atk)
				local kill = v.turf_kill
				local death = v.turf_death
				local kd_toplam = kill/death
				if kd_toplam <= 0.4 then 
					if v.rutbe == "masum" then return end
					exports.mysql:exec("UPDATE hesap SET rutbe=? WHERE Kullanici_adi=?", "masum", hesap_atk)
				elseif kd_toplam > 0.4 and kd_toplam <= 0.7 then
					if v.rutbe == "katil" then return end
					exports.mysql:exec("UPDATE hesap SET rutbe=? WHERE Kullanici_adi=?", "katil", hesap_atk)
				elseif kd_toplam > 0.7 and kd_toplam <= 1 then
					if v.rutbe == "serikatil" then return end
					exports.mysql:exec("UPDATE hesap SET rutbe=? WHERE Kullanici_adi=?", "serikatil", hesap_atk)
				elseif kd_toplam > 1 and kd_toplam <= 1.4 then
					if v.rutbe == "destansi" then return end
					exports.mysql:exec("UPDATE hesap SET rutbe=? WHERE Kullanici_adi=?", "destansi", hesap_atk)
				elseif kd_toplam > 1.4 then
					if v.rutbe == "efsanevi" then return end
					exports.mysql:exec("UPDATE hesap SET rutbe=? WHERE Kullanici_adi=?", "efsanevi", hesap_atk)
				end
			end
		    end
			
			if hesap == v.Kullanici_adi then 
			
			if v.turf_death == false then
				exports.mysql:exec("UPDATE hesap SET turf_death=?, death=? WHERE Kullanici_adi=?", 1, 1, hesap)
			else
                exports.mysql:exec("UPDATE hesap SET turf_death=?, death=? WHERE Kullanici_adi=?", v.turf_death+1, v.death+1, hesap)
			end
			
		    end		
	    end
	    end
		
		else
		
		 for _, v in ipairs(exports.mysql:query("SELECT * FROM hesap")) do
		    if hesap == v.Kullanici_adi then 
			if v.turf_death == false then
				exports.mysql:exec("UPDATE hesap SET turf_death=?, death=? WHERE Kullanici_adi=?", 1, 1, hesap)
			else
                exports.mysql:exec("UPDATE hesap SET turf_death=?, death=? WHERE Kullanici_adi=?", v.turf_death+1, v.death+1, hesap)
				end
		    end
	    end
		end
		end
		removeElementData(source, "TurfStat1")
		removeElementData(source, "TurfStat2")
	end
)
-- end