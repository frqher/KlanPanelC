genelGuiTablo = {}

--guiCreateWindow
wtablo = {}
--guiCreateButton
btablo = {}
--guiCreateGridList
Ltablo = {}
--guiCreateMemo
mtablo = {}
--guiCreateEdit
etablo = {}

function resimOlustur(isim)
	if fileExists(isim.."png") then return isim.."png" end
	local texture = dxCreateTexture(1,1) 
	local pixels = dxGetTexturePixels(texture) 
	local r,g,b,a = 255,255,255,255 
	dxSetPixelColor(pixels,0,0,r,g,b,a) 
	dxSetTexturePixels(texture, pixels) 
	local pxl = dxConvertPixels(dxGetTexturePixels(texture),"png") 
	local nImg = fileCreate(isim..".png") 
	fileWrite(nImg,pxl) 
	fileClose(nImg)
	return isim..".png" 
end

function renkVer(resim,hex)
	guiSetProperty(resim,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex)
end

_guiCreateWindow = guiCreateWindow
function guiCreateWindow(x,y,g,u,yazi,relative,parent,renk1,renk2,renk3,renk4)
	wsayi = #wtablo +1
	
	if not renk1 or string.len(renk1) > 6 then
		renk1 =  "1c1c1c" -- window renk üst taraf
	end
	if not renk2 or string.len(renk2) > 6 then
		renk2 = "000000" -- panel adı kısmı
	end
	if not renk3 or string.len(renk3) > 6 then
		renk3 = "1c1c1c" -- window renk alt taraf
	end
	if not renk4 or string.len(renk4) > 6 then
		renk4 = "c901e3"  -- window cerceve renk
	end
	
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
		relative = false
	end
	
	if not wtablo[wsayi] then wtablo[wsayi] = {} end
	--arkaResim
	wtablo[wsayi].resim = guiCreateStaticImage(x,y,g,u,resimOlustur("test"),relative,parent)
	renkVer(wtablo[wsayi].resim,renk1)
	guiSetProperty(wtablo[wsayi].resim,"ImageColours","tl:FF"..renk1.." tr:FF"..renk1.." bl:FF"..renk3.." br:FF"..renk3.."")
	guiSetAlpha(wtablo[wsayi].resim, 0.85)
	--baslıkArka
	wtablo[wsayi].basarka = guiCreateStaticImage(0,0,g,20, resimOlustur("test"), false, wtablo[wsayi].resim)
	renkVer(wtablo[wsayi].basarka,renk2)
	--kenarlar
	wtablo[wsayi].kenarlar = {
		ordaUst = guiCreateStaticImage(0,0,g,1,resimOlustur("test"), false, wtablo[wsayi].resim),
		ortaAlt = guiCreateStaticImage(0,u-1,g,1,resimOlustur("test"), false, wtablo[wsayi].resim),
		sol = guiCreateStaticImage(0,0,1,u,resimOlustur("test"), false, wtablo[wsayi].resim),
		sag = guiCreateStaticImage(g-1,0,1,u,resimOlustur("test"), false, wtablo[wsayi].resim)
	}
	
	for i,v in pairs(wtablo[wsayi].kenarlar) do
		renkVer(v,renk4)
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v, 0.4)
	end	
	--baslıkLabel
	wtablo[wsayi].label = guiCreateLabel((g/2)-((string.len(yazi)*8)/2),0,(string.len(yazi)*8),20, yazi, false, wtablo[wsayi].basarka)
	guiSetFont(wtablo[wsayi].label, "default-bold-small")
	guiLabelSetHorizontalAlign(wtablo[wsayi].label, "center")
	guiLabelSetVerticalAlign(wtablo[wsayi].label, "center")
	-- kapatArka
	wtablo[wsayi].kapatArka = guiCreateStaticImage(g-25,1,25,20,resimOlustur("test"),false,wtablo[wsayi].basarka)
	renkVer(wtablo[wsayi].kapatArka,"E81123")
	guiSetAlpha(wtablo[wsayi].kapatArka, 0.5)
	-- kapatLabel
	wtablo[wsayi].kapat = guiCreateLabel(0,-2,25,20, "X", false, wtablo[wsayi].kapatArka)
	guiSetFont(wtablo[wsayi].kapat, "default-bold-small")
	guiLabelSetHorizontalAlign(wtablo[wsayi].kapat, "center")
	guiLabelSetVerticalAlign(wtablo[wsayi].kapat, "center")
	
	return wtablo[wsayi].resim
