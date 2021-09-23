x,y = guiGetScreenSize()--
guiSetInputMode("no_binds_when_editing")
client = getLocalPlayer()


GUIEditor = {
    label = {}
}
        Groups_Window = guiCreateWindow(x/2-343/2, y/2-581/2, 340, 450, "Klan Panel", false)
        guiWindowSetSizable(Groups_Window, false)
        guiSetAlpha(Groups_Window, 1.00)

        Create_Group_Edit = guiCreateEdit(10, 56, 208, 33, "", false, Groups_Window)
		guiEditSetMaxLength(Create_Group_Edit, 25)
        Create_Group_Button = guiCreateButton(226, 56, 102, 33, "Oluştur", false, Groups_Window)
        guiSetProperty(Create_Group_Button, "NormalTextColour", "FF02F5E1")
        GUIEditor.label[1] = guiCreateLabel(75, 30, 110, 16, "Create Group:", true, Groups_Window)
        guiSetFont(GUIEditor.label[1], "default-bold-small")
        GUIEditor.label[2] = guiCreateLabel(10, 99, 318, 15, "___________________________________________________________", false, Groups_Window)
        Members_Group_Button = guiCreateButton(9, 145, 217, 36, "Klan üyeleri", false, Groups_Window)
        guiSetFont(Members_Group_Button, "default-bold-small")
        guiSetProperty(Members_Group_Button, "NormalTextColour", "FF02F5E1")
        myInvites_Group_Button = guiCreateButton(9, 221, 217, 36, "Gelen davetler", false, Groups_Window)
        guiSetFont(myInvites_Group_Button, "default-bold-small")
        guiSetProperty(myInvites_Group_Button, "NormalTextColour", "FF00FF00")
        InfoEdit_Group_Button = guiCreateButton(9, 294, 217, 36, "Kural/Bilgilendirme", false, Groups_Window)
        guiSetFont(InfoEdit_Group_Button, "default-bold-small")
        guiSetProperty(InfoEdit_Group_Button, "NormalTextColour", "FF02F5E1")
        Leave_Group_Button = guiCreateButton(246, 145, 86, 36, "Ayrıl", false, Groups_Window)
        guiSetFont(Leave_Group_Button, "default-bold-small")
        guiSetProperty(Leave_Group_Button, "NormalTextColour", "FFFF0000")
        GroupList_Group_Button = guiCreateButton(246, 221, 86, 36, "Klan listesi", false, Groups_Window)
        guiSetFont(GroupList_Group_Button, "default-bold-small")
        guiSetProperty(GroupList_Group_Button, "NormalTextColour", "FFFF00FF")
        Close_Group_Button = guiCreateButton(246, 294, 86, 36, "Kapat", false, Groups_Window)
        guiSetFont(Close_Group_Button, "default-bold-small")
        guiSetProperty(Close_Group_Button, "NormalTextColour", "FF0000FF")
        Group_TopTurf_Button = guiCreateButton(9, 294+50, 149, 35, "Klan Sıralaması", false, Groups_Window)
        guiSetFont(Group_TopTurf_Button, "default-bold-small")
        guiSetProperty(Group_TopTurf_Button, "NormalTextColour", "FF800080")
        Group_TopBank_Button = guiCreateButton(184, 294+50, 149, 35, "Klan Banka Sıralaması", false, Groups_Window)
        guiSetFont(Group_TopBank_Button, "default-bold-small")
        guiSetProperty(Group_TopBank_Button, "NormalTextColour", "FFFFA500")
        Group_BlackList_Button = guiCreateButton(76, 471, 187, 28, "Manage Group Black List", true, Groups_Window)
        guiSetFont(Group_BlackList_Button, "default-bold-small")
        guiSetProperty(Group_BlackList_Button, "NormalTextColour", "FF7E3517")
        -- KlanMarket = guiCreateButton(9, 511, 149, 30, "Klan Market", false, Groups_Window)
        -- guiSetFont(KlanMarket, "default-bold-small")
        -- guiSetProperty(KlanMarket, "NormalTextColour", "FF800080")
        -- KlanEnvanter = guiCreateButton(179, 511, 149, 30, "Araç & Skin", false, Groups_Window)
        -- guiSetFont(KlanEnvanter, "default-bold-small")
        -- guiSetProperty(KlanEnvanter, "NormalTextColour", "FF800080")
        Admin_Group_Button = guiCreateButton(9, 294+73+30, 320, 32, "Klanı Sil", false, Groups_Window)
        guiSetFont(Admin_Group_Button, "default-bold-small")
        guiSetProperty(Admin_Group_Button, "NormalTextColour", "FF571B7E")
        Name_Group_Label = guiCreateLabel(17, 122, 143, 18, "Klan adı: Klanda değilsin", false, Groups_Window)
        myInvites_Group_Label = guiCreateLabel(17, 198, 143, 13, "Gelen davetler: 0", false, Groups_Window)
        GUIEditor.label[5] = guiCreateLabel(17, 271, 143, 25, "Klan Bilgisi :", false, Groups_Window)

function closewin()
guiSetVisible (Groups_Window,false)
end
addEventHandler ("onClientResourceStart",root,closewin)
CheckLeaveWindow = guiCreateWindow(x/2-134, y/2-50, 268, 100, "Ayrıl", false)
guiWindowSetSizable(CheckLeaveWindow , false)
guiSetVisible(CheckLeaveWindow, false)
guiSetAlpha(CheckLeaveWindow, 1)

guiCreateLabel(10, 26, 254, 17, "Ayrılmak istediğinden emin misin ?", false, CheckLeaveWindow)

YesLeaveGroup = guiCreateButton(15, 63, 104, 27, "Evet", false, CheckLeaveWindow)
guiSetFont(YesLeaveGroup, "default-bold-small")
NoLeaveGroup = guiCreateButton(150, 63, 104, 27, "Hayır", false, CheckLeaveWindow)
guiSetFont(NoLeaveGroup, "default-bold-small")

Group_Rank_Window = guiCreateWindow(x/2-264.5, y/2-152.5, 529, 305, "Rütbe Yönetimi", false)
guiWindowSetSizable(Group_Rank_Window, false)
guiSetAlpha(Group_Rank_Window, 1)
guiSetVisible(Group_Rank_Window, false)

Group_Rank_Gridlist = guiCreateGridList(11, 29, 192, 227, false, Group_Rank_Window)
guiGridListAddColumn(Group_Rank_Gridlist, "Rütbe", 0.9)
Group_Rank_Label = guiCreateLabel(309, 24, 88, 15, "İzin Listesi", false, Group_Rank_Window)
guiSetFont(Group_Rank_Label, "default-bold-small")

Group_Rank_Scrollpane = guiCreateScrollPane(221, 46, 298, 200, false, Group_Rank_Window)

