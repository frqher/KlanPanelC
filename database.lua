	local data = data()
	db = dbConnect("sqlite", "database.db")
	dbExec(db, "CREATE TABLE IF NOT EXISTS groups (group_name, group_members INT, members_limit, group_info, group_bank INT, turf_color, chat_color, tag_color, group_owner, turf_points INT, kill_points INT, KlanTag, klan_sahibi)")
	dbExec(db, "CREATE TABLE IF NOT EXISTS group_ranks (group_name, group_rank_name, group_rank_permission, rank_type)")
	dbExec(db, "CREATE TABLE IF NOT EXISTS group_members (group_name, member_account, member_name, member_status, member_rank, last_online, WL)")
	dbExec(db, "CREATE TABLE IF NOT EXISTS group_invite (group_name, player_account, byy)")
	dbExec(db, "CREATE TABLE IF NOT EXISTS group_history (group_name, groupaction, thetime)")
	dbExec(db, "CREATE TABLE IF NOT EXISTS group_blackaccount (group_name, byy, account_name, Reason, Time)")
	dbExec(db, "CREATE TABLE IF NOT EXISTS group_blackserial (group_name, byy, serial, Reason, Time)")
	-- dbExec(db, "CREATE TABLE IF NOT EXISTS market (Klan, isim, id)")
	for i, player in ipairs(getElementsByType("player")) do
		local groupName = getPlayerGroup(player)
		if groupName then
			local hesap = getPlayerAccount ( player )
			local klanTagDurum = getAccountData(hesap, "KlanTagiEtkin")
			setElementData(player, "Group", groupName)
			setElementData(player, "GroupRank", {getGroupRanks(groupName), getPlayerGroupRank(player)})
			setElementData(player, "KlanRutbe", tostring(getPlayerGroupRank(player)))
			dbExec(db, "UPDATE group_members SET member_name = ?, member_status = ?, last_online = ? WHERE group_name = ? AND member_account = ?", getPlayerName(player),"Yes",data,groupName,getAccountName(getPlayerAccount(player)))
			if hesap then
				exports.mysql:exec("UPDATE hesap SET isim=?, klan_isim=?, klan_rutbe=?, son_giris=? WHERE Kullanici_adi=?", getPlayerName(player), groupName, getElementData(player, "KlanRutbe"), "Aktif", getAccountName(hesap))
				setElementData(player, "son:giris", "Aktif")
				if getAccountData(hesap, "KlanTagiEtkin") == true then
					local durum = getAccountData(hesap, "KlanTagiEtkin")
					triggerClientEvent(player,"KlanTags",player,durum)
				end
			end
		else
			setElementData(player, "Group", false)
			setElementData(player, "GroupRank", false)
		end
	end

-- addEvent("Market:SatinAl", true)
-- addEventHandler("Market:SatinAl", root, function (id,name,fiyat)
	-- if id then
		-- local klan = getElementData(source, "Group")
		-- if klan then
			-- takePlayerMoney(source, tonumber(fiyat))
			-- dbExec(db,"INSERT INTO market VALUES (?,?,?)", klan, name, id)
		-- end
	-- end
-- end)

-- addEvent("Envanter:Yenile", true)
-- addEventHandler("Envanter:Yenile", root, function ()
	-- tbl = {}
	-- local klan = getElementData(source, "Group")
	-- if klan then
	-- for i, v in ipairs(dbPoll(dbQuery(db, "SELECT * FROM `market`"), -1)) do
	-- table.insert(tbl, {v})
	-- end
	-- for i2,v2 in pairs(tbl) do
	-- local klanlist = unpack(v2)
	-- if klan == klanlist["Klan"] then
		-- local name = klanlist["isim"]
		-- local id = klanlist["id"]
		-- triggerClientEvent(source, "Market:Yenile",source,name,id)
	-- end
-- end
-- end
-- end)

function aracBinince(player,seat) 
    if (seat == 0 ) and getElementData ( player , "Group" ) then return end
	if seat == 0 then
        cancelEvent()
        outputChatBox("Bu araca sadece Klan üyeleri bine bilir",player, 255, 0, 0, true)  
	end
 end  

klanarac = {}

addEvent("Envanter:Skin", true)
addEventHandler("Envanter:Skin", root, function (id)
	if id then
	setElementModel(source, id)
end
end)


addEvent("Envanter:Arac", true)
addEventHandler("Envanter:Arac", root, function (id)
	if klanarac[source] then destroyElement(klanarac[source]) end
	local x, y, z = getElementPosition(source)
	local x2, y2, z2 = getElementRotation(source)
	klanarac[source] = createVehicle(id,x+2.5,y,z+2,x2,y2,z2)
	addEventHandler ("onVehicleStartEnter", klanarac[source], aracBinince )
end)

addEvent("klan:arac.kaldir", true)
addEventHandler("klan:arac.kaldir", root, function()
	if isElement(klanarac[source]) then
	if klanarac[source] then destroyElement(klanarac[source]) end
	end
end)

function oyuncucikti()
	if isElement(klanarac[source]) then
	if klanarac[source] then destroyElement(klanarac[source]) end
	end
end
addEventHandler("onPlayerQuit", getRootElement(), oyuncucikti)