end

_guiCreateButton = guiCreateButton
function guiCreateButton(x,y,g,u,yazi,relative,parent,renk1,renk2)
	bsayi = #btablo +1
	if not btablo[bsayi] then btablo[bsayi] = {} end
	
	if not renk1 or string.len(renk1) > 6 then
		--renk = math.random(999999)
		renk1 = "1c1c1c"
	end
	if not renk2 or string.len(renk2) > 6 then
		renk2 = "c901e3"
	end
	--arkaResim
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
		relative = false
	end
	btablo[bsayi].resim = guiCreateStaticImage(x,y,g,u,resimOlustur("test"),relative,parent)
	renkVer(btablo[bsayi].resim,renk1)
	--kenarlar
	btablo[bsayi].kenarlar = {
		ortaUst = guiCreateStaticImage(0,0,g,1,resimOlustur("test"), relative, btablo[bsayi].resim),
		ortaAlt = guiCreateStaticImage(0,u-1,g,1,resimOlustur("test"), relative, btablo[bsayi].resim),
		sol = guiCreateStaticImage(0,0,1,u,resimOlustur("test"), relative, btablo[bsayi].resim),
		sag = guiCreateStaticImage(g-1,0,1,u,resimOlustur("test"), relative, btablo[bsayi].resim)
	}
	
	for i,v in pairs(btablo[bsayi].kenarlar) do
		renkVer(v,renk2)
		guiSetAlpha(v, 0.4)
	end	
	--label
	btablo[bsayi].label = guiCreateLabel(0,0,g,u,yazi,relative,btablo[bsayi].resim)
	guiLabelSetHorizontalAlign(btablo[bsayi].label, "center")
	guiLabelSetVerticalAlign(btablo[bsayi].label, "center")
	guiSetFont(btablo[bsayi].label, "default-bold-small")
	
	genelGuiTablo[btablo[bsayi].label] = btablo[bsayi].kenarlar
	return btablo[bsayi].label 
end

_guiCreateGridList = guiCreateGridList
function guiCreateGridList(x,y,g,u,relative,parent,kenarrenk)
	Ssayi = #Ltablo +1
	
	if not kenarrenk or string.len(kenarrenk) > 6 then
		kenarrenk =  "000000"
	end
	
	if not Ltablo[Ssayi] then Ltablo[Ssayi] = {} end
	
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
	end
	local relative = false
	
	Ltablo[Ssayi].resim = guiCreateStaticImage(x,y,g,u, resimOlustur("test"), relative, parent)
	renkVer(Ltablo[Ssayi].resim,kenarrenk)
	Ltablo[Ssayi].liste = _guiCreateGridList(-8,-10,g+20, u+18,false, Ltablo[Ssayi].resim)
	
	Ltablo[Ssayi].kenarlar = {
	ortaUst = guiCreateStaticImage(0,0,g,1,resimOlustur("test"), false, Ltablo[Ssayi].resim),
	ortaAlt = guiCreateStaticImage(0,u-1,g,1,resimOlustur("test"), false, Ltablo[Ssayi].resim),
	sol = guiCreateStaticImage(0,0,1,u,resimOlustur("test"), false, Ltablo[Ssayi].resim),
	sag = guiCreateStaticImage(g-1,0,1,u,resimOlustur("test"), false, Ltablo[Ssayi].resim)}
	genelGuiTablo[Ltablo[Ssayi].liste] = Ltablo[Ssayi].kenarlar
	
	for i,v in pairs(Ltablo[Ssayi].kenarlar) do
		renkVer(v,kenarrenk)
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v, 0.4)
	end	
	return Ltablo[Ssayi].liste
end