Group_Rank_Permission_1 = guiCreateCheckBox(3, 2, 276, 19, "Üyelerin rütbesini düşürme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_2 = guiCreateCheckBox(3, 22, 276, 19, "Üyelerin rütbesini yükseltme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_3 = guiCreateCheckBox(3, 42, 276, 19, "Üyeleri klandan atma.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_4 = guiCreateCheckBox(3, 62, 276, 19, "Üyeleri kendi rütbesine kadar yükseltme.", true, false, Group_Rank_Scrollpane)
Group_Rank_Permission_5 = guiCreateCheckBox(3, 82, 276, 19, "Klan bilgilerini düzenleyebilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_6 = guiCreateCheckBox(3, 102, 276, 19, "Oyuncuları klana davet etme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_7 = guiCreateCheckBox(3, 122, 276, 19, "Klanı silme yetkisi.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_8 = guiCreateCheckBox(3, 142, 276, 19, "Klan işlem geçmişini görüntüleyebilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_9 = guiCreateCheckBox(3, 162, 276, 19, "Aynı rütbeye sahip üyelerin rütbesini düşürme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_10 = guiCreateCheckBox(3, 182, 276, 19, "Klan bankasına para yatırabilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_11 = guiCreateCheckBox(3, 202, 276, 19, "Klan bankasından para çekebilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_12 = guiCreateCheckBox(3, 222, 276, 19, "Turf rengini değiştirebilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_13 = guiCreateCheckBox(3, 242, 276, 19, "Sohbet rengini değiştirebilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_14 = guiCreateCheckBox(3, 262, 276, 19, "Klan üyelerini uyarabilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_15 = guiCreateCheckBox(3, 282, 276, 19, "Tüm klan üyelerine para verebilme.(Klan Bankası)", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_16 = guiCreateCheckBox(3, 302, 276, 19, "Klan üyelerine mute atabilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_17 = guiCreateCheckBox(3, 322, 276, 19, "Klan üyesine klan bankasından para verebilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_18 = guiCreateCheckBox(3, 342, 276, 19, "Klan işlemlerini silebilme.", false, false, Group_Rank_Scrollpane)
Group_Rank_Permission_19 = guiCreateCheckBox(3, 362, 276, 19, "Harita işareti.", true, false, Group_Rank_Scrollpane)
-- Group_Rank_Permission_20 = guiCreateCheckBox(3, 382, 276, 19, "Klan envanterine erişebilme", false, false, Group_Rank_Scrollpane)
-- Group_Rank_Permission_21 = guiCreateCheckBox(3, 402, 276, 19, "Able to block an serial.", false, false, Group_Rank_Scrollpane)
-- Group_Rank_Permission_22 = guiCreateCheckBox(3, 422, 276, 19, "Able to unblock an account.", false, false, Group_Rank_Scrollpane)
-- Group_Rank_Permission_23 = guiCreateCheckBox(3, 442, 276, 19, "Able to unblock an serial", false, false, Group_Rank_Scrollpane)

guiSetEnabled(Group_Rank_Permission_1, false)
guiSetEnabled(Group_Rank_Permission_2, false)
guiSetEnabled(Group_Rank_Permission_3, false)
guiSetEnabled(Group_Rank_Permission_4, false)
guiSetEnabled(Group_Rank_Permission_5, false)
guiSetEnabled(Group_Rank_Permission_6, false)
guiSetEnabled(Group_Rank_Permission_7, false)
guiSetEnabled(Group_Rank_Permission_8, false)
guiSetEnabled(Group_Rank_Permission_9, false)
guiSetEnabled(Group_Rank_Permission_10, false)
guiSetEnabled(Group_Rank_Permission_11, false)
guiSetEnabled(Group_Rank_Permission_12, false)
guiSetEnabled(Group_Rank_Permission_13, false)
guiSetEnabled(Group_Rank_Permission_14, false)
guiSetEnabled(Group_Rank_Permission_15, false)
guiSetEnabled(Group_Rank_Permission_16, false)
guiSetEnabled(Group_Rank_Permission_17, false)
guiSetEnabled(Group_Rank_Permission_18, false)
guiSetEnabled(Group_Rank_Permission_19, false)
-- guiSetEnabled(Group_Rank_Permission_20, false)
-- guiSetEnabled(Group_Rank_Permission_21, false)
-- guiSetEnabled(Group_Rank_Permission_22, false)
-- guiSetEnabled(Group_Rank_Permission_23, false)


--[[

PermissionTable["1"] -- demote player
PermissionTable["2"] -- promote player
PermissionTable["3"] -- kick player
PermissionTable["4"] -- promote player until thier own rank
PermissionTable["5"] -- edit info
PermissionTable["6"] -- invite
PermissionTable["7"] -- delete the group
PermissionTable["8"] -- view history
PermissionTable["9"] -- demote player with same rank
PermissionTable["10"] -- deposit money
PermissionTable["11"] -- withdraw money
PermissionTable["12"] -- turf color
PermissionTable["13"] -- chat color
PermissionTable["14"] -- warn members
PermissionTable["15"] -- Give Money
PermissionTable["16"] -- mute members
PermissionTable["17"] -- Give Money For One Member
PermissionTable["18"] -- delete events
PermissionTable["19"] -- View Group BlackList
PermissionTable["20"] -- block account
PermissionTable["21"] -- block serial
PermissionTable["22"] -- unblock account
PermissionTable["23"] -- unblock serial

]]

Group_EditRank = guiCreateButton(11, 266, 119, 29, "Rütbeyi düzenle", false, Group_Rank_Window)
Group_RemoveRank = guiCreateButton(140, 266, 119, 29, "Rütbeyi sil", false, Group_Rank_Window)
Group_AddNewRank = guiCreateButton(264, 266, 119, 29, "Rütbe ekle", false, Group_Rank_Window)
Group_CloseRankWindow = guiCreateButton(393, 266, 119, 29, "Kapat", false, Group_Rank_Window)

Add_Rank_Window = guiCreateWindow(x/2-157.5, y/2-165, 315, 355, "Yeni Rütbe", false)
guiWindowSetSizable(Add_Rank_Window, false)
guiSetAlpha(Add_Rank_Window, 1)
guiSetVisible(Add_Rank_Window, false)

Add_RankName_Label = guiCreateLabel(10, 27, 88, 15, "Rütbe ismi", false, Add_Rank_Window)
guiSetFont(Add_RankName_Label, "default-bold-small")
Add_RankName_Edit = guiCreateEdit(80, 25, 220, 20, "", false, Add_Rank_Window)
guiEditSetMaxLength(Add_RankName_Edit, 50)
Add_RankAfter_Label = guiCreateLabel(50, 55, 400, 15, "Hangi rütbeden önce geleceğini seçin.", false, Add_Rank_Window)
guiSetFont(Add_RankAfter_Label, "default-bold-small")
AddRankComboBox = guiCreateComboBox(70, 80, 180, 120, "Rütbe seç", false, Add_Rank_Window)
Add_Rank_Scrollpane = guiCreateScrollPane(10, 110, 298, 200, false, Add_Rank_Window)
Add_Rank_Permission_1 = guiCreateCheckBox(3, 2, 276, 19, "Üyelerin rütbesini düşürme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_2 = guiCreateCheckBox(3, 22, 276, 19, "Üyelerin rütbesini yükseltme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_3 = guiCreateCheckBox(3, 42, 276, 19, "Üyeleri klandan atma.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_4 = guiCreateCheckBox(3, 62, 276, 19, "Üyeleri kendi rütbesine kadar yükseltme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_5 = guiCreateCheckBox(3, 82, 276, 19, "Klan bilgilerini düzenleyebilme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_6 = guiCreateCheckBox(3, 102, 276, 19, "Oyuncuları klana davet etme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_7 = guiCreateCheckBox(3, 122, 276, 19, "Klanı silme yetkisi.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_8 = guiCreateCheckBox(3, 142, 276, 19, "Klan işlem geçmişini görüntüleyebilme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_9 = guiCreateCheckBox(3, 162, 276, 19, "Aynı rütbeye sahip üyelerin rütbesini düşürme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_10 = guiCreateCheckBox(3, 182, 276, 19, "Klan bankasına para yatırabilme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_11 = guiCreateCheckBox(3, 202, 276, 19, "Klan bankasından para çekebilme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_12 = guiCreateCheckBox(3, 222, 276, 19, "Turf rengini değiştirebilme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_13 = guiCreateCheckBox(3, 242, 276, 19, "Sohbet rengini değiştirebilme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_14 = guiCreateCheckBox(3, 262, 276, 19, "Klan üyelerini uyarabilme.", true, false, Add_Rank_Scrollpane)
Add_Rank_Permission_15 = guiCreateCheckBox(3, 282, 276, 19, "Tüm klan üyelerine para verebilme.(Klan Bankası).", false, false, Add_Rank_Scrollpane)
Add_Rank_Permission_16 = guiCreateCheckBox(3, 302, 276, 19, "Klan üyelerine mute atabilme.", false, false, Add_Rank_Scrollpane)
Add_Rank_Permission_17 = guiCreateCheckBox(3, 322, 276, 19, "Klan üyesine klan bankasından para verebilme.", false, false, Add_Rank_Scrollpane)
Add_Rank_Permission_18 = guiCreateCheckBox(3, 342, 276, 19, "Klan işlemlerini silebilme.", false, false, Add_Rank_Scrollpane)
-- Add_Rank_Permission_19 = guiCreateCheckBox(3, 362, 276, 19, "Klan markete erişebilme.", true, false, Add_Rank_Scrollpane)
-- Add_Rank_Permission_20 = guiCreateCheckBox(3, 382, 276, 19, "Klan envanterine erişebilme", false, false, Add_Rank_Scrollpane)
-- Add_Rank_Permission_21 = guiCreateCheckBox(3, 402, 276, 19, "Able to block an serial.", false, false, Add_Rank_Scrollpane)
-- Add_Rank_Permission_22 = guiCreateCheckBox(3, 422, 276, 19, "Able to unblock an account.", false, false, Add_Rank_Scrollpane)
-- Add_Rank_Permission_23 = guiCreateCheckBox(3, 442, 276, 19, "Able to unblock an serial.", false, false, Add_Rank_Scrollpane)

Add_NewRank = guiCreateButton(11, 320, 139, 29, "Ekle", false, Add_Rank_Window)
Add_Cancel = guiCreateButton(170, 320, 139, 29, "İptal", false, Add_Rank_Window)

Edit_Rank_Window = guiCreateWindow(x/2-153.5, y/2-165, 315, 307, "Rütbe Düzenleme Paneli", false)
guiWindowSetSizable(Edit_Rank_Window, false)
guiSetAlpha(Edit_Rank_Window, 1)
guiSetVisible(Edit_Rank_Window, false)

Edit_RankName_Label = guiCreateLabel(10, 27, 88, 15, "Rütbe İsmi", false, Edit_Rank_Window)
guiSetFont(Edit_RankName_Label, "default-bold-small")
Edit_RankName_Edit = guiCreateEdit(80, 25, 220, 20, "", false, Edit_Rank_Window)
guiEditSetMaxLength(Edit_RankName_Edit, 50)

Edit_Rank_Scrollpane = guiCreateScrollPane(10, 55, 298, 200, false, Edit_Rank_Window)
Edit_Rank_Permission_1 = guiCreateCheckBox(3, 2, 276, 19, "Üyelerin rütbesini düşürme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_2 = guiCreateCheckBox(3, 22, 276, 19, "Üyelerin rütbesini yükseltme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_3 = guiCreateCheckBox(3, 42, 276, 19, "Üyeleri klandan atma.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_4 = guiCreateCheckBox(3, 62, 276, 19, "Üyeleri kendi rütbesine kadar yükseltme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_5 = guiCreateCheckBox(3, 82, 276, 19, "Klan bilgilerini düzenleyebilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_6 = guiCreateCheckBox(3, 102, 276, 19, "Oyuncuları klana davet etme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_7 = guiCreateCheckBox(3, 122, 276, 19, "Klanı silme yetkisi.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_8 = guiCreateCheckBox(3, 142, 276, 19, "Klan işlem geçmişini görüntüleyebilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_9 = guiCreateCheckBox(3, 162, 276, 19, "Aynı rütbeye sahip üyelerin rütbesini düşürme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_10 = guiCreateCheckBox(3, 182, 276, 19, "Klan bankasına para yatırabilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_11 = guiCreateCheckBox(3, 202, 276, 19, "Klan bankasından para çekebilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_12 = guiCreateCheckBox(3, 222, 276, 19, "Turf rengini değiştirebilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_13 = guiCreateCheckBox(3, 242, 276, 19, "Sohbet rengini değiştirebilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_14 = guiCreateCheckBox(3, 262, 276, 19, "Klan üyelerini uyarabilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_15 = guiCreateCheckBox(3, 282, 276, 19, "Tüm klan üyelerine para verebilme.(Klan Bankası) .", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_16 = guiCreateCheckBox(3, 302, 276, 19, "Klan üyelerine mute atabilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_17 = guiCreateCheckBox(3, 322, 276, 19, "Klan üyesine klan bankasından para verebilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_18 = guiCreateCheckBox(3, 342, 276, 19, "Klan işlemlerini silebilme.", true, false, Edit_Rank_Scrollpane)
Edit_Rank_Permission_19 = guiCreateCheckBox(3, 362, 276, 19, "Harita işareti.", true, false, Edit_Rank_Scrollpane)
-- Edit_Rank_Permission_20 = guiCreateCheckBox(3, 382, 276, 19, "Klan envanterine erişebilme", false, false, Edit_Rank_Scrollpane)
-- Edit_Rank_Permission_21 = guiCreateCheckBox(3, 402, 276, 19, "Able to block an serial.", true, false, Edit_Rank_Scrollpane)
-- Edit_Rank_Permission_22 = guiCreateCheckBox(3, 422, 276, 19, "Able to unblock an account.", true, false, Edit_Rank_Scrollpane)
-- Edit_Rank_Permission_23 = guiCreateCheckBox(3, 442, 276, 19, "Able to unblock an serial.", true, false, Edit_Rank_Scrollpane)


MyGroup_Members_Window = guiCreateWindow(x/2-330, y/2-286, 642, 600,"Klan üyeleri",false)--x/2-291, y/2-212, 642, 502
guiSetAlpha(MyGroup_Members_Window,1)
guiSetVisible(MyGroup_Members_Window, false)
guiWindowSetSizable(MyGroup_Members_Window,false)
InvitesPlayer_Group_Button = guiCreateButton(150, 420, 120, 32, "Klana davet et", false, MyGroup_Members_Window)
guiSetFont(InvitesPlayer_Group_Button, "default-bold-small")
guiSetProperty(InvitesPlayer_Group_Button, "NormalTextColour", "FF0000FF")
Group_History_Button = guiCreateButton(281, 420, 135, 32, "Klan log", false, MyGroup_Members_Window)
guiSetFont(Group_History_Button, "default-bold-small")
guiSetProperty(Group_History_Button, "NormalTextColour", "FF800000")
Group_Rank_Button = guiCreateButton(281, 374, 135, 32, "Klan rütbeleri", false, MyGroup_Members_Window)
guiSetFont(Group_Rank_Button, "default-bold-small")
guiSetProperty(Group_Rank_Button, "NormalTextColour", "FF800000")
Group_Bank_Button = guiCreateButton(426, 420, 118, 33, "Klan bankası", false, MyGroup_Members_Window)
guiSetFont(Group_Bank_Button, "default-bold-small")
guiSetProperty(Group_Bank_Button, "NormalTextColour", "FF800080")
Renk_ayar_Button = guiCreateButton(19, 420, 120, 32, "Klan ayarları", false, MyGroup_Members_Window)

Edit_Rank = guiCreateButton(11, 265, 139, 29, "Kaydet", false, Edit_Rank_Window)
Edit_Cancel = guiCreateButton(170, 265, 139, 29, "İptal", false, Edit_Rank_Window)

CheckRemoveRankWindow = guiCreateWindow(x/2-134, y/2-63.5, 268, 127, "Rütbeyi kaldır", false)
guiWindowSetSizable(CheckRemoveRankWindow, false)
guiSetVisible(CheckRemoveRankWindow, false)
guiSetAlpha(CheckRemoveRankWindow,1)

guiCreateLabel(10, 26, 254, 17, "Bu rütbeyi kaldırmak istediğinize emin misiniz ?", false, CheckRemoveRankWindow)
guiCreateLabel(10, 43, 244, 17, "Bu rütbedeki kişilerin rütbesi otomatik olarak ", false, CheckRemoveRankWindow)
guiCreateLabel(10, 60, 200, 15, "Önceki rütbeye düşecek", false, CheckRemoveRankWindow)

YesRemoveRank = guiCreateButton(15, 90, 104, 27, "Kaldır", false, CheckRemoveRankWindow)
guiSetFont(YesRemoveRank, "default-bold-small")
NoRemoveRank = guiCreateButton(150, 90, 104, 27, "İptal", false, CheckRemoveRankWindow)
guiSetFont(NoRemoveRank, "default-bold-small")


function onRankClick()
	selectedRank = guiGridListGetSelectedItem(Group_Rank_Gridlist)
	if source == Group_Rank_Gridlist then
		if selectedRank ~= -1 then
			guiCheckBoxSetSelected(Group_Rank_Permission_1, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_2, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_3, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_4, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_5, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_6, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_7, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_8, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_9, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_10, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_11, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_12, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_13, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_14, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_15, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_16, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_17, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_18, false)
			guiCheckBoxSetSelected(Group_Rank_Permission_19, false)
			-- guiCheckBoxSetSelected(Group_Rank_Permission_20, false)
			-- guiCheckBoxSetSelected(Group_Rank_Permission_21, false)
			-- guiCheckBoxSetSelected(Group_Rank_Permission_22, false)
			-- guiCheckBoxSetSelected(Group_Rank_Permission_23, false)
			local RankTable = guiGridListGetItemData(Group_Rank_Gridlist, selectedRank, 1)
			for i, num in ipairs(split(RankTable[1], ', ')) do
				local num = tonumber(num)
				if num == 1 then
					guiCheckBoxSetSelected(Group_Rank_Permission_1, true)
				elseif num == 2 then
					guiCheckBoxSetSelected(Group_Rank_Permission_2, true)
				elseif num == 3 then
					guiCheckBoxSetSelected(Group_Rank_Permission_3, true)
				elseif num == 4 then
					guiCheckBoxSetSelected(Group_Rank_Permission_4, true)
				elseif num == 5 then
					guiCheckBoxSetSelected(Group_Rank_Permission_5, true)
				elseif num == 6 then
					guiCheckBoxSetSelected(Group_Rank_Permission_6, true)
				elseif num == 7 then
					guiCheckBoxSetSelected(Group_Rank_Permission_7, true)
				elseif num == 8 then
					guiCheckBoxSetSelected(Group_Rank_Permission_8, true)
				elseif num == 9 then
					guiCheckBoxSetSelected(Group_Rank_Permission_9, true)
				elseif num == 10 then
					guiCheckBoxSetSelected(Group_Rank_Permission_10, true)
				elseif num == 11 then
					guiCheckBoxSetSelected(Group_Rank_Permission_11, true)
				elseif num == 12 then
					guiCheckBoxSetSelected(Group_Rank_Permission_12, true)
				elseif num == 13 then
					guiCheckBoxSetSelected(Group_Rank_Permission_13, true)
				elseif num == 14 then
					guiCheckBoxSetSelected(Group_Rank_Permission_14, true)
				elseif num == 15 then
					guiCheckBoxSetSelected(Group_Rank_Permission_15, true)
				elseif num == 16 then
					guiCheckBoxSetSelected(Group_Rank_Permission_16, true)
				elseif num == 17 then
					guiCheckBoxSetSelected(Group_Rank_Permission_17, true)
				elseif num == 18 then
					guiCheckBoxSetSelected(Group_Rank_Permission_18, true)
				elseif num == 19 then
					guiCheckBoxSetSelected(Group_Rank_Permission_19, true)
				-- elseif num == 20 then
					-- guiCheckBoxSetSelected(Group_Rank_Permission_20, true)
				-- elseif num == 21 then
				-- 	guiCheckBoxSetSelected(Group_Rank_Permission_21, true)
				-- elseif num == 22 then
				-- 	guiCheckBoxSetSelected(Group_Rank_Permission_22, true)
				-- elseif num == 23 then
				-- 	guiCheckBoxSetSelected(Group_Rank_Permission_23, true)
				end
			end
		end
	elseif source == Group_EditRank then
		if selectedRank ~= -1 then
			local RankName = guiGridListGetItemText(Group_Rank_Gridlist, selectedRank, 1)
			if RankName ~= "" then
				guiCheckBoxSetSelected(Edit_Rank_Permission_1, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_2, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_3, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_4, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_5, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_6, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_7, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_8, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_9, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_10, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_11, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_12, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_13, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_14, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_15, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_16, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_17, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_18, false)
				guiCheckBoxSetSelected(Edit_Rank_Permission_19, false)
				-- guiCheckBoxSetSelected(Edit_Rank_Permission_20, false)
				-- guiCheckBoxSetSelected(Edit_Rank_Permission_21, false)
				-- guiCheckBoxSetSelected(Edit_Rank_Permission_22, false)
				-- guiCheckBoxSetSelected(Edit_Rank_Permission_23, false)
				guiSetEnabled(Edit_Rank_Permission_1, true)
				guiSetEnabled(Edit_Rank_Permission_2, true)
				guiSetEnabled(Edit_Rank_Permission_3, true)
				guiSetEnabled(Edit_Rank_Permission_4, true)
				guiSetEnabled(Edit_Rank_Permission_5, true)
				guiSetEnabled(Edit_Rank_Permission_6, true)
				guiSetEnabled(Edit_Rank_Permission_7, true)
				guiSetEnabled(Edit_Rank_Permission_8, true)
				guiSetEnabled(Edit_Rank_Permission_9, true)
				guiSetEnabled(Edit_Rank_Permission_10, true)
				guiSetEnabled(Edit_Rank_Permission_11, true)
				guiSetEnabled(Edit_Rank_Permission_12, true)
				guiSetEnabled(Edit_Rank_Permission_13, true)
				guiSetEnabled(Edit_Rank_Permission_14, true)
				guiSetEnabled(Edit_Rank_Permission_15, true)
				guiSetEnabled(Edit_Rank_Permission_16, true)
				guiSetEnabled(Edit_Rank_Permission_17, true)
				guiSetEnabled(Edit_Rank_Permission_18, true)
				guiSetEnabled(Edit_Rank_Permission_19, true)
				guiSetEnabled(Edit_Rank_Permission_20, true)
				-- guiSetEnabled(Edit_Rank_Permission_21, true)
				-- guiSetEnabled(Edit_Rank_Permission_22, true)
				-- guiSetEnabled(Edit_Rank_Permission_23, true)
				local RankTable = guiGridListGetItemData(Group_Rank_Gridlist, selectedRank, 1)
				if RankTable[2] == 1 then
					guiSetEnabled(Edit_Rank_Permission_1, false)
					guiSetEnabled(Edit_Rank_Permission_2, false)
					guiSetEnabled(Edit_Rank_Permission_3, false)
					guiSetEnabled(Edit_Rank_Permission_4, false)
					guiSetEnabled(Edit_Rank_Permission_5, false)
					guiSetEnabled(Edit_Rank_Permission_6, false)
					guiSetEnabled(Edit_Rank_Permission_7, false)
					guiSetEnabled(Edit_Rank_Permission_8, false)
					guiSetEnabled(Edit_Rank_Permission_9, false)
					guiSetEnabled(Edit_Rank_Permission_10, false)
					guiSetEnabled(Edit_Rank_Permission_11, false)
					guiSetEnabled(Edit_Rank_Permission_12, false)
					guiSetEnabled(Edit_Rank_Permission_13, false)
					guiSetEnabled(Edit_Rank_Permission_14, false)
					guiSetEnabled(Edit_Rank_Permission_15, false)
					guiSetEnabled(Edit_Rank_Permission_16, false)
					guiSetEnabled(Edit_Rank_Permission_17, false)
					guiSetEnabled(Edit_Rank_Permission_18, false)
					guiSetEnabled(Edit_Rank_Permission_19, false)
					guiSetEnabled(Edit_Rank_Permission_20, false)
					-- guiSetEnabled(Edit_Rank_Permission_21, false)
					-- guiSetEnabled(Edit_Rank_Permission_22, false)
					-- guiSetEnabled(Edit_Rank_Permission_23, false)
				elseif RankTable[2] == 2 then
					guiSetEnabled(Edit_Rank_Permission_1, false)
					guiSetEnabled(Edit_Rank_Permission_2, false)
					guiSetEnabled(Edit_Rank_Permission_3, false)
					guiSetEnabled(Edit_Rank_Permission_4, false)
					guiSetEnabled(Edit_Rank_Permission_7, false)
					guiSetEnabled(Edit_Rank_Permission_9, false)
				end
				for i, num in ipairs(split(RankTable[1], ', ')) do
					local num = tonumber(num)
					if num == 1 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_1, true)
					elseif num == 2 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_2, true)
					elseif num == 3 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_3, true)
					elseif num == 4 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_4, true)
					elseif num == 5 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_5, true)
					elseif num == 6 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_6, true)
					elseif num == 7 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_7, true)
					elseif num == 8 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_8, true)
					elseif num == 9 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_9, true)
					elseif num == 10 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_10, true)
					elseif num == 11 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_11, true)
					elseif num == 12 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_12, true)
					elseif num == 13 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_13, true)
					elseif num == 14 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_14, true)
					elseif num == 15 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_15, true)
					elseif num == 16 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_16, true)
					elseif num == 17 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_17, true)
					elseif num == 18 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_18, true)
					elseif num == 19 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_19, true)
					elseif num == 20 then
						guiCheckBoxSetSelected(Edit_Rank_Permission_20, true)
					-- elseif num == 21 then
					-- 	guiCheckBoxSetSelected(Edit_Rank_Permission_21, true)
					-- elseif num == 22 then
					-- 	guiCheckBoxSetSelected(Edit_Rank_Permission_22, true)
					-- elseif num == 23 then
					-- 	guiCheckBoxSetSelected(Edit_Rank_Permission_23, true)
					end
				end
				setElementData(Edit_Rank_Window, "Rank", RankName, false)
				guiSetText(Edit_Rank_Window, ""..RankName.."")
				guiSetText(Edit_RankName_Edit, RankName)
				guiSetVisible(Edit_Rank_Window, true)
				guiBringToFront(Edit_Rank_Window)
			end
		end
	elseif source == Edit_Rank then
		local RankName = guiGetText(Edit_RankName_Edit)
		if RankName ~= "" and not isHasSpace(RankName) then
			permission = ""
			if guiCheckBoxGetSelected(Edit_Rank_Permission_1) then
				permission = "1 "
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_2) then
				permission = "2, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_3) then
				permission = "3, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_4) then
				permission = "4, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_5) then
				permission = "5, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_6) then
				permission = "6, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_7) then
				permission = "7, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_8) then
				permission = "8, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_9) then
				permission = "9, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_10) then
				permission = "10, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_11) then
				permission = "11, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_12) then
				permission = "12, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_13) then
				permission = "13, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_14) then
				permission = "14, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_15) then
				permission = "15, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_16) then
				permission = "16, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_17) then
				permission = "17, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_18) then
				permission = "18, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_19) then
				permission = "19, "..permission
			end
			if guiCheckBoxGetSelected(Edit_Rank_Permission_20) then
				permission = "20, "..permission
			end
			-- if guiCheckBoxGetSelected(Edit_Rank_Permission_21) then
			-- 	permission = "21, "..permission
			-- end
			-- if guiCheckBoxGetSelected(Edit_Rank_Permission_22) then
			-- 	permission = "22, "..permission
			-- end
			-- if guiCheckBoxGetSelected(Edit_Rank_Permission_23) then
			-- 	permission = "23, "..permission
			-- end
			triggerServerEvent("EditRank", localPlayer, getElementData(Edit_Rank_Window, "Rank"), RankName, permission)
			guiSetVisible(Edit_Rank_Window, false)
		end
	elseif source == Group_RemoveRank then
		local RankName = guiGridListGetItemText(Group_Rank_Gridlist, selectedRank, 1)
		if RankName ~= "" then
			guiBringToFront(CheckRemoveRankWindow)
			setElementData(CheckRemoveRankWindow, "Rank", RankName, false)
			guiSetText(CheckRemoveRankWindow, ""..RankName.." adlı rütbeyi kaldır")
			guiSetVisible(CheckRemoveRankWindow, true)
		end
	elseif source == YesRemoveRank then
		triggerServerEvent("RemoveRank", localPlayer, getElementData(CheckRemoveRankWindow, "Rank"))
		guiSetVisible(CheckRemoveRankWindow, false)
	elseif source == NoRemoveRank then
		guiSetVisible(CheckRemoveRankWindow, false)
	elseif source == Group_AddNewRank then
		guiSetText(Add_RankName_Edit, "")
		guiSetVisible(Add_Rank_Window, true)
		guiBringToFront(Add_Rank_Window)
		guiCheckBoxSetSelected(Add_Rank_Permission_1, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_2, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_3, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_4, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_5, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_6, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_7, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_8, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_9, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_10, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_11, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_12, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_13, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_14, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_15, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_16, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_17, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_18, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_19, false)
		guiCheckBoxSetSelected(Add_Rank_Permission_20, false)
		-- guiCheckBoxSetSelected(Add_Rank_Permission_21, false)
		-- guiCheckBoxSetSelected(Add_Rank_Permission_22, false)
		-- guiCheckBoxSetSelected(Add_Rank_Permission_23, false)
	elseif source == Add_NewRank then
		local nRankName = guiGetText(Add_RankName_Edit)
		local aAfter = guiComboBoxGetItemText(AddRankComboBox, guiComboBoxGetSelected(AddRankComboBox))
		if nRankName ~= "" and not isHasSpace(nRankName) then
			permission = ""
			if guiCheckBoxGetSelected(Add_Rank_Permission_1) then
				permission = "1 "
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_2) then
				permission = "2, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_3) then
				permission = "3, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_4) then
				permission = "4, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_5) then
				permission = "5, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_6) then
				permission = "6, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_7) then
				permission = "7, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_8) then
				permission = "8, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_9) then
				permission = "9, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_10) then
				permission = "10, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_11) then
				permission = "11, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_12) then
				permission = "12, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_13) then
				permission = "13, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_14) then
				permission = "14, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_15) then
				permission = "15, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_16) then
				permission = "16, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_17) then
				permission = "17, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_18) then
				permission = "18, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_19) then
				permission = "19, "..permission
			end
			if guiCheckBoxGetSelected(Add_Rank_Permission_20) then
				permission = "20, "..permission
			end
			-- if guiCheckBoxGetSelected(Add_Rank_Permission_21) then
			-- 	permission = "21, "..permission
			-- end
			-- if guiCheckBoxGetSelected(Add_Rank_Permission_22) then
			-- 	permission = "22, "..permission
			-- end
			-- if guiCheckBoxGetSelected(Add_Rank_Permission_23) then
			-- 	permission = "23, "..permission
			-- end
			triggerServerEvent("AddNewRank", localPlayer, nRankName, aAfter, permission)
			guiSetVisible(Add_Rank_Window, false)
		end
	elseif source == Add_Cancel then
		guiSetVisible(Add_Rank_Window, false)
	elseif source == Edit_Cancel then
		guiSetVisible(Edit_Rank_Window, false)
	end
end
addEventHandler("onClientGUIClick", resourceRoot, onRankClick)

function isHasSpace(text)
    for i = 1, #text do
        local byte = text:byte(i)
        if(byte == 32)then
            return true
        end
    end
    return false
end

function updateRankTable(rankTable, rank)
	currentRank = rank
	PermissionTable = {}
	guiGridListClear(Group_Rank_Gridlist)
	guiComboBoxClear(AddRankComboBox)
	for i, R in pairs(rankTable) do
		local row = guiGridListAddRow(Group_Rank_Gridlist)
		guiGridListSetItemText(Group_Rank_Gridlist, row, 1, R["group_rank_name"], false, false)
		guiGridListSetItemData(Group_Rank_Gridlist, row, 1, {R["group_rank_permission"], R["rank_type"]})
		if R["rank_type"] ~= 1 then
			guiComboBoxAddItem(AddRankComboBox, R["group_rank_name"])
		end
		if R["group_rank_name"] == rank then
			if R["rank_type"] == 1 then
				guiSetEnabled(Group_EditRank, true)
				guiSetEnabled(Group_RemoveRank, true)
				guiSetEnabled(Group_AddNewRank, true)
			else
				guiSetEnabled(Group_EditRank, false)
				guiSetEnabled(Group_RemoveRank, false)
				guiSetEnabled(Group_AddNewRank, false)
			end
			for i, num in ipairs(split(R["group_rank_permission"], ', ')) do
				PermissionTable[num] = true
			end
		end
	end
	guiCheckBoxSetSelected(Group_Rank_Permission_1, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_2, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_3, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_4, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_5, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_6, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_7, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_8, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_9, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_10, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_11, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_12, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_13, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_14, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_15, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_16, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_17, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_18, false)
	guiCheckBoxSetSelected(Group_Rank_Permission_19, false)
	-- guiCheckBoxSetSelected(Group_Rank_Permission_20, false)
	-- guiCheckBoxSetSelected(Group_Rank_Permission_21, false)
	-- guiCheckBoxSetSelected(Group_Rank_Permission_22, false)
	-- guiCheckBoxSetSelected(Group_Rank_Permission_23, false)
	local RankTable = guiGridListGetItemData(Group_Rank_Gridlist, (selectedRank or 0), 1)
	if RankTable then
		for i, num in ipairs(split(RankTable[1], ', ')) do
			local num = tonumber(num)
			if num == 1 then
				guiCheckBoxSetSelected(Group_Rank_Permission_1, true)
			elseif num == 2 then
				guiCheckBoxSetSelected(Group_Rank_Permission_2, true)
			elseif num == 3 then
				guiCheckBoxSetSelected(Group_Rank_Permission_3, true)
			elseif num == 4 then
				guiCheckBoxSetSelected(Group_Rank_Permission_4, true)
			elseif num == 5 then
				guiCheckBoxSetSelected(Group_Rank_Permission_5, true)
			elseif num == 6 then
				guiCheckBoxSetSelected(Group_Rank_Permission_6, true)
			elseif num == 7 then
				guiCheckBoxSetSelected(Group_Rank_Permission_7, true)
			elseif num == 8 then
				guiCheckBoxSetSelected(Group_Rank_Permission_8, true)
			elseif num == 9 then
				guiCheckBoxSetSelected(Group_Rank_Permission_9, true)
			elseif num == 10 then
				guiCheckBoxSetSelected(Group_Rank_Permission_10, true)
			elseif num == 11 then
				guiCheckBoxSetSelected(Group_Rank_Permission_11, true)
			elseif num == 12 then
				guiCheckBoxSetSelected(Group_Rank_Permission_12, true)
			elseif num == 13 then
				guiCheckBoxSetSelected(Group_Rank_Permission_13, true)
			elseif num == 14 then
				guiCheckBoxSetSelected(Group_Rank_Permission_14, true)
			elseif num == 15 then
				guiCheckBoxSetSelected(Group_Rank_Permission_15, true)
			elseif num == 16 then
				guiCheckBoxSetSelected(Group_Rank_Permission_16, true)
			elseif num == 17 then
				guiCheckBoxSetSelected(Group_Rank_Permission_17, true)
			elseif num == 18 then
				guiCheckBoxSetSelected(Group_Rank_Permission_18, true)
			elseif num == 19 then
				guiCheckBoxSetSelected(Group_Rank_Permission_19, true)
			-- elseif num == 20 then
				-- guiCheckBoxSetSelected(Group_Rank_Permission_20, true)
			-- elseif num == 21 then
			-- 	guiCheckBoxSetSelected(Group_Rank_Permission_21, true)
			-- elseif num == 22 then
			-- 	guiCheckBoxSetSelected(Group_Rank_Permission_22, true)
			-- elseif num == 23 then
			-- 	guiCheckBoxSetSelected(Group_Rank_Permission_23, true)
			end
		end
	end
	guiGridListSetSelectedItem(Group_Rank_Gridlist, (selectedRank or 0), 1)
end

Group_Info_Window = guiCreateWindow(x/2-252,y/2-203,505,406,"Bilgilendirme/Kurallar",false)
Group_Info_ButtonSave = guiCreateButton(315,368,95,29,"Kaydet",false,Group_Info_Window)
guiSetAlpha(Group_Info_Window,1)
guiSetVisible(Group_Info_Window, false)
guiWindowSetSizable(Group_Info_Window,false)
Group_Info_Memo = guiCreateMemo(9,28,485,333,"",false,Group_Info_Window)
guiSetProperty(Group_Info_Memo, "MaxTextLength", "8001")
Group_Info_ButtonClose = guiCreateButton(415,368,81,29,"Kapat",false,Group_Info_Window)

Max_Info_Label = guiCreateLabel(10,377,250,30,"(8001) Kalan karakter sayısı",false,Group_Info_Window)

addEventHandler("onClientGUIChanged", resourceRoot,
function()
	if source == Group_Info_Memo then
		local cT = guiGetText(Group_Info_Memo)
		guiSetText(Max_Info_Label, "("..8001-#cT..") Kalan karakter sayısı.")
	elseif source == ViewGroup_Info_Memo then
		local cT = guiGetText(ViewGroup_Info_Memo)
		guiSetText(Max_Info_LabelM, "("..8001-#cT..") Kalan karakter sayısı.")
	elseif source == Warn_Edit then
		local num = guiGetText(Warn_Edit)
		if tonumber(num) == nil or isHasSpace(num) or tonumber(num) < 0 then
			guiSetText(Warn_Edit, "0")
		elseif tonumber(num) > 100 then
			guiSetText(Warn_Edit, "100")
		end
		guiProgressBarSetProgress(Warn_Bar, tonumber(num) or 0)
	elseif source == GroupBank_Deposit_Edit then
		local num = guiGetText(GroupBank_Deposit_Edit)
		local money = getElementData(localPlayer, "altin") or 0
		if tonumber(num) == nil or isHasSpace(num) or tonumber(num) < 0 or tonumber(money) < 0 then
			guiSetText(GroupBank_Deposit_Edit, 0)
		elseif tonumber(num) > money then
			guiSetText(GroupBank_Deposit_Edit, tonumber(money))
		else
			guiSetText(GroupBank_Deposit_Edit, tonumber(num))
		end
	elseif source == GroupBank_Withdraw_Edit then
		local num = guiGetText(GroupBank_Withdraw_Edit)
		local currentBankBalance = currentBankBalance or 0
		if tonumber(num) == nil or isHasSpace(num) or tonumber(num) < 0 then
			guiSetText(GroupBank_Withdraw_Edit, 0)
		elseif tonumber(num) > currentBankBalance then
			guiSetText(GroupBank_Withdraw_Edit, tonumber(currentBankBalance))
		else
			guiSetText(GroupBank_Withdraw_Edit, tonumber(num))
		end
	elseif source == GroupBank_GiveAll_Edit then
		local num = guiGetText(GroupBank_GiveAll_Edit)
		local currentBankBalance = currentBankBalance or 0
		if tonumber(num) == nil or isHasSpace(num) or tonumber(num) < 0 then
			guiSetText(GroupBank_GiveAll_Edit, 0)
		elseif tonumber(num) > currentBankBalance then
			guiSetText(GroupBank_GiveAll_Edit, tonumber(currentBankBalance))
		else
			guiSetText(GroupBank_GiveAll_Edit, tonumber(num))
		end
	elseif source == GroupBank_GiveMember_Edit then
		local num = guiGetText(GroupBank_GiveMember_Edit)
		local currentBankBalance = currentBankBalance or 0
		if tonumber(num) == nil or isHasSpace(num) or tonumber(num) < 0 then
			guiSetText(GroupBank_GiveMember_Edit, 0)
		elseif tonumber(num) > currentBankBalance then
			guiSetText(GroupBank_GiveMember_Edit, tonumber(currentBankBalance))
		else
			guiSetText(GroupBank_GiveMember_Edit, tonumber(num))
		end
	end
end)

function Show_Groups_Window()
	if not guiGetVisible(Groups_Window) then
		guiSetVisible(Groups_Window, true)
		showCursor(true)
		triggerServerEvent("Request_Invite_List",localPlayer)
		triggerServerEvent("Send_Groups_List",localPlayer)
        -- triggerServerEvent("Envanter:Yenile",localPlayer)
        -- marketListe()
	else
		guiSetVisible(Groups_Window, false)
		guiSetVisible(Group_List_Window, false)
		guiSetVisible(Group_Invite_Window, false)
		guiSetVisible(myGroup_Invite_Window, false)
		guiSetVisible(MyGroup_Members_Window, false)
		guiSetVisible(renk_ayar_panel, false)
		guiSetVisible(Group_Info_Window, false)
		guiSetVisible(Group_Leader_Window, false)
		guiSetVisible(Group_Rank_Window, false)
		guiSetVisible(Add_Rank_Window, false)
		guiSetVisible(Edit_Rank_Window, false)
		guiSetVisible(CheckRemoveRankWindow, false)
		guiSetVisible(Promote_Demote_Window, false)
		guiSetVisible(Warn_Window, false)
		guiSetVisible(GroupBank_Window, false)
		guiSetVisible(Group_History_Window, false)
		guiSetVisible(Group_BlackList_Window, false)
		guiSetVisible(Group_TopTurf_Window, false)
		guiSetVisible(Group_TopBank_Window, false)
		guiSetVisible(Group_BlackList_Block_Windowserial, false)
		guiSetVisible(Group_BlackList_Block_Window, false)
        -- guiSetVisible(KlanMarketGui, false)
        -- guiSetVisible(KlanEnvanterGui, false)
		showCursor(false)
		guiSetInputEnabled(false)
		setElementData ( localPlayer, "MTAWindowActive", false)
        -- guiGridListClear(MarketList)
        -- guiGridListClear(EnvanterList)
	end
end
bindKey("F6","down", Show_Groups_Window)

function setButtonStat()
	if getElementData(localPlayer, "Group") then
		guiSetText(Name_Group_Label,"Klan İsmi: "..getElementData(localPlayer, "Group"))
		guiSetEnabled(Create_Group_Button, false)
		guiSetEnabled(Leave_Group_Button, true)
		guiSetEnabled(Members_Group_Button, true)
		guiSetEnabled(InfoEdit_Group_Button, true)
		guiSetEnabled(Group_Rank_Button, true)
		guiSetEnabled(Group_Bank_Button, true)
		guiSetEnabled(Group_History_Button, true)
		guiSetEnabled(Group_BlackList_Button, true)
        -- guiSetEnabled(KlanMarket, true)
        -- guiSetEnabled(KlanEnvanter, true)
		-- bindKey("i","down","chatbox","GroupChat")
	else
		guiSetText(Name_Group_Label,"Klan adı: Klanda değilsin")
		guiSetEnabled(Create_Group_Button, true)
		guiSetEnabled(Leave_Group_Button, false)
		guiSetEnabled(Members_Group_Button, false)
		guiSetEnabled(InfoEdit_Group_Button, false)
		guiSetEnabled(Group_Rank_Button, false)
		guiSetEnabled(Group_Bank_Button, false)
		guiSetEnabled(Group_History_Button, false)
		guiSetEnabled(Group_BlackList_Button, false)
        -- guiSetEnabled(KlanMarket, false)
        -- guiSetEnabled(KlanEnvanter, false)
		-- unbindKey("i","down","chatbox","GroupChat")
	end
	guiSetEnabled(Promote_Button, false)
	guiSetEnabled(Demote_Button, false)
	guiSetEnabled(WL_Button, false)
	guiSetEnabled(Mute_Button, false)
	guiSetEnabled(Renk_ayar_Button, false)
	guiSetEnabled(Group_Info_ButtonSave, false)
	guiMemoSetReadOnly(ViewGroup_Info_Memo, true)
	guiSetEnabled(Admin_Group_Button, false)
	guiSetEnabled(InvitesPlayer_Group_Button, false)
	guiSetEnabled(Group_History_Button, false)
	guiSetEnabled(Group_BlackList_Button, false)
	guiSetEnabled(GroupBank_Deposit_Button, false)
	guiSetEnabled(GroupBank_Withdraw_Button, false)
	guiSetEnabled(Group_Rank_Button, false)
	guiSetEnabled(GroupBank_GiveAll_Button, false)
	guiSetEnabled(GroupBank_GiveMember_Button, false)
	local value = getElementData(localPlayer, "GroupRank")
	if type(value) == "table" then
		updateRankTable(value[1], value[2])
	else
		updateRankTable({}, false)
	end
	if PermissionTable["1"] then
		-- guiSetEnabled(Demote_Button, true)
	end
	if PermissionTable["2"] then
		-- guiSetEnabled(Promote_Button, true)
	end
	if PermissionTable["3"] then
		-- kick player
	end
	if PermissionTable["4"] then
		-- promote player until thier own rank
	end
	if PermissionTable["5"] then -- edit info
		guiSetEnabled(Group_Info_ButtonSave, true)
		guiSetEnabled(Renk_ayar_Button, true)
		guiMemoSetReadOnly(ViewGroup_Info_Memo, false)
	end
	if PermissionTable["6"] then -- invite
		guiSetEnabled(InvitesPlayer_Group_Button, true)
	end
	if PermissionTable["7"] then -- delete the group
		guiSetEnabled(Admin_Group_Button, true)
	end
	if PermissionTable["8"] then
		-- view history
		guiSetEnabled(Group_History_Button, true)
	end
	if PermissionTable["9"] then
		-- demote player with same rank
	end
	if PermissionTable["10"] then
		-- deposit money
		guiSetEnabled(GroupBank_Deposit_Button, true)
	end
	if PermissionTable["11"] then
		-- withdraw money
		guiSetEnabled(GroupBank_Withdraw_Button, true)
		guiSetEnabled(Group_Rank_Button, true)
	end
	if PermissionTable["12"] then
		-- turf color
	end
	if PermissionTable["13"] then
		-- chat color
	end
	if PermissionTable["14"] then
		-- warn members
	end
	if PermissionTable["15"] then
		--give all players
		guiSetEnabled(GroupBank_GiveAll_Button, true)
	end
	if PermissionTable["16"] then
		--Mute Members
	end
	if PermissionTable["17"] then
		-- give one member
		guiSetEnabled(GroupBank_GiveMember_Button, true)
	end
	if PermissionTable["18"] then
		guiSetEnabled(GroupHistory_Button_DeleteLog, true)
	end
	if PermissionTable["19"] then
		-- guiSetEnabled(KlanMarket, true)
	end
	if PermissionTable["20"] then
		-- guiSetEnabled(KlanEnvanter, true)
	end
	if PermissionTable["21"] then
		guiSetEnabled(Group_BlackList_SerialAdd, true)
	end
	if PermissionTable["22"] then
		guiSetEnabled(Group_BlackList_AccountRemove, true)
	end
	if PermissionTable["23"] then
		guiSetEnabled(Group_BlackList_SerialRemove, true)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, setButtonStat)

addEventHandler("onClientElementDataChange", root,
function(dataName,oldData)
	if getElementType(source) == "player" and source == localPlayer then
		if dataName == "Group" then
			if getElementData(localPlayer, "Group") then
				guiSetText(Name_Group_Label,"Klan İsmi: "..getElementData(localPlayer, "Group"))
				guiSetEnabled(Create_Group_Button, false)
				guiSetEnabled(Leave_Group_Button, true)
				guiSetEnabled(Members_Group_Button, true)
				guiSetEnabled(InfoEdit_Group_Button, true)
				guiSetEnabled(Group_Rank_Button, true)
				guiSetEnabled(Group_Bank_Button, true)
				guiSetEnabled(Group_History_Button, true)
				guiSetEnabled(Group_BlackList_Button, true)
                -- guiSetEnabled(KlanMarket, true)
                -- guiSetEnabled(KlanEnvanter, true)
				-- bindKey("i","down","chatbox","GroupChat")
			else
				guiSetText(Name_Group_Label,"Klan adı: Klanda değilsin")
				guiSetEnabled(Create_Group_Button, true)
				guiSetEnabled(Leave_Group_Button, false)
				guiSetEnabled(Members_Group_Button, false)
				guiSetEnabled(InfoEdit_Group_Button, false)
				guiSetEnabled(Group_Rank_Button, false)
				guiSetEnabled(Group_Bank_Button, false)
				guiSetEnabled(Group_History_Button, false)
				guiSetEnabled(Group_BlackList_Button, false)
                -- guiSetEnabled(KlanMarket, false)
                -- guiSetEnabled(KlanEnvanter, false)
				-- unbindKey("i","down","chatbox","GroupChat")
			end
		elseif dataName == "GroupRank" then
			local value = getElementData(localPlayer, dataName)
			if type(value) == "table" then
				updateRankTable(value[1], value[2])
			else
				updateRankTable({}, false)
			end
		end
		if dataName ~= "GroupRank" and dataName ~= "Group" then return end
		guiSetEnabled(Promote_Button, false)
		guiSetEnabled(Demote_Button, false)
		guiSetEnabled(WL_Button, false)
		guiSetEnabled(Mute_Button, false)
		guiSetEnabled(Group_Info_ButtonSave, false)
		guiSetEnabled(Renk_ayar_Button, false)
		guiMemoSetReadOnly(ViewGroup_Info_Memo, true)
		guiSetEnabled(Admin_Group_Button, false)
		guiSetEnabled(InvitesPlayer_Group_Button, false)
		guiSetEnabled(Group_History_Button, false)
		guiSetEnabled(Group_BlackList_Button, false)
		guiSetEnabled(GroupBank_Deposit_Button, false)
		guiSetEnabled(GroupBank_GiveMember_Button, false)
		guiSetEnabled(GroupBank_Withdraw_Button, false)
		guiSetEnabled(Group_Rank_Button, false)
		guiSetEnabled(GroupBank_GiveAll_Button, false)
        -- guiSetEnabled(KlanMarket, false)
        -- guiSetEnabled(KlanEnvanter, false)
		if PermissionTable["1"] then
		    -- guiSetEnabled(Demote_Button, true)
		end
		if PermissionTable["2"] then
			-- guiSetEnabled(Promote_Button, true)
		end
		if PermissionTable["3"] then
			-- kick player
		end
		if PermissionTable["4"] then
			-- promote player until thier own rank
		end
		if PermissionTable["5"] then -- edit info
			guiSetEnabled(Group_Info_ButtonSave, true)
			guiSetEnabled(Renk_ayar_Button, true)
			guiMemoSetReadOnly(ViewGroup_Info_Memo, false)
		end
		if PermissionTable["6"] then -- invite
			guiSetEnabled(InvitesPlayer_Group_Button, true)
		end
		if PermissionTable["7"] then -- delete the group
			guiSetEnabled(Admin_Group_Button, true)
		end
		if PermissionTable["8"] then
			-- view history
			guiSetEnabled(Group_History_Button, true)
		end
		if PermissionTable["9"] then
			-- demote player with same rank
		end
		if PermissionTable["10"] then
			-- deposit money
		guiSetEnabled(GroupBank_Deposit_Button, true)
		end
		if PermissionTable["11"] then
			-- withdraw money
			guiSetEnabled(GroupBank_Withdraw_Button, true)
			guiSetEnabled(Group_Rank_Button, true)
		end
		if PermissionTable["12"] then
			-- turf color
		end
		if PermissionTable["13"] then
			-- chat color
		end
		if PermissionTable["14"] then
			-- warn members
		end
		if PermissionTable["15"] then
			guiSetEnabled(GroupBank_GiveAll_Button, true)
		end
		if PermissionTable["16"] then
			--Mute Members
		end
		if PermissionTable["17"] then
			-- give one member
			guiSetEnabled(GroupBank_GiveMember_Button, true)
		end
		if PermissionTable["18"] then
			-- guiSetEnabled(GroupHistory_Button_DeleteLo, true)
		end
		if PermissionTable["19"] then
			-- guiSetEnabled(KlanMarket, true)
		end
		if PermissionTable["20"] then
			-- guiSetEnabled(KlanEnvanter, true)
		end
		if PermissionTable["21"] then
			guiSetEnabled(Group_BlackList_SerialAdd, true)
		end
		if PermissionTable["22"] then
			guiSetEnabled(Group_BlackList_AccountRemove, true)
		end
		if PermissionTable["23"] then
			guiSetEnabled(Group_BlackList_SerialRemove, true)
		end
	end
end)

function on_Group_Click()
	if source == Create_Group_Button then
		local GroupName = tostring(guiGetText(Create_Group_Edit))
		if GroupName ~= "" then
			triggerServerEvent("Create_Group", localPlayer, GroupName)
			triggerServerEvent("Send_Groups_List",localPlayer)
		end
	elseif source == GroupList_Group_Button then
		guiSetVisible(Group_List_Window, not guiGetVisible(Group_List_Window))
		guiBringToFront(Group_List_Window)
		triggerServerEvent("Send_Groups_List",localPlayer)
	elseif source == Close_Group_Button then
		guiSetVisible(Groups_Window, false)
		guiSetVisible(Group_List_Window, false)
		guiSetVisible(Group_Invite_Window, false)
		guiSetVisible(myGroup_Invite_Window, false)
		guiSetVisible(MyGroup_Members_Window, false)
		guiSetVisible(renk_ayar_panel, false)
		guiSetVisible(Group_Leader_Window, false)
		guiSetVisible(Group_Rank_Window, false)
		guiSetVisible(Add_Rank_Window, false)
		guiSetVisible(Edit_Rank_Window, false)
		guiSetVisible(CheckRemoveRankWindow, false)
		guiSetVisible(Promote_Demote_Window, false)
		guiSetVisible(Warn_Window, false)
		guiSetVisible(GroupBank_Window, false)
		guiSetVisible(Group_History_Window,false)
		guiSetVisible(Group_BlackList_Window, false)
		guiSetVisible(Group_BlackList_Block_Windowserial, false)
		guiSetVisible(Group_BlackList_Block_Window, false)
		showCursor(false)
		setElementData ( localPlayer, "MTAWindowActive", false)
	elseif source == myInvites_Group_Button then
		guiSetVisible(myGroup_Invite_Window, not guiGetVisible(myGroup_Invite_Window))
		guiBringToFront(myGroup_Invite_Window)
		triggerServerEvent("Request_Invite_List", localPlayer)
	elseif source == Admin_Group_Button then
		guiSetVisible(Group_Leader_Window, not guiGetVisible(Group_Leader_Window))
		guiBringToFront(Group_Leader_Window)
	elseif source == Group_Rank_Button then
		guiSetVisible(Group_Rank_Window, not guiGetVisible(Group_Rank_Window))
		guiBringToFront(Group_Rank_Window)
	elseif source == Group_List_Button then
		guiSetVisible(Group_List_Window, false)
	elseif source == Leave_Group_Button then
		if getElementData(localPlayer,"Group") then
			guiSetVisible(CheckLeaveWindow, true)
			guiBringToFront(CheckLeaveWindow)
			guiSetText(CheckLeaveWindow, ""..getElementData(localPlayer, "Group").." adlı klandan ayrıl")
		end
	elseif source == YesLeaveGroup then
		if getElementData(localPlayer,"Group") then
			triggerServerEvent("Leave_Group", localPlayer)
		end
		guiSetVisible(CheckLeaveWindow, false)
	elseif source == NoLeaveGroup then
		guiSetVisible(CheckLeaveWindow, false)
	elseif source == Close_Group_Invite_Button then
		guiSetVisible(myGroup_Invite_Window, false)
	elseif source == Group_Invite_Button then
		local InvPlayer = guiGridListGetItemData(Group_Invite_Grid,guiGridListGetSelectedItem(Group_Invite_Grid),1)
		-- guiGridListGetItemData(grid, selectedRow, selectedColumn)
		local InvitedPlayer = getPlayerFromName(InvPlayer)
		if InvitedPlayer and not getElementData(InvitedPlayer, "Group") then
			triggerServerEvent("Invite_Player", localPlayer, getElementData(localPlayer, "Group"), InvitedPlayer)
			guiSetVisible(Group_Invite_Window, false)
		end
	elseif source == InvitesPlayer_Group_Button then
		guiSetVisible(Group_Invite_Window, not guiGetVisible(Group_Invite_Window))
		guiBringToFront(Group_Invite_Window)
		guiGridListClear(Group_Invite_Grid)
		for i, player in pairs(getElementsByType("player")) do
			if not getElementData(player, "Group") then
				local row = guiGridListAddRow(Group_Invite_Grid)
				guiGridListSetItemText(Group_Invite_Grid, row, 1, string.gsub (getPlayerName(player), "#%x%x%x%x%x%x", ""), false, false)
				guiGridListSetItemData ( Group_Invite_Grid, row, 1, getPlayerName(player))
			end
		end
	elseif source == Accept_Group_Invite_Button then
		local AccGroup = tostring(guiGridListGetItemText(myGroup_Invite_Grid,guiGridListGetSelectedItem(myGroup_Invite_Grid),1))
		if AccGroup ~= "" and not getElementData(localPlayer,"Group") then
			triggerServerEvent("Accept_Invite", localPlayer, AccGroup)
		end
	elseif source == Reject_Group_Invite_Button then
		local AccGroup = tostring(guiGridListGetItemText(myGroup_Invite_Grid,guiGridListGetSelectedItem(myGroup_Invite_Grid),1))
		if AccGroup ~= "" then
			triggerServerEvent("Reject_Invite", localPlayer, AccGroup)
		end
	elseif source == Group_Invite_Close then
		guiSetVisible(Group_Invite_Window,false)
	elseif source == Group_Leader_Close then
		guiSetVisible(Group_Leader_Window,false)
	elseif source == InfoEdit_Group_Button then
		guiSetVisible(Group_Info_Window,not guiGetVisible(Group_Info_Window))
		guiBringToFront(Group_Info_Window)
		guiSetInputEnabled(true)
		triggerServerEvent("Request_Group_Info",localPlayer,getElementData(localPlayer,"Group"))
	elseif source == Group_Info_ButtonSave then
		local infoText = tostring(guiGetText(Group_Info_Memo))
		if infoText ~= "" then
			triggerServerEvent("update_Group_Info",localPlayer,getElementData(localPlayer,"Group"),infoText)
		end
	elseif source == Group_Info_ButtonClose then
		guiSetVisible(Group_Info_Window,false)
		guiSetInputEnabled(true)
	elseif source == Group_CloseRankWindow then
		guiSetVisible(Group_Rank_Window, false)
	end
end
addEventHandler("onClientGUIClick", resourceRoot, on_Group_Click)

addEvent("onLeave_Group", true)
addEventHandler("onLeave_Group", root,
function ()
	guiSetText(Name_Group_Label, "Klan adı: Klanda değilsin")
	guiSetEnabled(Create_Group_Button, true)
	guiSetEnabled(Leave_Group_Button, false)
	guiSetEnabled(InvitesPlayer_Group_Button, false)
	guiSetEnabled(InfoEdit_Group_Button, false)
	guiSetEnabled(Admin_Group_Button, false)
	guiSetEnabled(Members_Group_Button, false)
end)

addEvent("Set_Top_Kills", true)
addEventHandler("Set_Top_Kills", root,
function (killtable)
	for index, group in pairs(sortTable(killtable)) do
		local row = guiGridListAddRow(Group_TopKill_Points)
		guiGridListSetItemText(Group_TopKill_Points, row, 1, tostring("["..index.."]"), false, false)
		guiGridListSetItemText(Group_TopKill_Points, row, 2, tostring(group.group), false, false)
		guiGridListSetItemText(Group_TopKill_Points, row, 3, tostring(group.points), false, false)
		if index == 1 or index == 2 or index == 3 then
			guiGridListSetItemColor(Group_TopKill_Points, row, 1, 0, 255, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 2, 0, 255, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 3, 0, 255, 0)
		elseif index == 4 or index == 5 or index == 6 then
			guiGridListSetItemColor(Group_TopKill_Points, row, 1, 255, 255, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 2, 255, 255, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 3, 255, 255, 0)
		elseif index == 7 or index == 8 or index == 9 then
			guiGridListSetItemColor(Group_TopKill_Points, row, 1, 255, 170, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 2, 255, 170, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 3, 255, 170, 0)
		elseif index >= 10 then
			guiGridListSetItemColor(Group_TopKill_Points, row, 1, 255, 0, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 2, 255, 0, 0)
			guiGridListSetItemColor(Group_TopKill_Points, row, 3, 255, 0, 0)
		end
		if index >= 10 then
			guiGridListRemoveRow (Group_TopKill_Points, index)
			break
        end
	end
end
)

addEvent("Set_Top_Turf", true)
addEventHandler("Set_Top_Turf", root,
function (toptable)
	for index, group in pairs(sortTable(toptable)) do
		local row = guiGridListAddRow(Group_TopTurf_Points)
		guiGridListSetItemText(Group_TopTurf_Points, row, 1, tostring("["..index.."]"), false, false)
		guiGridListSetItemText(Group_TopTurf_Points, row, 2, tostring(group.group), false, false)
		guiGridListSetItemText(Group_TopTurf_Points, row, 3, tostring(group.points), false, false)
		if index == 1 or index == 2 or index == 3 then
			guiGridListSetItemColor(Group_TopTurf_Points, row, 1, 0, 255, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 2, 0, 255, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 3, 0, 255, 0)
		elseif index == 4 or index == 5 or index == 6 then
			guiGridListSetItemColor(Group_TopTurf_Points, row, 1, 255, 255, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 2, 255, 255, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 3, 255, 255, 0)
		elseif index == 7 or index == 8 or index == 9 then
			guiGridListSetItemColor(Group_TopTurf_Points, row, 1, 255, 170, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 2, 255, 170, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 3, 255, 170, 0)
		elseif index >= 10 then
			guiGridListSetItemColor(Group_TopTurf_Points, row, 1, 255, 0, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 2, 255, 0, 0)
			guiGridListSetItemColor(Group_TopTurf_Points, row, 3, 255, 0, 0)
		end
		if index >= 20 then
			guiGridListRemoveRow (Group_TopTurf_Points, index)
			break
        end
	end
end
)

addEvent("Set_Top_Bank", true)
addEventHandler("Set_Top_Bank", root,
function (banktable)
	guiGridListClear(Group_TopBank_List)
	for index, group in pairs(sortTable(banktable)) do
		local row = guiGridListAddRow(Group_TopBank_List)
		guiGridListSetItemText(Group_TopBank_List, row, 1, tostring("["..index.."]"), false, false)
		guiGridListSetItemText(Group_TopBank_List, row, 2, tostring(group.group), false, false)
		guiGridListSetItemText(Group_TopBank_List, row, 3, tostring(group.points), false, false)
		if index == 1 or index == 2 or index == 3 then
			guiGridListSetItemColor(Group_TopBank_List, row, 1, 0, 255, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 2, 0, 255, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 3, 0, 255, 0)
		elseif index == 4 or index == 5 or index == 6 then
			guiGridListSetItemColor(Group_TopBank_List, row, 1, 255, 255, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 2, 255, 255, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 3, 255, 255, 0)
		elseif index == 7 or index == 8 or index == 9 then
			guiGridListSetItemColor(Group_TopBank_List, row, 1, 255, 170, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 2, 255, 170, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 3, 255, 170, 0)
		elseif index >= 10 then
			guiGridListSetItemColor(Group_TopBank_List, row, 1, 255, 0, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 2, 255, 0, 0)
			guiGridListSetItemColor(Group_TopBank_List, row, 3, 255, 0, 0)
		end
		if index >= 10 then
			guiGridListRemoveRow (Group_TopBank_List, index)
			break
        end
	end
end
)

function sortTable(theTable)
    local rowdata = {}
    for index, group in pairs(theTable) do
        rowdata[index] = {
			group = group[1],
			points = group[2],
        }
    end
    local comparator = function (a, b)
        return (tonumber(a.points) or 0) > (tonumber(b.points) or 0)
    end
    table.sort(rowdata, comparator)
    return rowdata
end

addEvent("GroupList", true)
addEventHandler("GroupList", root,
function(groups)
	guiGridListClear(Group_List_Grid)
	GroupTotal = 0
	MemberTotal = 0
	for i, group in pairs(groups) do
		rowsa = guiGridListAddRow(Group_List_Grid)
		GroupTotal = GroupTotal + 1
		MemberTotal = MemberTotal + group["group_members"]
		guiGridListSetItemText(Group_List_Grid, rowsa, 1, group["group_name"], false, false)
		guiGridListSetItemText(Group_List_Grid, rowsa, 2, group["group_members"].."/"..group["members_limit"], false, true)
		guiGridListSetItemText(Group_List_Grid, rowsa, 3, group["group_owner"], false, false)
	end
	guiSetText(Total_Groups, "Toplam Klan: "..GroupTotal)
	guiSetText(Total_Groups_Members, "Toplam Üye: "..MemberTotal)
end)

function sortTable(theTable)
    local rowdata = {}
    for index, groups in pairs(theTable) do
        rowdata[index] = {
            group = groups[1],
            points = groups[2],
        }
    end
    local comparator = function (a, b)
        return (tonumber(a.points) or 0) > (tonumber(b.points) or 0)
    end
    table.sort(rowdata, comparator)
    return rowdata
end

addEvent("Send_Group_Info", true)
addEventHandler("Send_Group_Info", root,
function(theInfo)
	guiSetText(Group_Info_Memo,theInfo)
end)

addEvent("Send_Invite_List", true)
addEventHandler("Send_Invite_List", root,
function(Invite)
	guiGridListClear(myGroup_Invite_Grid)
	invCont = 0
	if Invite then
		for i, Inv in pairs(Invite) do
			local row = guiGridListAddRow(myGroup_Invite_Grid)
			guiGridListSetItemText(myGroup_Invite_Grid, row, 1, Inv["group_name"], false, false)
			guiGridListSetItemText(myGroup_Invite_Grid, row, 2, string.gsub (Inv["byy"], "#%x%x%x%x%x%x", ""), false, false)
			invCont = invCont + 1
		end
	end
	guiSetText(myInvites_Group_Label, "Gelen davetler: "..invCont)
end)

Group_TopKill_Window = guiCreateWindow(x/2-185,y/2-225, 341, 445, "Top Kill", false)
guiWindowSetSizable(Group_TopKill_Window, false)
guiSetVisible(Group_TopKill_Window, false)
guiSetAlpha (Group_TopKill_Window,1)

Group_TopKill_Points = guiCreateGridList(9, 26, 322, 370, false, Group_TopKill_Window)
guiGridListAddColumn(Group_TopKill_Points, "#", 0.3)
guiGridListAddColumn(Group_TopKill_Points, "Group", 0.3)
guiGridListAddColumn(Group_TopKill_Points, "Points", 0.3)
Group_TopKill_Close = guiCreateButton(113, 411, 114, 24, "Close", false, Group_TopKill_Window)

Group_TopBank_Window = guiCreateWindow(x/2-185,y/2-225, 341, 445, "Klan Banka Sıralaması", false)
guiWindowSetSizable(Group_TopBank_Window, false)
guiSetVisible(Group_TopBank_Window, false)
guiSetAlpha (Group_TopBank_Window,1)

Group_TopBank_List = guiCreateGridList(9, 26, 322, 370, false, Group_TopBank_Window)
guiGridListAddColumn(Group_TopBank_List, "#", 0.3)
guiGridListAddColumn(Group_TopBank_List, "Klan", 0.3)
guiGridListAddColumn(Group_TopBank_List, "Altın", 0.3)
Group_TopBank_Close = guiCreateButton(113, 411, 114, 24, "Kapat", false, Group_TopBank_Window)

Group_TopTurf_Window = guiCreateWindow(x/2-185,y/2-225, 341, 445, "Klan Sıralaması", false)
guiWindowSetSizable(Group_TopTurf_Window, false)
guiSetVisible(Group_TopTurf_Window, false)
guiSetAlpha (Group_TopTurf_Window,1)

Group_TopTurf_Points = guiCreateGridList(9, 26, 322, 370, false, Group_TopTurf_Window)
guiGridListAddColumn(Group_TopTurf_Points, "#", 0.3)
guiGridListAddColumn(Group_TopTurf_Points, "Klan", 0.3)
guiGridListAddColumn(Group_TopTurf_Points, "Puan", 0.3)
Group_TopTurf_Close = guiCreateButton(113, 411, 114, 24, "Kapat", false, Group_TopTurf_Window)

Group_List_Window = guiCreateWindow(x/2-185,y/2-225,370,440,"Klan listesi",false)
guiSetAlpha(Group_List_Window, 1)
guiWindowSetSizable(Group_List_Window,false)
Group_List_Grid = guiCreateGridList(19,28,330,350,false,Group_List_Window)
guiGridListSetSelectionMode(Group_List_Grid,1)
guiGridListAddColumn(Group_List_Grid,"Klan",0.25)
guiGridListAddColumn(Group_List_Grid,"Toplam Üye",0.30)
guiGridListAddColumn(Group_List_Grid,"Sahibi",0.45)

guiSetVisible(Group_List_Window, false)
Total_Groups = guiCreateLabel(20,385,191,17,"Toplam Klan: 0",false,Group_List_Window)
Total_Groups_Members = guiCreateLabel(230,385,191,17,"Toplam Üye: 0",false,Group_List_Window)
Group_List_Button = guiCreateButton(150,408,68,25,"Kapat",false,Group_List_Window)
Group_Invite_Window = guiCreateWindow(x/2-140,y/2-201,280,402,"Davet et",false)
guiSetAlpha(Group_Invite_Window,1)

guiSetVisible(Group_Invite_Window, false)
guiWindowSetSizable(Group_Invite_Window,false)
Group_Invite_Grid = guiCreateGridList(10,60,261,247,false,Group_Invite_Window)
guiGridListSetSelectionMode(Group_Invite_Grid,2)
guiGridListAddColumn(Group_Invite_Grid,"Oyuncular",0.9)
Group_Invite_Label1 = guiCreateLabel(30,330,230,17,"Klanda olmayan kişileri davet ede bilirsiniz.",false,Group_Invite_Window)
Group_Invite_Label2 = guiCreateLabel(74,335,128,20,"davet ede bilirsiniz.",true,Group_Invite_Window)
Group_Invite_Button = guiCreateButton(11,367,101,24,"Davet et",false,Group_Invite_Window)
Group_Invite_Close = guiCreateButton(166,367,99,24,"Kapat",false,Group_Invite_Window)

ImageSearch = guiCreateStaticImage(242,30,22,22,"ara.png",false,Group_Invite_Window)
PlayerNameSearch = guiCreateEdit(10,30,220,20,"",false,Group_Invite_Window)

function SearchName()
     if (source == PlayerNameSearch) then
          guiGridListClear(Group_Invite_Grid)
          local text = guiGetText(source)
          if (text == "") then
               for i, player in pairs(getElementsByType("player")) do
                    if not getElementData(player, "Group") then
                         local row = guiGridListAddRow(Group_Invite_Grid)
                         guiGridListSetItemText(Group_Invite_Grid, row, 1, getPlayerName(player), false, false)
                    end
               end
          else
               for i, player in pairs(getElementsByType("player")) do
                    if not getElementData(player, "Group") then
                         if string.find (string.upper(getPlayerName(player)), string.upper(text), 1, true) then
                              local row = guiGridListAddRow(Group_Invite_Grid)
                              guiGridListSetItemText(Group_Invite_Grid, row, 1, getPlayerName(player), false, false)
                         end
                    end
               end
          end
     end
end
addEventHandler("onClientGUIChanged", PlayerNameSearch, SearchName)

myGroup_Invite_Window = guiCreateWindow(x/2-259,y/2-124,518,248,"Gelen davetler",false)
guiSetAlpha(myGroup_Invite_Window,1)
guiSetVisible(myGroup_Invite_Window, false)
guiWindowSetSizable(myGroup_Invite_Window,false)
myGroup_Invite_Grid = guiCreateGridList(12,32,491,156,false,myGroup_Invite_Window)
guiGridListSetSelectionMode(myGroup_Invite_Grid,1)
guiGridListAddColumn(myGroup_Invite_Grid,"Davet eden klan",0.4)
guiGridListAddColumn(myGroup_Invite_Grid,"Sizi davet eden kişi",0.55)
Accept_Group_Invite_Button = guiCreateButton(20,200,150,32,"Kabul et",false,myGroup_Invite_Window)
Reject_Group_Invite_Button = guiCreateButton(175,200,150,32,"Reddet",false,myGroup_Invite_Window)
Close_Group_Invite_Button = guiCreateButton(390,200,105,32,"Kapat",false,myGroup_Invite_Window)

Group_Leader_Window = guiCreateWindow(x/2-155,y/2-100,313,245,"Klanı Silme Paneli",false)
guiSetAlpha(Group_Leader_Window,1)
guiSetVisible(Group_Leader_Window, false)
guiWindowSetSizable(Group_Leader_Window,false)

Group_Leader_Label1 = guiCreateLabel(70,26,293,20,"Klanı Silme işlemi geri alınamaz !",false,Group_Leader_Window)
Group_Leader_Edit1 = guiCreateEdit(110,59,200,29,"",false,Group_Leader_Window)
Group_Leader_Edit2 = guiCreateEdit(125,99,200,29,"",false,Group_Leader_Window)
Group_Leader_Edit3 = guiCreateEdit(125,139,200,29,"",false,Group_Leader_Window)
Group_Leader_Label2 = guiCreateLabel(8,65,116,16,"Klan İsmini Onayla:",false,Group_Leader_Window)
Group_Leader_Label3 = guiCreateLabel(8,107,160,16,"Kullanıcı Adını Onayla:",false,Group_Leader_Window)
Group_Leader_Label4 = guiCreateLabel(8,145,148,16,"Hesap Şifreni Onayla:",false,Group_Leader_Window)
Group_Leader_Label5 = guiCreateLabel(11,208,44,20,"Onayla",false,Group_Leader_Window)
Group_Leader_Label6 = guiCreateLabel(11,221,54,13,"to delete",true,Group_Leader_Window)
Group_Leader_Checkbox = guiCreateCheckBox(63,208,15,16,"",false,false,Group_Leader_Window)
Group_Leader_Delete = guiCreateButton(92,205,119,28,"Klanı Sil",false,Group_Leader_Window)
Group_Leader_Close = guiCreateButton(233,205,71,28,"İptal",false,Group_Leader_Window)
guiEditSetMasked(Group_Leader_Edit3,true)

function on_Group_LeaderClick()
	if guiCheckBoxGetSelected(Group_Leader_Checkbox) then
		local GroupName = guiGetText(Group_Leader_Edit1)
		local AccountName = guiGetText(Group_Leader_Edit2)
		local AccountPassword = guiGetText(Group_Leader_Edit3)
		if GroupName == "" then
			outputChatBox("Klan ismini giriniz ! ", 0, 255, 0, true)
		elseif AccountName == "" then
			outputChatBox("Hesap ismini giriniz ! ", 0, 255, 0, true)
		elseif AccountPassword == "" then
		outputChatBox("Hesap şifrenizi giriniz ! ", 0, 255, 0, true)
		else
			triggerServerEvent("Leader_Group_Delete", localPlayer, GroupName, AccountName, AccountPassword)
		end
	end
end
addEventHandler("onClientGUIClick", Group_Leader_Delete,on_Group_LeaderClick, false)



MyGroup_Members_Grid = guiCreateGridList(20, 29, 602, 335,false,MyGroup_Members_Window)
guiGridListSetSelectionMode(MyGroup_Members_Grid,1)
guiGridListAddColumn(MyGroup_Members_Grid,"İsim",0.3)
guiGridListAddColumn(MyGroup_Members_Grid,"Hesap",0.23)
guiGridListAddColumn(MyGroup_Members_Grid,"Rütbe",0.15)
guiGridListAddColumn(MyGroup_Members_Grid,"Son Giriş",0.15)
guiGridListAddColumn(MyGroup_Members_Grid,"Uyarı",0.1)

renk_ayar_panel = guiCreateWindow(x/2-330, y/2-286, 600, 380, "Klan Ayarları", false)
guiSetVisible(renk_ayar_panel, false)

Redt = guiCreateEdit(137, 50, 82, 25, "0", false, renk_ayar_panel)--Turf
Greent = guiCreateEdit(240, 50, 82, 25, "0", false, renk_ayar_panel)
Bluet = guiCreateEdit(344, 50, 82, 25, "0", false, renk_ayar_panel)
ALabel = guiCreateLabel(41, 55, 86, 15, "Turf Rengi :", false, renk_ayar_panel)
SetTurfColor = guiCreateButton(436, 50, 108, 24, "Değiştir", false, renk_ayar_panel)

TAPLLABEL = guiCreateLabel(41, 125, 86, 15, "Sohbet Rengi :", false, renk_ayar_panel) --Chat
Redc = guiCreateEdit(137, 120, 82, 25, "0", false, renk_ayar_panel)
Greenc = guiCreateEdit(240, 120, 82, 25, "0", false, renk_ayar_panel)
Bluec = guiCreateEdit(344, 120, 82, 25, "0", false, renk_ayar_panel)
SetChatColor = guiCreateButton(436, 120, 108, 24, "Değiştir", false, renk_ayar_panel)

Alabeltag = guiCreateLabel(41, 195, 88, 15, "Tag Rengi :", false, renk_ayar_panel) --Tag
Redta = guiCreateEdit(137, 190, 82, 25, "0", false, renk_ayar_panel)
Greenta = guiCreateEdit(240, 190, 82, 25, "0", false, renk_ayar_panel)
Blueta = guiCreateEdit(344, 190, 82, 25, "0", false, renk_ayar_panel)
setTagColor = guiCreateButton(436, 190, 108, 24, "Değiştir", false, renk_ayar_panel)

KlanTagi = guiCreateLabel(41, 265, 88, 15, "Chat Tag :", false, renk_ayar_panel) --Tag
KlanTagEdit = guiCreateEdit(137, 260, 290, 25, "", false, renk_ayar_panel)
KlanTagDegistir = guiCreateButton(436, 260, 108, 24, "Değiştir", false, renk_ayar_panel),
guiEditSetMaxLength (KlanTagEdit, 5)

KlanKapasite = guiCreateLabel(41, 335, 88, 15, "Oyuncu Kapasitesi :", false, renk_ayar_panel) --Tag
KlanKapasiteEdit = guiCreateEdit(137, 330, 290, 25, "Arttırılacak kişi saysı örnek (5)", false, renk_ayar_panel)
KlanKapasiteDegistir = guiCreateButton(436, 330, 108, 24, "Değiştir", false, renk_ayar_panel),
guiEditSetMaxLength (KlanTagEdit, 5)

addEventHandler("onClientGUIClick", root, function()
	if source == KlanKapasiteDegistir then 
		if guiGetText(KlanKapasiteEdit) == "Arttırılacak kişi saysı örnek (5)" then guiSetText(KlanKapasiteEdit, "") end
		local sayi = guiGetText(KlanKapasiteEdit)
		local para = sayi * 10000
		triggerServerEvent("KlanKapasite", localPlayer, sayi, para)
	end
end)




-- KlanMarketGui = guiCreateWindow(x/2-460, y/2-236, 280, 440,"Klan Market",false)
-- guiSetAlpha(KlanMarketGui,1)
-- guiSetVisible(KlanMarketGui, false)

-- MarketList = guiCreateGridList(0.01, 0.1, 1, 0.66, true, KlanMarketGui)
-- MarketListCl = guiGridListAddColumn(MarketList, "Araç & Skin", 0.6)
-- MarketListCl2 = guiGridListAddColumn(MarketList, "Fiyat", 0.28)

-- SatinAl = guiCreateButton(5, 355, 270, 30, "Satın Al", false, KlanMarketGui)
-- SatinTest = guiCreateButton(5, 400, 270, 30, "Test Et", false, KlanMarketGui)


-- function marketListe()
-- for i,v in ipairs(market) do
--     local row = guiGridListAddRow(MarketList)
--     guiGridListSetItemText(MarketList, row, 1, tostring(v[1]), false, false)
--     guiGridListSetItemText(MarketList, row, 2, tostring(v[3]), false, false)
--     guiGridListSetItemData(MarketList, row, 1, tostring(v[2]))
-- end
-- end

-- addEventHandler("onClientGUIClick",root,function()
--         if (source == SatinAl) then
--         local row, col = guiGridListGetSelectedItem(MarketList)  
--             if (row and col and row ~= -1 and col ~= -1) then
--              local id = tonumber(guiGridListGetItemData(MarketList, row, 1))
--              local name = guiGridListGetItemText (MarketList, guiGridListGetSelectedItem (MarketList), 1)
--              local fiyat = guiGridListGetItemText (MarketList, guiGridListGetSelectedItem (MarketList), 2)
--                 if name ~= "" then
--                     local para = getPlayerMoney(localPlayer)
--                     if para >= tonumber(fiyat) then
--                     triggerServerEvent("Market:SatinAl", localPlayer, id,name,fiyat)
--                     outputChatBox("$"..fiyat.." Karşılığında "..name.." Satın Alındı ! ", 0, 255, 0, true)
--                     guiGridListClear(EnvanterList)
--                     triggerServerEvent("Envanter:Yenile", localPlayer)
--                     else
--                         outputChatBox(name.." Satın almak için yeterli paraya sahip değilsiniz !", 255, 0, 0, true)
--                     end
--                 end
--             end
--         end
--     end)

testArac = {}

-- addEventHandler("onClientGUIClick",root,function()
--         if (source == SatinTest) then
--         local row, col = guiGridListGetSelectedItem(MarketList)  
--             if (row and col and row ~= -1 and col ~= -1) then
--              local id = tonumber(guiGridListGetItemData(MarketList, row, 1))
--              local name = guiGridListGetItemText (MarketList, guiGridListGetSelectedItem (MarketList), 1)
--                 if name ~= "" then
--                     if name:find("Skin") then
--                     local skin = getElementModel(localPlayer)
--                     setElementModel(localPlayer, id)
--                     guiSetEnabled(SatinTest, false)
--                     setTimer(function ()
--                         setElementModel(localPlayer, skin)
--                         guiSetEnabled(SatinTest, true)
--                     end, 10000, 1)
--                     outputChatBox("Testin bitiş süresi 10 saniye ! ", 0, 255, 0, true)
--                     elseif name:find("Arac") then
--                         local x, y, z = getElementPosition(localPlayer)
--                         local rx, ry, rz = getElementRotation(localPlayer)
--                         testArac[localPlayer] = createVehicle(id, x+2.5,y,z+2, rx, ry, rz)
--                         guiSetEnabled(SatinTest, false)
--                     setTimer(function ()
--                         if isElement(testArac[localPlayer]) then
--                             destroyElement(testArac[localPlayer])
--                             guiSetEnabled(SatinTest, true)
--                         end
--                     end, 10000, 1)
--                     outputChatBox("Testin bitiş süresi 10 saniye ! ", 0, 255, 0, true)
--                     end
--                 end
--             end
--         end
--     end)


-- KlanEnvanterGui = guiCreateWindow(860, y/2-236, 280, 460,"Klan Envanter",false)
-- guiSetAlpha(KlanEnvanterGui,1)
-- guiSetVisible(KlanEnvanterGui, false)

-- EnvanterList = guiCreateGridList(0.01, 0.08, 1, 0.7, true, KlanEnvanterGui)
-- EnvanterListCl = guiGridListAddColumn(EnvanterList, "Envanter", 0.85)

-- EnvanterKullan = guiCreateButton(5, 380, 270, 30, "Kullan", false, KlanEnvanterGui)
-- EnvanterKaldir = guiCreateButton(5, 420, 270, 30, "Araç Gizle", false, KlanEnvanterGui)

-- addEventHandler("onClientGUIClick",root,function()
--         if (source == EnvanterKullan) then
--         local row, col = guiGridListGetSelectedItem(EnvanterList)  
--             if (row and col and row ~= -1 and col ~= -1) then
--              local id = tonumber(guiGridListGetItemData(EnvanterList, row, 1))
--              local name = guiGridListGetItemText (EnvanterList, guiGridListGetSelectedItem (EnvanterList), 1)
--                 if id ~= "" then
--                     if name:find("Skin") then
--                         triggerServerEvent("Envanter:Skin", localPlayer, id)
--                         guiGridListClear(EnvanterList)
--                         triggerServerEvent("Envanter:Yenile", localPlayer)
--                     elseif name:find("Arac") then
--                         triggerServerEvent("Envanter:Arac", localPlayer, id)
--                         guiGridListClear(EnvanterList)
--                         triggerServerEvent("Envanter:Yenile", localPlayer)
--                     end
--                 end
--             end
--         end
--     end)

-- addEventHandler("onClientGUIDoubleClick",root,function()
--         if (source == EnvanterList) then
--         local row, col = guiGridListGetSelectedItem(EnvanterList)  
--             if (row and col and row ~= -1 and col ~= -1) then
--              local id = tonumber(guiGridListGetItemData(EnvanterList, row, 1))
--              local name = guiGridListGetItemText (EnvanterList, guiGridListGetSelectedItem (EnvanterList), 1)
--                 if id ~= "" then
--                     if name:find("Skin") then
--                         triggerServerEvent("Envanter:Skin", localPlayer, id)
--                         guiGridListClear(EnvanterList)
--                         triggerServerEvent("Envanter:Yenile", localPlayer)
--                     elseif name:find("Arac") then
--                         triggerServerEvent("Envanter:Arac", localPlayer, id)
--                         guiGridListClear(EnvanterList)
--                         triggerServerEvent("Envanter:Yenile", localPlayer)
--                     end
--                 end
--             end
--         end
--     end)

-- addEvent("Market:Yenile", true)
-- addEventHandler("Market:Yenile", root, function (name,id)
--     local row = guiGridListAddRow(EnvanterList)
--     guiGridListSetItemText(EnvanterList, row, 1, tostring(name), false, false)
--     guiGridListSetItemData(EnvanterList, row, 1, tostring(id))
-- end)
    
-- addEventHandler("onClientGUIDoubleClick",root,function(btn)
--         if btn ~= 'left' then return false end 
--         local row, col = guiGridListGetSelectedItem(maskeList)  
--             if (row and col and row ~= -1 and col ~= -1) then
--             local name = guiGridListGetItemText (maskeList, guiGridListGetSelectedItem (maskeList), 1)
--                 if name ~= "" then
--                 triggerServerEvent( "vip:maskever", localPlayer, name)
--                 yenile()
--             end
--         end
--     end)    

addEventHandler("onClientRender",root,
function ()
	local Red = tonumber ( guiGetText ( Redt ) )
	local Green = tonumber ( guiGetText ( Greent ) )
	local Blue = tonumber ( guiGetText ( Bluet ) )
	local r = tonumber ( guiGetText ( Redc ) )
	local g = tonumber ( guiGetText ( Greenc ) )
	local b = tonumber ( guiGetText ( Bluec ) )
	local rt = tonumber ( guiGetText ( Redta ) )
	local gt = tonumber ( guiGetText ( Greenta ) )
	local bt = tonumber ( guiGetText ( Blueta ) )

end
)

function fix()
  if guiGetText(Redt) ~= "" then
    local input = tonumber(guiGetText(Redt))
    if not input then
      guiSetText(Redt, string.gsub(guiGetText(Redt), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Redt, "255")
    elseif input < 0 then
      guiSetText(Redt, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Redt,fix)

function fix()
  if guiGetText(Greent) ~= "" then
    local input = tonumber(guiGetText(Greent))
    if not input then
      guiSetText(Greent, string.gsub(guiGetText(Greent), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Greent, "255")
    elseif input < 0 then
      guiSetText(Greent, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Greent,fix)

function fix()
  if guiGetText(Bluet) ~= "" then
    local input = tonumber(guiGetText(Bluet))
    if not input then
      guiSetText(Bluet, string.gsub(guiGetText(Bluet), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Bluet, "255")
    elseif input < 0 then
      guiSetText(Bluet, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Bluet,fix)
-----------------------
function fix()
  if guiGetText(Redc) ~= "" then
    local input = tonumber(guiGetText(Redc))
    if not input then
      guiSetText(Redc, string.gsub(guiGetText(Redc), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Redc, "255")
    elseif input < 0 then
      guiSetText(Redc, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Redc,fix)

function fix()
  if guiGetText(Greenc) ~= "" then
    local input = tonumber(guiGetText(Greenc))
    if not input then
      guiSetText(Greenc, string.gsub(guiGetText(Greenc), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Greenc, "255")
    elseif input < 0 then
      guiSetText(Greenc, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Greenc,fix)

function fix()
  if guiGetText(Bluec) ~= "" then
    local input = tonumber(guiGetText(Bluec))
    if not input then
      guiSetText(Bluec, string.gsub(guiGetText(Bluec), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Bluec, "255")
    elseif input < 0 then
      guiSetText(Bluec, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Bluec,fix)
------------------------------------------------------

function fix()
  if guiGetText(Redta) ~= "" then
    local input = tonumber(guiGetText(Redta))
    if not input then
      guiSetText(Redta, string.gsub(guiGetText(Redta), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Redta, "255")
    elseif input < 0 then
      guiSetText(Redta, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Redta,fix)

function fix()
  if guiGetText(Greenta) ~= "" then
    local input = tonumber(guiGetText(Greenta))
    if not input then
      guiSetText(Greenta, string.gsub(guiGetText(Greenta), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Greenta, "255")
    elseif input < 0 then
      guiSetText(Greenta, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Greenta,fix)

function fix()
  if guiGetText(Blueta) ~= "" then
    local input = tonumber(guiGetText(Blueta))
    if not input then
      guiSetText(Blueta, string.gsub(guiGetText(Blueta), "[^%d]", ""))
    elseif input > 255 then
      guiSetText(Blueta, "255")
    elseif input < 0 then
      guiSetText(Blueta, "0")
    end
  end
  return
end
addEventHandler("onClientGUIChanged",Blueta,fix)
--------------------------------------------
Promote_Button = guiCreateButton(19, 374, 120, 32, "Rütbe ver", false, MyGroup_Members_Window)
Demote_Button = guiCreateButton(150, 374, 120, 32, "Rütbe düşür", false, MyGroup_Members_Window)
WL_Button = guiCreateButton(554, 420, 75, 32, "Uyar", false, MyGroup_Members_Window)
Mute_Button = guiCreateButton(426, 373, 118, 33, "Mute / Unmute", false, MyGroup_Members_Window)
BlipCheck = guiCreateCheckBox(41, 560, 268, 15, "Klan üyelerini işaretle (MAP)", false, false, MyGroup_Members_Window)
-- KlanTagCheck = guiCreateCheckBox(250, 560, 268, 18, "Klan Tagını Aç", false, false, MyGroup_Members_Window)
-- guiSetEnabled(KlanTagCheck, false)
-- guiSetVisible(MyGroup_Members_Window, false)

addEventHandler("onClientGUIClick", root, function()
	if source == Renk_ayar_Button then 
		guiSetVisible(renk_ayar_panel, not guiGetVisible(renk_ayar_panel))
		guiBringToFront ( renk_ayar_panel )
	end
end)


MyGroup_Members_Close = guiCreateButton(554, 373, 75, 32, "Kapat", false, MyGroup_Members_Window)

Promote_Demote_Window = guiCreateWindow(x/2-129.5,y/2-115, 259, 230, "", false)
guiSetVisible(Promote_Demote_Window, false)
guiWindowSetSizable(Promote_Demote_Window, false)
guiSetAlpha(Promote_Demote_Window, 1)

Promote_Demote_Combobox = guiCreateComboBox(15, 22, 228, 120, "Rütbe seç", false, Promote_Demote_Window)
Promote_Demote_Name = guiCreateLabel(22, 50, 216, 17, "", false, Promote_Demote_Window)
Promote_Demote_AccountName = guiCreateLabel(22, 75, 144, 16, "", false, Promote_Demote_Window)
Promote_Demote_Rank = guiCreateLabel(22, 100, 141, 19, "Current Rank: Trial", false, Promote_Demote_Window)
Promote_Demote_Reason = guiCreateLabel(82, 125, 95, 19, "Sebep:", false, Promote_Demote_Window)
Promote_Demote_Edit = guiCreateEdit(9, 146, 240, 27, "", false, Promote_Demote_Window)
Promote_Demote_Button = guiCreateButton(9, 188, 112, 30, "Düşür", false, Promote_Demote_Window)
Promote_Demote_Cancel = guiCreateButton(137, 188, 112, 30, "İptal", false, Promote_Demote_Window)

Warn_Window = guiCreateWindow(x/2-164,y/2-92, 328, 184, "", false)
guiSetVisible(Warn_Window, false)
guiWindowSetSizable(Warn_Window, false)
guiSetAlpha(Warn_Window,1)

guiCreateLabel(114, 28, 109, 19, "Uyarı seviyesi", false, Warn_Window)
Warn_Bar = guiCreateProgressBar(10, 50, 255, 23, false, Warn_Window)
Warn_Edit = guiCreateEdit(270, 50, 45, 23, "", false, Warn_Window)
guiCreateLabel(114, 83, 109, 19, "Sebep:", false, Warn_Window)
Warn_Reason_Edit = guiCreateEdit(9, 108, 304, 24, "", false, Warn_Window)
SetWarn_Button = guiCreateButton(10, 141, 141, 33, "Uyar", false, Warn_Window)
CancelWarn_Button = guiCreateButton(177, 141, 141, 33, "İptal", false, Warn_Window)

addEventHandler("onClientGUIClick",root,
function ()
	if source == Mute_Button then
	local selectedItem = guiGridListGetItemText(MyGroup_Members_Grid, guiGridListGetSelectedItem(MyGroup_Members_Grid),1)
	local Player = getPlayerFromName(selectedItem)
		if selectedItem ~= "" and selectedItem ~= getPlayerName(localPlayer) then
			triggerServerEvent ( "groupMutePlayer", localPlayer, Player )
		end
	end
end
)

addEventHandler("onClientGUIClick",root,
function ()
	if source == BlipCheck then
		if guiCheckBoxGetSelected(BlipCheck) == true then
			createGroupBlips ()
			addEventHandler("onClientPlayerQuit", root, destroyGroupBlipsOnQuit)
		else
			destroyGroupBlips ()
			removeEventHandler("onClientPlayerQuit", root, destroyGroupBlipsOnQuit)
		end
	end
end
)

-- addEventHandler("onClientGUIClick",root,
-- function ()
    -- if source == KlanTagCheck then
        -- if guiCheckBoxGetSelected(KlanTagCheck) == true then
            -- local etkin = guiCheckBoxGetSelected(KlanTagCheck)
            -- outputChatBox("Klan tagı başarıyla etkinleştirildi", 0,255,0, true)
            -- triggerServerEvent("klanTagEtkinlestir", localPlayer, etkin)
            -- guiSetText(KlanTagCheck, "Klan Tagını Kapat")
        -- else
            -- local etkin = guiCheckBoxGetSelected(KlanTagCheck)
            -- outputChatBox("Klan tagı başarıyla kapatıldı", 0,255,0, true)
            -- triggerServerEvent("klanTagEtkinlestir", localPlayer, etkin)
            -- guiSetText(KlanTagCheck, "Klan Tagını Aç")
        -- end
    -- end
-- end
-- )
--------------------------------------

function createGroupBlips()
	for k, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "Group") == getElementData(localPlayer,"Group") then
			GroupBlip = createBlipAttachedTo(v, 41)
			setElementData(GroupBlip, "GroupBlips","True")
		end
	end
end

function destroyGroupBlips()
	for k, v in ipairs(getElementsByType("player")) do
		if getElementData(v,"Group") == getElementData(localPlayer,"Group") then
			for i, members in ipairs (getAttachedElements(v)) do
				if getElementType(members) == "blip" and getElementData(members, "GroupBlips") == "True" then
					destroyElement(members)
				end
			end
		end
	end
end

function destroyGroupBlipsOnQuit()
	for k, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "Group") == getElementData(localPlayer, "Group") then
			for i, memb in ipairs (getAttachedElements(localPlayer)) do
				if getElementType(memb) and getElementData(memb, "GroupBlips") == "True" then
					destroyElement(memb)
				end
			end
		end
	end
end

function on_MyGroup_MemberClick()
	if source == Members_Group_Button then
		guiSetVisible(MyGroup_Members_Window,not guiGetVisible(MyGroup_Members_Window))
		guiGridListClear(MyGroup_Members_Grid)
		guiBringToFront(MyGroup_Members_Window)
		triggerServerEvent("Request_myGroup_MembersList", localPlayer, getElementData(localPlayer,"Group"))
		if PermissionTable["13"] then
			guiSetEnabled(SetChatColor, true)
			guiSetEnabled(setTagColor, true)
		else
			guiSetEnabled(SetChatColor, false)
			guiSetEnabled(setTagColor, false)
		end
		if PermissionTable["12"] then
			guiSetEnabled(SetTurfColor, true)
		else
			guiSetEnabled(SetTurfColor, false)
		end
	elseif source == MyGroup_Members_Grid then
		local Name = guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),1)
		if Name ~= "" and Name ~= getPlayerName(localPlayer) then
			if PermissionTable["2"] then
				guiSetEnabled(Promote_Button, true)
			else
				guiSetEnabled(Promote_Button, false)
			end
			if PermissionTable["3"] then
				guiSetEnabled(Demote_Button, true)
			else
				guiSetEnabled(Demote_Button, false)
			end
			if PermissionTable["14"] then
				guiSetEnabled(WL_Button, true)
			else
				guiSetEnabled(WL_Button, false)
			end
			if PermissionTable["16"] then
				guiSetEnabled(Mute_Button, true)
			else
				guiSetEnabled(Mute_Button, false)
			end
            if PermissionTable["16"] then
                guiSetEnabled(Renk_ayar_Button, true)
            else
                guiSetEnabled(Renk_ayar_Button, false)
            end
		else
			guiSetEnabled(Promote_Button, false)
			guiSetEnabled(Demote_Button, false)
			guiSetEnabled(WL_Button, false)
			guiSetEnabled(Mute_Button, false)
		end
	elseif source == Promote_Button then
		local Account = guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),2)
		if Account ~= "" then
			guiSetVisible(Promote_Demote_Window, true)
			guiBringToFront(Promote_Demote_Window)
			guiSetText(Promote_Demote_Window, "Rütbe Yükselt")
			setElementData(Promote_Demote_Window, "Who", Account, false)
			guiSetText(Promote_Demote_Name, "İsim: "..guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),1))
			guiSetText(Promote_Demote_AccountName, "Hesap Adı: "..Account)
			guiSetText(Promote_Demote_Rank, "Rütbesi: "..guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),3))
			guiSetText(Promote_Demote_Button, "Yükselt")
			guiComboBoxClear(Promote_Demote_Combobox)
			gPromote = false
			for i = 0, guiGridListGetRowCount(Group_Rank_Gridlist)-1 do
				if PermissionTable["2"] then
					if guiGridListGetItemText(Group_Rank_Gridlist, i, 1) == guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),3) then
						gPromote = true
					end
					if gPromote and guiGridListGetItemText(Group_Rank_Gridlist, i, 1) ~= guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),3) then
						if PermissionTable["4"] then
							if guiGridListGetItemText(Group_Rank_Gridlist, i, 1) == currentRank then
								guiComboBoxAddItem(Promote_Demote_Combobox, guiGridListGetItemText(Group_Rank_Gridlist, i, 1))
								break
							else
								guiComboBoxAddItem(Promote_Demote_Combobox, guiGridListGetItemText(Group_Rank_Gridlist, i, 1))
							end
						else
							if guiGridListGetItemText(Group_Rank_Gridlist, i, 1) == currentRank then
								break
							else
								guiComboBoxAddItem(Promote_Demote_Combobox, guiGridListGetItemText(Group_Rank_Gridlist, i, 1))
							end
						end
					end
				end
			end
		end
	elseif source == Demote_Button then
		local Account = guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),2)
		if Account ~= "" then
			guiSetVisible(Promote_Demote_Window, true)
			guiBringToFront(Promote_Demote_Window)
			guiSetText(Promote_Demote_Window, "Rütbe Düşür")
			setElementData(Promote_Demote_Window, "Who", Account, false)
			guiSetText(Promote_Demote_Name, "İsim: "..guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),1))
			guiSetText(Promote_Demote_AccountName, "Hesap Adı: "..Account)
			guiSetText(Promote_Demote_Rank, "Rütbesi: "..guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),3))
			guiSetText(Promote_Demote_Button, "Düşür")
			guiComboBoxClear(Promote_Demote_Combobox)
			if PermissionTable["3"] then
				guiComboBoxAddItem(Promote_Demote_Combobox, "Klandan At")
			end
			for i = 0, guiGridListGetRowCount(Group_Rank_Gridlist)-1 do
				if PermissionTable["1"] then
					if guiGridListGetItemText(Group_Rank_Gridlist, i, 1) == guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),3) then
						break
					end
					if PermissionTable["9"] then
						if guiGridListGetItemText(Group_Rank_Gridlist, i, 1) == currentRank then
							guiComboBoxAddItem(Promote_Demote_Combobox, guiGridListGetItemText(Group_Rank_Gridlist, i, 1))
							break
						else
							guiComboBoxAddItem(Promote_Demote_Combobox, guiGridListGetItemText(Group_Rank_Gridlist, i, 1))
						end
					else
						if guiGridListGetItemText(Group_Rank_Gridlist, i, 1) == currentRank then
							break
						else
							guiComboBoxAddItem(Promote_Demote_Combobox, guiGridListGetItemText(Group_Rank_Gridlist, i, 1))
						end
					end
				end
			end
		end
	elseif source == Promote_Demote_Button then
		Reason = guiGetText(Promote_Demote_Edit)
		if Reason == "" or Reason:byte(1) == 32 then Reason = "Sebep Belirtilmedi" end
		if guiGetText(source) == "Yükselt" then
			local Promote = guiComboBoxGetItemText(Promote_Demote_Combobox, guiComboBoxGetSelected(Promote_Demote_Combobox))
			if Promote ~= "" and Promote ~= "Rütbe Seç" then
				triggerServerEvent("Promote_Demote", localPlayer, "Yükselt", getElementData(Promote_Demote_Window, "Who"), Promote, guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),3), Reason)
				guiSetVisible(Promote_Demote_Window, false)
			end
		elseif guiGetText(source) == "Düşür" then
			local Demote = guiComboBoxGetItemText(Promote_Demote_Combobox, guiComboBoxGetSelected(Promote_Demote_Combobox))
			if Demote ~= "" and Demote ~= "Düşür" then
				triggerServerEvent("Promote_Demote", localPlayer, "Düşür", getElementData(Promote_Demote_Window, "Who"), Demote, guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),3), Reason, Founder)
				guiSetVisible(Promote_Demote_Window, false)
			end
		end
	elseif source == Promote_Demote_Cancel then
		guiSetVisible(Promote_Demote_Window, false)
	elseif source == WL_Button then
		local Name = guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),1)
		if Name ~= "" then
			local currentLevel = guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),5)
			guiSetVisible(Warn_Window, true)
			guiBringToFront(Warn_Window)
			guiSetText(Warn_Window, ""..Name.." adlı oyuncuyu uyar")
			guiSetText(Warn_Edit, string.sub(currentLevel, 1, #currentLevel-1))
			guiProgressBarSetProgress(Warn_Bar, string.sub(currentLevel, 1, #currentLevel-1))
			setElementData(Warn_Window, "Who", guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),2))
		end
	elseif source == SetTurfColor then
			local Red = tonumber ( guiGetText(Redt) )
			local Green = tonumber ( guiGetText(Greent) )
			local Blue = tonumber ( guiGetText(Bluet) )
			triggerServerEvent("guiChangeTurfColor",localPlayer,Red,Green,Blue)
	elseif source == SetChatColor then
			local Red = tonumber ( guiGetText(Redc) )
			local Green = tonumber ( guiGetText(Greenc) )
			local Blue = tonumber ( guiGetText(Bluec) )
			triggerServerEvent("guiChangeChatColor",localPlayer,Red,Green,Blue)
	elseif source == setTagColor then
			local Red = tonumber ( guiGetText (Redta) )
			local Green = tonumber ( guiGetText(Greenta) )
			local Blue = tonumber ( guiGetText (Blueta) )
			triggerServerEvent("guiChangeChatTagColor",localPlayer,Red,Green,Blue)
    elseif source == KlanTagDegistir then
        local klanTagi = guiGetText(KlanTagEdit)
        triggerServerEvent("klanTag", localPlayer, klanTagi)
	elseif source == SetWarn_Button then
		local currentLevel = guiGridListGetItemText(MyGroup_Members_Grid,guiGridListGetSelectedItem(MyGroup_Members_Grid),5)
		local warnLevel = tonumber(guiGetText(Warn_Edit)) or 0
		local currentLevel = tonumber(string.sub(currentLevel, 1, #currentLevel-1))
		if warnLevel ~= currentLevel then
			Reason = guiGetText(Warn_Reason_Edit)
			if Reason == "" or Reason:byte(1) == 32 then Reason = "Sebep Belirtilmedi" end
			guiSetVisible(Warn_Window, false)
			if warnLevel > currentLevel then
				oLevel = "+"..math.abs(currentLevel-warnLevel)
			else
				oLevel = "-"..currentLevel-warnLevel
			end
			triggerServerEvent("setWarningLevel", localPlayer, getElementData(Warn_Window, "Who"), warnLevel, oLevel, Reason)
		end
	elseif source == CancelWarn_Button then
		guiSetVisible(Warn_Window, false)
	elseif source == Group_TopBank_Button then
		guiSetVisible(Group_TopBank_Window, not guiGetVisible(Group_TopBank_Window))
		guiBringToFront(Group_TopBank_Window)
		triggerServerEvent("Request_Top_Bank", localPlayer)
	elseif source == Group_TopBank_Close then
		guiSetVisible(Group_TopBank_Window, false)
	elseif source == Group_TopTurf_Close then
		guiSetVisible(Group_TopTurf_Window, false)
	elseif source == Group_TopKill_Button then
		guiSetVisible(Group_TopKill_Window, not guiGetVisible(Group_TopKill_Window))
		guiBringToFront(Group_TopKill_Window)
		triggerServerEvent("Request_Top_Kill", localPlayer)
	elseif source == Group_TopKill_Close then
		guiSetVisible(Group_TopKill_Window, false)
	elseif source == Group_TopTurf_Button then
		guiSetVisible(Group_TopTurf_Window, not guiGetVisible(Group_TopTurf_Window))
		guiBringToFront(Group_TopTurf_Window)
		guiGridListClear(Group_TopTurf_Points)
		triggerServerEvent("Request_Top_Turf", client)
	elseif source == MyGroup_Members_Close then
		guiSetVisible(MyGroup_Members_Window,not guiGetVisible(MyGroup_Members_Window))
		guiGridListClear(MyGroup_Members_Grid)
	elseif source == Group_History_Button then
		guiSetVisible(Group_History_Window, not guiGetVisible(Group_History_Window))
		guiBringToFront(Group_History_Window)
		guiGridListClear(Group_History_Log)
		triggerServerEvent("Request_Group_History", localPlayer )
	elseif source == GroupHistory_Button_Close then
		guiSetVisible(Group_History_Window, not guiGetVisible(Group_History_Window))
	elseif source == Group_Bank_Button then
		guiSetVisible(GroupBank_Window, not guiGetVisible(GroupBank_Window))
		guiBringToFront(GroupBank_Window)
		FillTheComboWithItems()
		triggerServerEvent("getGroupBalance", localPlayer)
		setElementData ( localPlayer, "MTAWindowActive", true)
    -- elseif source == KlanMarket then
        -- guiSetVisible(KlanMarketGui, not guiGetVisible(KlanMarketGui))
    -- elseif source == KlanEnvanter then
        -- guiSetVisible(KlanEnvanterGui, not guiGetVisible(KlanEnvanterGui))
    -- elseif source == EnvanterKaldir then
        -- triggerServerEvent("klan:arac.kaldir", localPlayer)
	elseif source == GroupBank_Deposit_Button then
		local money = tonumber(guiGetText(GroupBank_Deposit_Edit)) or 0
		if money > 0 then
			if money >= 1000 then
				triggerServerEvent("DepositMoneyInGroupBank", localPlayer, money)
				guiSetText(GroupBank_Deposit_Edit, "0")
			else
				outputChatBox("#04B4AE[Klan Bankası] #FFFF00Klan bankasına minimum 1000 ALTIN yatıra bilirsiniz.", 255, 0, 0,true)
			end
		end
	elseif source == GroupBank_Withdraw_Button then
		local money = tonumber(guiGetText(GroupBank_Withdraw_Edit)) or 0
		if money > 0 then
			triggerServerEvent("WithdrawMoneyInGroupBank", localPlayer, money)
			guiSetText(GroupBank_Withdraw_Edit, "0")
		end
	elseif source == GroupBank_GiveAll_Button then
		local money = tonumber(guiGetText(GroupBank_GiveAll_Edit)) or 0
		if money >= 1000 then
			triggerServerEvent("GiveAllPlayerMoneyInGroupBank", localPlayer, money)
			guiSetText(GroupBank_GiveAll_Edit, "0")
		end
	elseif source == GroupBank_GiveMember_Button then
		local moneys = tonumber(guiGetText(GroupBank_GiveMember_Edit)) or 0
		local selectedcombo = guiComboBoxGetItemText(GroupBank_GiveMember_Combmo,guiComboBoxGetSelected(GroupBank_GiveMember_Combmo) )
		triggerServerEvent("guiGiveMemberMoney", localPlayer, selectedcombo, moneys)
	elseif source == Group_BlackList_Button then
		guiSetVisible(Group_BlackList_Window, not guiGetVisible(Group_BlackList_Window))
		guiBringToFront(Group_BlackList_Window)
		guiGridListClear(Group_BlackList_AccountsList)
		guiGridListClear(Group_BlackList_SerialsList)
		triggerServerEvent("Request_Group_BlackList", localPlayer)
	elseif source == Group_BlackList_AccountAdd then
		guiSetVisible(Group_BlackList_Block_Window, not guiGetVisible(Group_BlackList_Block_Window))
		guiBringToFront(Group_BlackList_Block_Window)
	elseif source == Group_BlackList_AccountRemove then
		local Account = guiGridListGetItemText(Group_BlackList_AccountsList, guiGridListGetSelectedItem(Group_BlackList_AccountsList), 2)
		guiGridListClear(Group_BlackList_AccountsList)
		if Account == "" then exports["guimessages"]:outputClient("#04B4AE(Group System) #FF0000 Please Select A Something.", 255, 0, 0) return end
		triggerServerEvent("Group_Unblock_Account", localPlayer, Account)
	elseif source == Group_BlackList_SerialRemove then
		local Account = guiGridListGetItemText(Group_BlackList_SerialsList, guiGridListGetSelectedItem(Group_BlackList_SerialsList), 2)
		guiGridListClear(Group_BlackList_SerialsList)
		if Account == "" then exports["guimessages"]:outputClient("#04B4AE(Group System) #FF0000 Please Select A Something.", 255, 0, 0) return end
		triggerServerEvent("Group_UnBlock_Serial", localPlayer, Account)
	elseif source == Group_BlackBlockserial_Close then
		guiSetVisible(Group_BlackList_Block_Windowserial, false)
	elseif source == Group_BlackBlock_Close then
		guiSetVisible(Group_BlackList_Block_Window, false)
	elseif source == Group_BlackList_Close then
		guiSetVisible(Group_BlackList_Window, false)
	elseif source == Group_BlackBlock_Button then
		guiGridListClear(Group_BlackList_AccountsList)
		guiSetVisible(Group_BlackList_Block_Window, false)
		local Account = guiGetText(Group_BlackAccount_Edit)
		local Reason = guiGetText(Group_BlackReason_Edit)
		if Account ~= "" and Reason ~= "" then
			triggerServerEvent("Group_Block_Account", localPlayer, Account, Reason)
		end
	elseif source == Group_BlackBlockserial_Button then
		guiGridListClear(Group_BlackList_SerialsList)
		local Serial = guiGetText(Group_BlackSerial_Edit)
		local Reason = guiGetText(Group_BlackReasonserial_Edit)
		if Serial ~= "" then
			triggerServerEvent("Group_Block_Serial", localPlayer, Serial, Reason)
		end
		guiSetVisible(Group_BlackList_Block_Windowserial, false)
	elseif source == Group_BlackList_SerialAdd then
		guiSetVisible(Group_BlackList_Block_Windowserial, true)
		guiBringToFront(Group_BlackList_Block_Windowserial)
	elseif source == GroupHistory_Button_DeleteLog then
		local row, col = guiGridListGetSelectedItem(Group_History_Log)
		if (row and col and row ~= -1 and col ~= -1) then
		local theLogID = guiGridListGetItemText ( Group_History_Log, guiGridListGetSelectedItem ( Group_History_Log ), 2 )
		local theLogTime = guiGridListGetItemText ( Group_History_Log, guiGridListGetSelectedItem ( Group_History_Log ), 1 )
		local r, g, b, a = guiGridListGetItemColor ( Group_History_Log, row, 1 )
		if ( r == 255 ) then
			exports["guimessages"]:outputClient("#04B4AE(Group System) #FF0000 The Event Is Already Deleted.",255,0,0)
		elseif string.find(theLogID,"Created The Group '") then
			exports["guimessages"]:outputClient("#04B4AE(Group System) #FF0000 This Event Can't Be Deleted.",255,0,0)
		else
			triggerServerEvent("History_Remove_Event", localPlayer, theLogID, theLogTime )
		end
	end
	elseif source == GroupBank_Close then
		guiSetVisible(GroupBank_Window, false)
		setElementData ( localPlayer, "MTAWindowActive", false)
	end
end
addEventHandler("onClientGUIClick", resourceRoot, on_MyGroup_MemberClick)

-- addEvent("KlanTags", true)
-- addEventHandler("KlanTags", root, function (durum)
    -- guiCheckBoxSetSelected(KlanTagCheck,durum)
    -- guiSetText(KlanTagCheck, "Klan Tagını Kapat")
-- end)

function FillTheComboWithItems()
guiComboBoxClear ( GroupBank_GiveMember_Combmo )
local Group = getElementData( localPlayer, "Group" )
	for k, v in ipairs(getElementsByType("player")) do
		if getElementData( v, "Group" ) == Group and getPlayerName(v) ~= getPlayerName(localPlayer) then
			guiComboBoxAddItem( GroupBank_GiveMember_Combmo, getPlayerName(v) )
		end
	end
end

GroupBank_Window = guiCreateWindow(x/2-126,y/2-92, 252, 261, "Klan Bankası", false)
guiWindowSetSizable(GroupBank_Window, false)
guiSetVisible(GroupBank_Window, false)
guiSetAlpha(GroupBank_Window,1)

GroupBank_Balance_Lable = guiCreateLabel(10, 23, 204, 17, "Altın:", false, GroupBank_Window)
guiLabelSetColor(GroupBank_Balance_Lable, 0, 255, 0)
GroupBank_Deposit_Edit = guiCreateEdit(9, 50, 124, 22, "0", false, GroupBank_Window)
GroupBank_Withdraw_Edit = guiCreateEdit(9, 82, 124, 22, "0", false, GroupBank_Window)
GroupBank_GiveAll_Edit = guiCreateEdit(9, 113, 124, 22, "0", false, GroupBank_Window)
GroupBank_GiveMember_Edit = guiCreateEdit(9, 140, 62, 22, "0", false, GroupBank_Window)
GroupBank_Deposit_Button = guiCreateButton(139, 50, 101, 22, "Yatır", false, GroupBank_Window)
GroupBank_Withdraw_Button = guiCreateButton(139, 82, 101, 22, "Çek", false, GroupBank_Window)
GroupBank_GiveAll_Button = guiCreateButton(139, 113, 101, 22, "Üyelere ver", false, GroupBank_Window)
GroupBank_GiveMember_Button = guiCreateButton(175, 141, 67, 22,"Üyeye ver", false, GroupBank_Window)
GroupBank_GiveMember_Combmo = guiCreateComboBox ( 71, 140, 103, 73, "Üye seç", false, GroupBank_Window)
GroupBank_Close = guiCreateButton(9, 186, 230, 27, "Kapat", false, GroupBank_Window)
GroupBank_dLable = guiCreateLabel(8, 219, 231, 32, "Para yatırmak gibi işlemler Klan Log kısmından görülebilir..", false, GroupBank_Window)
guiSetFont(GroupBank_dLable, "default-small")
guiLabelSetColor(GroupBank_dLable, 0, 255, 0)
guiLabelSetHorizontalAlign(GroupBank_dLable, "left", true)

addEvent("receiveGroupBankBalance", true)
addEventHandler("receiveGroupBankBalance", root,
function(balance)
	if balance then
		currentBankBalance = balance
		guiSetText(GroupBank_Balance_Lable, "Altın:"..balance)
	end
end)

Group_History_Window = guiCreateWindow(x/2-291, y/2-250, 667, 503, "Klan İşlemleri", false)
guiWindowSetSizable(Group_History_Window, false)
guiSetVisible(Group_History_Window, false)
guiSetAlpha (Group_History_Window,1)

Group_History_Log = guiCreateGridList(9, 22, 648, 397, false, Group_History_Window)

guiGridListAddColumn(Group_History_Log,"Saat/Tarih",0.20)
guiGridListAddColumn(Group_History_Log,"İşlem",0.74)

GroupHistory_Button_Close = guiCreateButton(506, 432, 151, 51, "Kapat", false, Group_History_Window)
GroupHistory_Button_DeleteLog = guiCreateButton(316, 432, 151, 51, "İşlemi sil", false, Group_History_Window)

addEvent( "Set_Group_History", true )
addEventHandler( "Set_Group_History", root,
function ( MyGroupHistory )
	if ( MyGroupHistory ) then
		guiGridListClear(Group_History_Log)
		for key, hst in ipairs(MyGroupHistory) do
			local row = guiGridListAddRow(Group_History_Log)
			guiGridListSetItemText (Group_History_Log, row, 1, hst.thetime, false, false)
			guiGridListSetItemColor (Group_History_Log, row, 1, 0, 255, 0)
			guiGridListSetItemText (Group_History_Log, row, 2, hst.groupaction, false, false)
			guiGridListSetItemColor (Group_History_Log, row, 2, 0, 255, 0)
		end
	end
end
)

Group_BlackList_Window = guiCreateWindow(x/2-350,y/2-200, 668, 396, "Group Black List", false)
guiWindowSetSizable(Group_BlackList_Window, false)
guiSetVisible(Group_BlackList_Window, false)
guiSetAlpha (Group_BlackList_Window,1)

Group_BlackList_TabPanel = guiCreateTabPanel(9, 25, 649, 327, false, Group_BlackList_Window)

Group_BlackList_Accounts = guiCreateTab("Accounts List", Group_BlackList_TabPanel)

Group_BlackList_AccountsList = guiCreateGridList(5, 10, 634, 246, false, Group_BlackList_Accounts)
guiGridListAddColumn(Group_BlackList_AccountsList, "By", 0.2)
guiGridListAddColumn(Group_BlackList_AccountsList, "Account Involved", 0.2)
guiGridListAddColumn(Group_BlackList_AccountsList, "Reason", 0.2)
guiGridListAddColumn(Group_BlackList_AccountsList, "Time", 0.2)
Group_BlackList_AccountRemove = guiCreateButton(5, 262, 209, 32, "Remove Selected", false, Group_BlackList_Accounts)
Group_BlackList_AccountAdd = guiCreateButton(241, 262, 209, 32, "Add Account", false, Group_BlackList_Accounts)

Group_BlackList_Serials = guiCreateTab("Serial List", Group_BlackList_TabPanel)

Group_BlackList_SerialsList = guiCreateGridList(5, 10, 634, 246, false, Group_BlackList_Serials)
guiGridListAddColumn(Group_BlackList_SerialsList, "By", 0.2)
guiGridListAddColumn(Group_BlackList_SerialsList, "Serial Involved", 0.4)
guiGridListAddColumn(Group_BlackList_SerialsList, "Reason", 0.2)
guiGridListAddColumn(Group_BlackList_SerialsList, "Time", 0.2)
Group_BlackList_SerialRemove = guiCreateButton(5, 262, 209, 32, "Remove Selected", false, Group_BlackList_Serials)
Group_BlackList_SerialAdd = guiCreateButton(241, 262, 209, 32, "Add Serial", false, Group_BlackList_Serials)
Group_BlackList_Close = guiCreateButton(510, 356, 148, 30, "Close", false, Group_BlackList_Window)

Group_BlackList_Block_Window = guiCreateWindow(x/2-150,y/2-140, 347, 236, "Black List Block Account", false)
guiWindowSetSizable(Group_BlackList_Block_Window, false)
guiSetVisible(Group_BlackList_Block_Window, false)
guiSetAlpha (Group_BlackList_Block_Window,1)

Group_BlackAccount_Edit = guiCreateEdit(9, 29, 316, 39, "Account", false, Group_BlackList_Block_Window)
Group_BlackReason_Edit = guiCreateEdit(9, 105, 316, 39, "Reason", false, Group_BlackList_Block_Window)
Group_BlackBlock_Button = guiCreateButton(12, 171, 143, 46, "Block", false, Group_BlackList_Block_Window)
Group_BlackBlock_Close = guiCreateButton(182, 171, 143, 46, "Cancel", false, Group_BlackList_Block_Window)

Group_BlackList_Block_Windowserial = guiCreateWindow(x/2-150,y/2-140, 347, 236, "Black List Block Serial", false)
guiWindowSetSizable(Group_BlackList_Block_Windowserial, false)
guiSetVisible(Group_BlackList_Block_Windowserial, false)
guiSetAlpha (Group_BlackList_Block_Windowserial,1)

Group_BlackSerial_Edit = guiCreateEdit(9, 29, 316, 39, "Serial", false, Group_BlackList_Block_Windowserial)
Group_BlackReasonserial_Edit = guiCreateEdit(9, 105, 316, 39, "Reason", false, Group_BlackList_Block_Windowserial)
Group_BlackBlockserial_Button = guiCreateButton(12, 171, 143, 46, "Block", false, Group_BlackList_Block_Windowserial)
Group_BlackBlockserial_Close = guiCreateButton(182, 171, 143, 46, "Cancel", false, Group_BlackList_Block_Windowserial)

addEvent("Set_Group_BlackList", true)
addEventHandler("Set_Group_BlackList",root,
function (accountstable, serialstable)
	if (accountstable) then
		for key, vaule in ipairs(accountstable) do
			local row = guiGridListAddRow(Group_BlackList_AccountsList)
			guiGridListSetItemText(Group_BlackList_AccountsList, row, 1, vaule.byy, false, false)
			guiGridListSetItemText(Group_BlackList_AccountsList, row, 2, vaule.account_name, false, false)
			guiGridListSetItemText(Group_BlackList_AccountsList, row, 3, vaule.Reason, false, false)
			guiGridListSetItemText(Group_BlackList_AccountsList, row, 4, vaule.Time, false, false)
		end
	end
end
)

addEvent("Set_Group_BlackListSerial", true)
addEventHandler("Set_Group_BlackListSerial",root,
function (serialstable)
	if (serialstable) then
		for k, v in ipairs(serialstable) do
			local row = guiGridListAddRow(Group_BlackList_SerialsList)
			guiGridListSetItemText(Group_BlackList_SerialsList, row, 1, v.byy, false, false)
			guiGridListSetItemText(Group_BlackList_SerialsList, row, 2, v.serial, false, false)
			guiGridListSetItemText(Group_BlackList_SerialsList, row, 3, v.Reason, false, false)
			guiGridListSetItemText(Group_BlackList_SerialsList, row, 4, v.Time, false, false)
		end
	end
end
)

addEvent("myGroupList", true)
addEventHandler("myGroupList", root,
function(members, data)
	guiGridListClear(MyGroup_Members_Grid)
	for i, group in pairs(members) do
		local row = guiGridListAddRow(MyGroup_Members_Grid)
		guiGridListSetItemText(MyGroup_Members_Grid , row, 1, string.gsub (group["member_name"], "#%x%x%x%x%x%x", "") or "N/A", false, false)
		guiGridListSetItemText(MyGroup_Members_Grid , row, 2, group["member_account"], false, false)
		guiGridListSetItemText(MyGroup_Members_Grid , row, 3, group["member_rank"], false, false)
		guiGridListSetItemText(MyGroup_Members_Grid , row, 5, group["WL"].."%", false, false)
		if group["last_online"] == data then
			guiGridListSetItemText(MyGroup_Members_Grid , row, 4, "Bugün", false, false)
		else
			guiGridListSetItemText(MyGroup_Members_Grid , row, 4, group["last_online"], false, false)
		end
		if group["member_status"] == "Yes" and data == group["last_online"] then
			r, g, b = 0,255,0
		else
			r, g, b = 255,0,0
		end
		guiGridListSetItemColor(MyGroup_Members_Grid, row, 1, r, g, b)
		guiGridListSetItemColor(MyGroup_Members_Grid, row, 2, r, g, b)
		guiGridListSetItemColor(MyGroup_Members_Grid, row, 3, r, g, b)
		guiGridListSetItemColor(MyGroup_Members_Grid, row, 4, r, g, b)
		guiGridListSetItemColor(MyGroup_Members_Grid, row, 5, r, g, b)
	end
end)

function stopGroupDamage(attacker)
	if attacker and getElementType(attacker) == "player" and attacker ~= source then
		local attackerTeam = getPlayerTeam(attacker)
		local damagedTeam = getPlayerTeam(source)
		local attackerGroup = getElementData(attacker, "Group")
		local damagedGroup = getElementData(source, "Group")
		if attackerTeam and damagedTeam and attackerGroup and damagedGroup and attackerTeam == damagedTeam and attackerGroup == damagedGroup then
			cancelEvent()
		end
	end
end
addEventHandler("onClientPlayerDamage", localPlayer, stopGroupDamage)

--------------Group Manager----------------
Manager_Window = guiCreateWindow(x/2-288,y/2-300,581, 641,"Klan Yönetimi",false)
Manager_Grid = guiCreateGridList(13,56,341,575,false,Manager_Window)
guiWindowSetSizable(Manager_Window,false)
guiSetAlpha (Manager_Window,1)

guiGridListSetSelectionMode(Manager_Grid,1)
guiSetVisible(Manager_Window, false)

guiGridListAddColumn(Manager_Grid,"Klan ismi",0.3)
guiGridListAddColumn(Manager_Grid,"Üye sayısı",0.3)
guiGridListAddColumn(Manager_Grid,"Turf Points", 0.3)
guiGridListAddColumn(Manager_Grid,"Sahibi", 0.3)

ViewMembers_Button = guiCreateButton(389,77,172,31,"Üyeleri görüntüle",false,Manager_Window)
ViewGroupInfo = guiCreateButton(389,132,172,31,"Klan bilgisi",false,Manager_Window)
ViewGroupInviteList_Button = guiCreateButton(389,187,172,31,"Klan davet listesi",false,Manager_Window)
SetMembersLimit_Button = guiCreateButton(389,242,172,31,"Üye limiti",false,Manager_Window)
RenameGroup_Button = guiCreateButton(389,297,172,31,"İsmi değiştir",false,Manager_Window)
DeleteGroup_Button = guiCreateButton(389,352,172,31,"Sil",false,Manager_Window)
ShowHistory_Button = guiCreateButton(389, 405, 172, 31, "İşlemler", false, Manager_Window)
ShowBlackList_Button = guiCreateButton(389, 459, 172, 31, "Show Blacklist", true, Manager_Window)
SetTurfPoints_Button = guiCreateButton(389, 459, 172, 31, "Turf Points", false, Manager_Window)
SetGroupOwner_Button = guiCreateButton(389, 516, 172, 31, "Sahibini değiştir", true, Manager_Window)
Close_Button = guiCreateButton(528, 612, 43, 19,"Kapat",false,Manager_Window)

addEvent("OpenGroupManager", true)
addEventHandler("OpenGroupManager", root,
function(groups, update)
	rr = guiGridListGetSelectedItem(Manager_Grid) or -1
	guiGridListClear(Manager_Grid)
	for i, group in pairs(groups) do
		local row = guiGridListAddRow(Manager_Grid)
		guiGridListSetItemText(Manager_Grid, row, 1, group["group_name"], false, false)
		guiGridListSetItemText(Manager_Grid, row, 2, group["group_members"].."/"..group["members_limit"], false, true)
		guiGridListSetItemText(Manager_Grid, row, 3, group["turf_points"], false, false)
		guiGridListSetItemText(Manager_Grid, row, 4, group["group_owner"], false, false)
	end
	if update then
		guiGridListSetSelectedItem(Manager_Grid, rr, 1)
	end
	if not guiGetVisible(Manager_Window) then
		guiSetVisible(Manager_Window, true)
		showCursor(true)
	else
		if not update then
			guiSetVisible(Manager_Window,false)
			showCursor(false)
			guiSetVisible(Rename_Windows,false)
			guiSetVisible(DeleteGroup_Window,false)
			guiSetVisible(View_Members_Window,false)
			guiSetVisible(ViewGroup_Info_Window,false)
			guiSetVisible(ViewGroup_Invite_Window,false)
		end
	end
end)

Limit_Windows = guiCreateWindow(x/2-86,y/2-60,172,120,"Üye limitini değiştirme paneli",false)
guiSetVisible(Limit_Windows, false)
guiSetAlpha (Limit_Windows,1)
guiWindowSetSizable(Limit_Windows,false)

guiSetProperty(Limit_Windows, "AlwaysOnTop", "true")
Limit_Edit = guiCreateEdit(17,33,138,28,"",false,Limit_Windows)
SetLimit_Button = guiCreateButton(22,79,65,26,"Değiştir",false,Limit_Windows)
CloseLimit_Button = guiCreateButton(96,79,65,26,"İptal",false,Limit_Windows)

addEventHandler("onClientGUIClick",root,
function()
	if source == ViewMembers_Button then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		if selectedItem ~= "" then
			guiSetVisible(View_Members_Window,true)
			guiBringToFront(View_Members_Window)
			guiGridListClear(MyGroup_Members_Grid)
			triggerServerEvent("Request_Group_MembersList",localPlayer,selectedItem)
		end
	elseif source == ViewGroupInfo then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		if selectedItem ~= "" then
			guiSetVisible(ViewGroup_Info_Window,true)
			guiSetInputEnabled(true)
			guiBringToFront(ViewGroup_Info_Window)
			triggerServerEvent("Request_Group_Info",localPlayer,selectedItem)
		end
	elseif source == ViewGroupInviteList_Button then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		if selectedItem ~= "" then
			guiSetVisible(ViewGroup_Invite_Window,true)
			guiBringToFront(ViewGroup_Invite_Window)
			guiGridListClear(ViewGroup_Invite_Grid)
			triggerServerEvent("get_Group_InviteList",localPlayer,selectedItem)
		end
	elseif source == SetMembersLimit_Button then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		if selectedItem ~= "" then
			guiSetVisible(Limit_Windows,true)
			guiBringToFront(Limit_Windows)
			guiSetText(Limit_Edit,"")
		end
	elseif source == RenameGroup_Button then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		if selectedItem ~= "" then
			guiSetVisible(Rename_Windows,true)
			guiBringToFront(Rename_Windows)
			guiSetText(Rename_Edit,"")
		end
	elseif source == DeleteGroup_Button then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		if selectedItem ~= "" then
			guiSetVisible(DeleteGroup_Window,true)
			guiBringToFront(DeleteGroup_Window)
			guiCheckBoxSetSelected(DeleteGroup_Checkbox,false)
		end
	elseif source == Close_Button then
		showCursor(false)
		guiSetVisible(Manager_Window,false)
		guiSetVisible(Rename_Windows,false)
		guiSetVisible(DeleteGroup_Window,false)
		guiSetVisible(View_Members_Window,false)
		guiSetVisible(ViewGroup_Info_Window,false)
		guiSetVisible(ViewGroup_Invite_Window,false)
	end
end)

addEventHandler("onClientGUIClick",root,
function()
	if source == SetLimit_Button then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		local LimitValue = guiGetText(Limit_Edit)
		if LimitValue ~= "" and selectedItem ~= "" then
			triggerServerEvent("setGroupMemberLimit",localPlayer,selectedItem,LimitValue)
			triggerServerEvent("Send_Groups_List",localPlayer)
			guiSetVisible(Limit_Windows,false)
		end
	elseif source == CloseLimit_Button then
		guiSetVisible(Limit_Windows,false)
	elseif source == Rename_Button then
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		local RenameValue = guiGetText(Rename_Edit)
		if RenameValue ~= "" and selectedItem ~= "" then
			triggerServerEvent("setGroupName",localPlayer,selectedItem,RenameValue)
			triggerServerEvent("Send_Groups_List",localPlayer)
			guiSetVisible(Rename_Windows,false)
		end
	elseif source == CloseRename_Button then
		guiSetVisible(Rename_Windows,false)
	end
end)

Rename_Windows = guiCreateWindow(x/2-86,y/2-60,172,120,"Klan isim değiştirme paneli",false)
guiSetVisible(Rename_Windows, false)
guiWindowSetSizable(Rename_Windows,false)
guiSetAlpha (Rename_Windows,1)

guiSetProperty(Rename_Windows, "AlwaysOnTop", "true")
Rename_Edit = guiCreateEdit(17,33,138,28,"",false,Rename_Windows)
Rename_Button = guiCreateButton(22,79,65,26,"Değiştir",false,Rename_Windows)
CloseRename_Button = guiCreateButton(96,79,65,26,"Kapat",false,Rename_Windows)

DeleteGroup_Window = guiCreateWindow(x/2-144,y/2-56,288,112,"Klan Silme Paneli",false)
guiSetVisible(DeleteGroup_Window, false)
guiWindowSetSizable(DeleteGroup_Window,false)
guiSetAlpha (DeleteGroup_Window,1)

guiSetProperty(DeleteGroup_Window, "AlwaysOnTop", "true")
DeleteGroup_Label1 = guiCreateLabel(38,27,202,15,"Klanı Silme işlemi geri alınamaz.",false,DeleteGroup_Window)
DeleteGroup_Checkbox = guiCreateCheckBox(61,74,15,18,"",false,false,DeleteGroup_Window)
CloseDeleteGroup_Button = guiCreateButton(209,75,67,28,"Kapat",false,DeleteGroup_Window)
DeleteGroup_Buttons = guiCreateButton(106,75,95,28,"Klanı sil",false,DeleteGroup_Window)
DeleteGroup_Label2 = guiCreateLabel(8,74,46,20,"Onayla",false,DeleteGroup_Window)
DeleteGroup_Label3 = guiCreateLabel(8,87,51,15,"to delete",true,DeleteGroup_Window)

function on_GroupDelete_Click()
	if source == DeleteGroup_Buttons then
		if guiCheckBoxGetSelected(DeleteGroup_Checkbox) then
			local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
			if selectedItem ~= "" then
				triggerServerEvent("Delete_Group",localPlayer,selectedItem)
				guiSetVisible(DeleteGroup_Window, false)
			end
		end
	elseif source == CloseDeleteGroup_Button then
		guiSetVisible(DeleteGroup_Window, false)
	end
end
addEventHandler("onClientGUIClick",root,on_GroupDelete_Click)

View_Members_Window = guiCreateWindow(x/2-291,y/2-212,582,420,"Üye listesi",false)
guiSetAlpha(View_Members_Window,1)
guiSetVisible(View_Members_Window, false)
guiWindowSetSizable(View_Members_Window,false)
guiSetProperty(View_Members_Window, "AlwaysOnTop", "true")
View_Members_Grid = guiCreateGridList(20,29,543,337,false,View_Members_Window)
guiGridListSetSelectionMode(View_Members_Grid,1)
guiGridListAddColumn(View_Members_Grid,"İsmi",0.3)
guiGridListAddColumn(View_Members_Grid,"Hesap",0.23)
guiGridListAddColumn(View_Members_Grid,"Rütbe",0.15)
guiGridListAddColumn(View_Members_Grid,"Son Çevrimiçi",0.15)
guiGridListAddColumn(View_Members_Grid,"Uyarı Seviyesi",0.1)
View_Members_Close = guiCreateButton(460, 376, 113, 30,"Kapat",false,View_Members_Window)
-----------
function on_ViewGroupMember_Click()
	guiSetVisible(View_Members_Window, false)
end
addEventHandler("onClientGUIClick",View_Members_Close,on_ViewGroupMember_Click,false)

addEvent("ViewGroupMember", true)
addEventHandler("ViewGroupMember", root,
function(members, data)
	guiGridListClear(View_Members_Grid)
	for i, group in pairs(members) do
		local row = guiGridListAddRow(View_Members_Grid)
		guiGridListSetItemText(View_Members_Grid , row, 1, string.gsub (group["member_name"], "#%x%x%x%x%x%x", "") or "N/A", false, false)
		guiGridListSetItemText(View_Members_Grid , row, 2, group["member_account"], false, false)
		guiGridListSetItemText(View_Members_Grid , row, 3, group["member_rank"], false, false)
		guiGridListSetItemText(View_Members_Grid , row, 5, group["WL"].."%", false, false)
		if group["last_online"] == data then
			guiGridListSetItemText(View_Members_Grid , row, 4, "Today", false, false)
		else
			guiGridListSetItemText(View_Members_Grid , row, 4, group["last_online"], false, false)
		end
		if group["member_status"] == "Yes" and data == group["last_online"] then
			r, g, b = 0,255,0
		else
			r, g, b = 255,0,0
		end
		guiGridListSetItemColor(View_Members_Grid, row, 1, r, g, b)
		guiGridListSetItemColor(View_Members_Grid, row, 2, r, g, b)
		guiGridListSetItemColor(View_Members_Grid, row, 3, r, g, b)
		guiGridListSetItemColor(View_Members_Grid, row, 4, r, g, b)
		guiGridListSetItemColor(View_Members_Grid, row, 5, r, g, b)
	end
end)

ViewGroup_Info_Window = guiCreateWindow(x/2-252,y/2-203,505,406,"Bilgilendirme/Kurallar",false)

ViewGroup_Info_ButtonSave = guiCreateButton(315,368,95,29,"Kaydet",false,ViewGroup_Info_Window)
guiSetAlpha(ViewGroup_Info_Window,1)
guiSetVisible(ViewGroup_Info_Window, false)
guiSetProperty(ViewGroup_Info_Window, "AlwaysOnTop", "true")
guiWindowSetSizable(ViewGroup_Info_Window,false)
ViewGroup_Info_Memo = guiCreateMemo(9,28,485,333,"",false,ViewGroup_Info_Window)
Max_Info_LabelM = guiCreateLabel(10,377,250,30,"(8001) Kalan karakter sayısı",false,ViewGroup_Info_Window)
ViewGroup_Info_ButtonClose = guiCreateButton(415,368,81,29,"Kapat",false,ViewGroup_Info_Window)

function on_ViewGroup_Info_Click()
	if source == ViewGroup_Info_ButtonSave then
		local infoTextt = tostring(guiGetText(ViewGroup_Info_Memo))
		local selectedItem = guiGridListGetItemText(Manager_Grid,guiGridListGetSelectedItem(Manager_Grid),1)
		if selectedItem ~= "" and infoTextt ~= "" then
			triggerServerEvent("Change_Group_Info",localPlayer,selectedItem,infoTextt)
		end
	elseif source == ViewGroup_Info_ButtonClose then
		guiSetVisible(ViewGroup_Info_Window, false)
	end
end
addEventHandler("onClientGUIClick",root,on_ViewGroup_Info_Click)

addEvent("Send_Group_Info", true)
addEventHandler("Send_Group_Info", root,
function(info)
	guiSetText(ViewGroup_Info_Memo,info)
end)

ViewGroup_Invite_Window = guiCreateWindow(x/2-259,y/2-124,518,248,"Davet Listesi",false)
guiSetAlpha(ViewGroup_Invite_Window,1)
guiSetVisible(ViewGroup_Invite_Window, false)
guiWindowSetSizable(ViewGroup_Invite_Window,false)
guiSetProperty(ViewGroup_Invite_Window, "AlwaysOnTop", "true")
ViewGroup_Invite_Grid = guiCreateGridList(12,32,491,156,false,ViewGroup_Invite_Window)
guiGridListSetSelectionMode(ViewGroup_Invite_Grid,1)
guiGridListAddColumn(ViewGroup_Invite_Grid,"Klan ismi",0.38)
guiGridListAddColumn(ViewGroup_Invite_Grid,"to",0.27)
guiGridListAddColumn(ViewGroup_Invite_Grid,"from",0.27)
Delete_Group_Invite_Button = guiCreateButton(23,198,200,32,"Seçilen Davetiyeyi Sil",false,ViewGroup_Invite_Window)
Close_ViewGroup_Invite_Button = guiCreateButton(390,198,105,32,"Kapat",false,ViewGroup_Invite_Window)

function on_ViewGroup_Invite_Click()
	if source == Delete_Group_Invite_Button then
		local GroupName = guiGridListGetItemText(ViewGroup_Invite_Grid ,guiGridListGetSelectedItem(ViewGroup_Invite_Grid ),1)
		To = guiGridListGetItemText(ViewGroup_Invite_Grid ,guiGridListGetSelectedItem(ViewGroup_Invite_Grid ),2)
		From = guiGridListGetItemText(ViewGroup_Invite_Grid ,guiGridListGetSelectedItem(ViewGroup_Invite_Grid ),3)
		if GroupName ~= "" and To ~= "" and From ~= "" then
			triggerServerEvent("Delete_Invite",localPlayer,GroupName,To,From)
		end
	elseif source == Close_ViewGroup_Invite_Button then
		guiSetVisible(ViewGroup_Invite_Window, false)
	end
end
addEventHandler("onClientGUIClick",root,on_ViewGroup_Invite_Click)

addEvent("Send_Group_InviteList", true)
addEventHandler("Send_Group_InviteList", root,
function(Invite)
guiGridListClear(ViewGroup_Invite_Grid)
	for i, Inv in pairs(Invite) do
		local row = guiGridListAddRow(ViewGroup_Invite_Grid)
		guiGridListSetItemText(ViewGroup_Invite_Grid, row, 1, Inv["group_name"], false, false)
		guiGridListSetItemText(ViewGroup_Invite_Grid, row, 2, Inv["player_account"], false, false)
		guiGridListSetItemText(ViewGroup_Invite_Grid, row, 3, Inv["byy"], false, false)
	end
end)

Group_M_History_Window = guiCreateWindow(x/2-291, y/2-250, 667, 503, "Klan İşlemleri", false)
guiWindowSetSizable(Group_M_History_Window, false)
guiSetVisible(Group_M_History_Window, false)
guiSetAlpha (Group_M_History_Window,1)

Group_M_History_Log = guiCreateGridList(9, 22, 648, 397, false, Group_M_History_Window)

guiGridListAddColumn(Group_M_History_Log,"Saat/Tarih",0.20)
guiGridListAddColumn(Group_M_History_Log,"İşlem",0.74)

GroupHistory_M_Button_Close = guiCreateButton(506, 432, 151, 51, "Kapat", false, Group_M_History_Window)

addEventHandler("onClientGUIClick",root,
function ()
	if source == ShowHistory_Button then
		local GroupName = guiGridListGetItemText(Manager_Grid, guiGridListGetSelectedItem(Manager_Grid), 1)
		if GroupName ~= "" then
			guiSetVisible(Group_M_History_Window, not guiGetVisible(Group_M_History_Window))
			guiBringToFront(Group_M_History_Window)
			guiGridListClear(Group_M_History_Log)
			triggerServerEvent("Show_Manager_History", localPlayer, GroupName)
		end
	elseif source == GroupHistory_M_Button_Close then
		guiSetVisible(Group_M_History_Window, false)
	end
end
)

addEvent("SetManagerGroupHistory", true)
addEventHandler("SetManagerGroupHistory", root,
function (MyGroupHistory)
	guiGridListClear(Group_M_History_Log)
	for k, v in ipairs(MyGroupHistory) do
		local row = guiGridListAddRow(Group_M_History_Log)
		guiGridListSetItemText(Group_M_History_Log, row, 1, v.thetime, false, false)
		guiGridListSetItemColor(Group_M_History_Log, row, 1, 0, 255, 0)
		guiGridListSetItemText(Group_M_History_Log, row, 2, v.groupaction, false, false)
		guiGridListSetItemColor(Group_M_History_Log, row, 2, 0, 255, 0)
	end
end
)

Points_Window = guiCreateWindow(x/2-86,y/2-60,172,120,"Set Group Turf Points",false)
guiSetVisible(Points_Window, false)
guiWindowSetSizable(Points_Window,false)
guiSetAlpha (Points_Window,1)

guiSetProperty(Points_Window, "AlwaysOnTop", "true")
Points_Edit = guiCreateEdit(17,33,138,28,"",false,Points_Window)
Points_Button = guiCreateButton(22,79,65,26,"Set",false,Points_Window)
ClosePoints_Button = guiCreateButton(96,79,65,26,"Close",false,Points_Window)

addEventHandler("onClientGUIClick", root,
function ()
	local GroupName = guiGridListGetItemText(Manager_Grid, guiGridListGetSelectedItem(Manager_Grid), 1)
	if source == SetTurfPoints_Button then
		if GroupName ~= "" then
			guiSetVisible(Points_Window, not guiGetVisible(Points_Window))
			guiBringToFront(Points_Window)
		end
	elseif source == ClosePoints_Button then
		guiSetVisible(Points_Window, false)
	elseif source == Points_Button then
		local points = guiGetText(Points_Edit)
		if points ~= "" then
			triggerServerEvent("set_Group_M_Turf_Points",localPlayer, GroupName, points)
			guiSetVisible(Points_Window, false)
			guiSetText(Points_Edit, "")
		end
	end
end
)



Group_BlackList_M_Window = guiCreateWindow(x/2-350,y/2-200, 668, 396, "Group Black List", false)
guiWindowSetSizable(Group_BlackList_M_Window, false)
guiSetVisible(Group_BlackList_M_Window, false)
guiSetAlpha (Group_BlackList_M_Window,1)

Group_BlackList_M_TabPanel = guiCreateTabPanel(9, 25, 649, 327, false, Group_BlackList_M_Window)

Group_BlackList_M_Accounts = guiCreateTab("Accounts List", Group_BlackList_M_TabPanel)

Group_BlackList_M_AccountsList = guiCreateGridList(5, 10, 634, 246, false, Group_BlackList_M_Accounts)
guiGridListAddColumn(Group_BlackList_M_AccountsList, "By", 0.2)
guiGridListAddColumn(Group_BlackList_M_AccountsList, "Account Involved", 0.2)
guiGridListAddColumn(Group_BlackList_M_AccountsList, "Reason", 0.2)
guiGridListAddColumn(Group_BlackList_M_AccountsList, "Time", 0.2)
Group_BlackList_M_AccountRemove = guiCreateButton(5, 262, 209, 32, "Remove Selected", false, Group_BlackList_M_Accounts)
Group_BlackList_M_AccountAdd = guiCreateButton(241, 262, 209, 32, "Add Account", false, Group_BlackList_M_Accounts)

Group_BlackList_M_Serials = guiCreateTab("Serial List", Group_BlackList_M_TabPanel)

Group_BlackList_M_SerialsList = guiCreateGridList(5, 10, 634, 246, false, Group_BlackList_M_Serials)
guiGridListAddColumn(Group_BlackList_M_SerialsList, "By", 0.2)
guiGridListAddColumn(Group_BlackList_M_SerialsList, "Serial Involved", 0.4)
guiGridListAddColumn(Group_BlackList_M_SerialsList, "Reason", 0.2)
guiGridListAddColumn(Group_BlackList_M_SerialsList, "Time", 0.2)
Group_BlackList_M_SerialRemove = guiCreateButton(5, 262, 209, 32, "Remove Selected", false, Group_BlackList_M_Serials)
Group_BlackList_M_SerialAdd = guiCreateButton(241, 262, 209, 32, "Add Serial", false, Group_BlackList_M_Serials)
Group_BlackList_M_Close = guiCreateButton(510, 356, 148, 30, "Close", false, Group_BlackList_M_Window)

Group_BlackList_Block_M_Window = guiCreateWindow(x/2-150,y/2-140, 347, 236, "Black List Block Account", false)
guiWindowSetSizable(Group_BlackList_Block_M_Window, false)
guiSetVisible(Group_BlackList_Block_M_Window, false)
guiSetAlpha (Group_BlackList_Block_M_Window,1)

Group_BlackAccount_M_Edit = guiCreateEdit(9, 29, 316, 39, "Account", false, Group_BlackList_Block_M_Window)
Group_BlackReason_M_Edit = guiCreateEdit(9, 105, 316, 39, "Reason", false, Group_BlackList_Block_M_Window)
Group_BlackBlock_M_Button = guiCreateButton(12, 171, 143, 46, "Block", false, Group_BlackList_Block_M_Window)
Group_BlackBlock_M_Close = guiCreateButton(182, 171, 143, 46, "Cancel", false, Group_BlackList_Block_M_Window)

Group_BlackList_Block_M_Windowserial = guiCreateWindow(x/2-150,y/2-140, 347, 236, " Black List Block Serial", false)
guiWindowSetSizable(Group_BlackList_Block_M_Windowserial, false)
guiSetVisible(Group_BlackList_Block_M_Windowserial, false)
guiSetAlpha (Group_BlackList_Block_M_Windowserial,1)

Group_BlackSerial_M_Edit = guiCreateEdit(9, 29, 316, 39, "Serial", false, Group_BlackList_Block_M_Windowserial)
Group_BlackReasonserial_M_Edit = guiCreateEdit(9, 105, 316, 39, "Reason", false, Group_BlackList_Block_M_Windowserial)
Group_BlackBlockserial_M_Button = guiCreateButton(12, 171, 143, 46, "Block", false, Group_BlackList_Block_M_Windowserial)
Group_BlackBlockserial_M_Close = guiCreateButton(182, 171, 143, 46, "Cancel", false, Group_BlackList_Block_M_Windowserial)

addEventHandler("onClientGUIClick", root,
function ()
	local GroupName = guiGridListGetItemText(Manager_Grid, guiGridListGetSelectedItem(Manager_Grid), 1)
	if source == ShowBlackList_Button then
		if GroupName ~= "" then
			guiSetVisible(Group_BlackList_M_Window, not guiGetVisible(Group_BlackList_M_Window))
			triggerServerEvent("get_Group_Manager_Blacklist", localPlayer, GroupName)
		end
	elseif source == Group_BlackList_M_Close then
		guiSetVisible(Group_BlackList_M_Window, false)
	elseif source == Group_BlackList_M_AccountRemove then
		local member = guiGridListGetItemText(Group_BlackList_M_SerialsList, guiGridListGetSelectedItem(Group_BlackList_M_SerialsList), 2)
		triggerServerEvent("UnBlock_Member_By_Manager", localPlayer, GroupName, member)
	end
end
)

addEvent("set_Group_Manager_Blacklist_Account", true)
addEventHandler("set_Group_Manager_Blacklist_Account", root,
function (Accounts)
	guiGridListClear(Group_BlackList_M_AccountsList)
	for i, account in ipairs(Accounts) do
		local row = guiGridListAddRow(Group_BlackList_M_AccountsList)
		guiGridListSetItemText(Group_BlackList_M_AccountsList, row, 1, account.byy, false, false)
		guiGridListSetItemText(Group_BlackList_M_AccountsList, row, 2, account.account_name, false, false)
		guiGridListSetItemText(Group_BlackList_M_AccountsList, row, 3, account.Reason, false, false)
		guiGridListSetItemText(Group_BlackList_M_AccountsList, row, 4, account.Time, false, false)
	end
end
)

addEvent("set_Group_Manager_Blacklist_Serial", true)
addEventHandler("set_Group_Manager_Blacklist_Serial", root,
function (Serials)
	guiGridListClear(Group_BlackList_M_SerialsList)
	for i, serials in ipairs(Serials) do
		local row = guiGridListAddRow(Group_BlackList_M_SerialsList)
		guiGridListSetItemText(Group_BlackList_M_SerialsList, row, 1, serials.byy, false, false)
		guiGridListSetItemText(Group_BlackList_M_SerialsList, row, 2, serials.serial, false, false)
		guiGridListSetItemText(Group_BlackList_M_SerialsList, row, 3, serials.Reason, false, false)
		guiGridListSetItemText(Group_BlackList_M_SerialsList, row, 4, serials.Time, false, false)
	end
end
)

addEventHandler("onClientMouseEnter", root, function ()
    if source == KlanTagDegistir then
        guiSetText(KlanTagDegistir,"100.000$")
    elseif source == Create_Group_Button then
        guiSetText(Create_Group_Button,"100.000$")
    end
end)

addEventHandler("onClientMouseLeave", root, function ()
    if source == KlanTagDegistir then
        guiSetText(KlanTagDegistir,"Değiştir")
    elseif source == Create_Group_Button then
        guiSetText(Create_Group_Button,"Oluştur")
    end
end)