_guiCreateEdit = guiCreateEdit
function guiCreateEdit(x,y,g,u,yazi,relative,parent,kenarrenk)
	esayi = #etablo +1
	
	if not kenarrenk or string.len(kenarrenk) > 6 then
		kenarrenk =  "1883D7"
	end
	
	if not etablo[esayi] then etablo[esayi] = {} end
	
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
	end
	local relative = false

	etablo[esayi].resim = guiCreateStaticImage(x,y,g,u, resimOlustur("test"), relative, parent)
	--guiSetAlpha(etablo[esayi].resim, 0)
	renkVer(etablo[esayi].resim,kenarrenk)
	etablo[esayi].edit = _guiCreateEdit(-7,-5,g+15, u+8,yazi,false, etablo[esayi].resim)
	etablo[esayi].kenarlar = {
	ortaUst = guiCreateStaticImage(0,0,g,1,resimOlustur("test"), false, etablo[esayi].resim),
	ortaAlt = guiCreateStaticImage(0,u-1,g,1,resimOlustur("test"), false, etablo[esayi].resim),
	sol = guiCreateStaticImage(0,0,1,u,resimOlustur("test"), false, etablo[esayi].resim),
	sag = guiCreateStaticImage(g-1,0,1,u,resimOlustur("test"), false, etablo[esayi].resim)}
	genelGuiTablo[etablo[esayi].edit] = etablo[esayi].kenarlar
	for i,v in pairs(etablo[esayi].kenarlar) do
		renkVer(v,kenarrenk)
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v, 0.4)
	end	
	return etablo[esayi].edit
end

_guiCreateMemo = guiCreateMemo
function guiCreateMemo(x,y,g,u,yazi,relative,parent,kenarrenk)
	msayi = #mtablo +1
	if not kenarrenk or string.len(kenarrenk) > 6 then
		kenarrenk =  "1883D7"
	end
	
	if not mtablo[msayi] then mtablo[msayi] = {} end
	
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
	end
	local relative = false
	
	mtablo[msayi].resim = guiCreateStaticImage(x,y,g,u, resimOlustur("test"), relative, parent)
	renkVer(mtablo[msayi].resim,kenarrenk)
	mtablo[msayi].memo = _guiCreateMemo(-5,-10,g+15, u+10, yazi,false, mtablo[msayi].resim)
	
	mtablo[msayi].kenarlar = {
	ortaUst = guiCreateStaticImage(0,0,g,1,resimOlustur("test"), false, mtablo[msayi].resim),
	ortaAlt = guiCreateStaticImage(0,u-1,g,1,resimOlustur("test"), false, mtablo[msayi].resim),
	sol = guiCreateStaticImage(0,0,1,u,resimOlustur("test"), false, mtablo[msayi].resim),
	sag = guiCreateStaticImage(g-1,0,1,u,resimOlustur("test"), false, mtablo[msayi].resim)}
	genelGuiTablo[mtablo[msayi].memo] = mtablo[msayi].kenarlar
	for i,v in pairs(mtablo[msayi].kenarlar) do
		renkVer(v,kenarrenk)
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v, 0.4)
	end	
	
	return mtablo[msayi].memo
end

--edit,gridlst,buton,memo mouse
addEventHandler("onClientMouseEnter", resourceRoot, function()
	for i,v in pairs(genelGuiTablo) do
		if source == i then
			for i,v in pairs(v) do
				guiSetAlpha(v, 1)
			end	
		end
	end
end)

addEventHandler("onClientMouseLeave", resourceRoot, function()
	for i,v in pairs(genelGuiTablo) do
		if source == i then
			for i,v in pairs(v) do
				guiSetAlpha(v, 0.4)
			end	
		end
	end
end)

--pencere mouse
addEventHandler("onClientMouseEnter", resourceRoot, function()
	for i,v in pairs(wtablo) do
		if source == v.kapat then
			guiSetAlpha(v.kapatArka, 1)
			break
		end
	end
end)

addEventHandler("onClientMouseLeave", resourceRoot, function()
	for i,v in pairs(wtablo) do
		if source == v.kapat then
			guiSetAlpha(v.kapatArka, 0.5)
			break
		end
	end
end)

addEventHandler("onClientGUIClick", resourceRoot, function()
	for i,v in pairs(wtablo) do
		if source == v.kapat then
			guiSetInputEnabled(false)
			guiSetVisible(v.resim, false)
			-- showCursor(false)
		end
	end	
end)

function butonmu(label)
	for i,v in pairs(btablo) do
		if v.label == label then
			return i
		end	
	end
	return false	
end

function penceremi(resim)
	for i,v in pairs(wtablo) do
		if v.resim == resim then
			return i
		end	
	end
	return false	
end

function basliklabelmi(label)
	for i,v in pairs(wtablo) do
		if v.label == label then
			return i
		end	
	end
	return false	
end

function baslikmi(element)
	for i,v in pairs(wtablo) do
		if v.basarka == element or wtablo[basliklabelmi(element)] and  v.label == element then
			return i
		end	
	end
	return false	
end

--basinca olan ufalma
basili = {}
addEventHandler("onClientGUIMouseDown", resourceRoot, function()
	if butonmu(source) then
		if basili[source] then return end
		basili[source] = true
		local g,u = guiGetSize(source, false)
		local x,y = guiGetPosition(source, false)
		guiSetPosition(source, x+2,y+2, false)
		guiSetSize(source, g-4,u-4, false)
	end
end)

addEventHandler("onClientGUIMouseUp", resourceRoot, function()
	if butonmu(source) then
		if not basili[source] then  
			for i,v in pairs(basili) do
				if v == true then
					source = i
					break
				end
			end	
		end
		if not basili[source] then return end
		basili[source] = nil
		local g,u = guiGetSize(source, false)
		local x,y = guiGetPosition(source, false)
		guiSetPosition(source, x-2,y-2, false)
		guiSetSize(source, g+4,u+4, false)
	else
		for i,v in pairs(basili) do
			if v == true then
				source = i
				break
			end
		end	
		if butonmu(source) then
			basili[source] = nil
			local g,u = guiGetSize(source, false)
			local x,y = guiGetPosition(source, false)
			guiSetPosition(source, x-2,y-2, false)
			guiSetSize(source, g+4,u+4, false)
		end	
	end
end)

function basiliBirak()
	for i,v in pairs(basili) do
			if v == true then
				source = i
				break
			end
		end	
	if butonmu(source) then
		basili[source] = nil
		local g,u = guiGetSize(source, false)
		local x,y = guiGetPosition(source, false)
		guiSetPosition(source, x-2,y-2, false)
		guiSetSize(source, g+4,u+4, false)
	end	
end

addEventHandler("onClientClick", root, function(button, durum, _, _, _, _, _, tiklanan)
	if durum == "up" then
		if tiklanan then 
			local element = getElementType(tiklanan)
			if not string.find(element, "gui-") then
				basiliBirak()
			end	
		else
			basiliBirak()
		end
	end	
end)

--panel taşıma
addEventHandler( "onClientGUIMouseDown", resourceRoot,function ( btn, x, y )
	if btn == "left" and baslikmi(source) then
		local source = wtablo[baslikmi(source)].resim
		clickedElement = source
		local elementPos = { guiGetPosition( source, false ) }
		offsetPos = { x - elementPos[ 1 ], y - elementPos[ 2 ] };
	end
end)

addEventHandler( "onClientGUIMouseUp", resourceRoot,function ( btn, x, y )
	if btn == "left" and baslikmi(source) then
		clickedElement = nil
	end
end)

addEventHandler( "onClientCursorMove", getRootElement( ),function ( _, _, x, y )
	if clickedElement then
		guiSetPosition( clickedElement, x - offsetPos[ 1 ], y - offsetPos[ 2 ], false )
	end
end)


--diğer funclar
_guiGetPosition = guiGetPosition
function guiGetPosition(element,relative)
	if butonmu(element) then
		local sira = butonmu(element)
		local x,y = _guiGetPosition(btablo[sira].resim, relative)
		return x,y 
	else
		local x,y = _guiGetPosition(element, relative)
		return x,y
	end
end

_guiSetPosition = guiSetPosition
function guiSetPosition(element,x,y,relative)
	if butonmu(element) then
		local sira = butonmu(element)
		_guiSetPosition(btablo[sira].resim, x,y, relative)
	else
		_guiSetPosition(element,x,y,relative)
	end
end

_guiGetSize = guiGetSize
function guiGetSize(element,relative)
	if butonmu(element) then
		local sira = butonmu(element)
		local g,u = _guiGetSize(btablo[sira].resim, relative)
		return g,u 
	else
		local g,u = _guiGetSize(element, relative)
		return g,u
	end
end

_guiSetSize = guiSetSize
function guiSetSize(element,g,u,relative)
	if butonmu(element) then
		local sira = butonmu(element)
		_guiSetSize(btablo[sira].resim, g,u, false)
		_guiSetSize(btablo[sira].label, g,u, false)
		--sağ kenar çizgi
		_guiSetPosition(btablo[sira].kenarlar.sag, g-1, 0, false)
		_guiSetSize(btablo[sira].kenarlar.sag, 1,u, false)
		--alt kenar çizgi
		_guiSetPosition(btablo[sira].kenarlar.ortaAlt, 0, u-1, false)
		_guiSetSize(btablo[sira].kenarlar.ortaAlt, g,1, false)
	elseif penceremi(source) then
		local sira = penceremi(source)
		_guiSetSize(wtablo[sira].resim, g,u, false)
		--sağ kenar çizgi
		_guiSetPosition(wtablo[sira].kenarlar.sag, g-1, 0, false)
		_guiSetSize(wtablo[sira].kenarlar.sag, 1,u, false)
		--alt kenar çizgi
		_guiSetPosition(wtablo[sira].kenarlar.ortaAlt, 0, u-1, false)
		_guiSetSize(wtablo[sira].kenarlar.ortaAlt, g,1, false)
		--baslik
		_guiSetSize(wtablo[sira].basarka, g,20, false)
		--kapat
		_guiSetPosition(wtablo[sira].kapatArka, g-25,1, false)
		--label
		local yazi = guiGetText(wtablo[sira].label)
		_guiSetPosition(wtablo[sira].label, (g/2)-((string.len(yazi)*8)/2),0, false)
		_guiSetSize(wtablo[sira].label,(string.len(yazi)*8),20, false)
		guiLabelSetHorizontalAlign(wtablo[sira].label, "center")
		guiLabelSetVerticalAlign(wtablo[sira].label, "center")
	end	
end		

_guiSetText = guiSetText
function guiSetText(element, yazi)
	if penceremi(element) then
		local sira = penceremi(element)
		local g,u = guiGetSize(wtablo[sira].resim,false)
		guiSetPosition(wtablo[sira].label,(g/2)-((string.len(yazi)*8)/2),0, false)
		guiSetSize(wtablo[sira].label, (string.len(yazi)*8),20, false)
		guiLabelSetHorizontalAlign(wtablo[sira].label, "center")
		guiLabelSetVerticalAlign(wtablo[sira].label, "center")
		_guiSetText(wtablo[sira].label, yazi)
	else
		_guiSetText(element, yazi)
	end
end

_guiGetText = guiGetText
function guiGetText(element)
	if penceremi(element) then
		local sira = penceremi(element)
		local yazi = _guiGetText(wtablo[sira].label)
		return yazi
	else
		local yazi = _guiGetText(element)
		return yazi
	end
end

_guiSetEnabled = guiSetEnabled
function guiSetEnabled(element, bool)
	if butonmu(element) then
		if bool == false then
			guiSetAlpha(btablo[butonmu(element)].resim,0.5)
			_guiSetEnabled(element, bool)
		else
			guiSetAlpha(btablo[butonmu(element)].resim,1)
			_guiSetEnabled(element, bool)
		end
	else
		_guiSetEnabled(element, bool)
	end	
end

_guiWindowSetSizable = guiWindowSetSizable
function guiWindowSetSizable(element, bool)
	if getElementType(element) ~= "gui-window" then
		return false
	else
		_guiWindowSetSizable(element, bool)
	end	
end
