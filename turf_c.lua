setElementData(localPlayer, "TurfStat1", false)
setElementData(localPlayer, "TurfStat2", false)

addEvent("gTurfSound", true)
addEventHandler("gTurfSound", root,
function()
	playSound("ses.mp3")
end)

local x, y = guiGetScreenSize()

font = 1.25

if x == 800 then
	font = 0.98
elseif x == 1024 then
	font = 1.05
elseif x == 1152 then
	font = 1.1
elseif x == 1280 then
	font = 1.1
elseif x == 1360 then
	font = 1.25
elseif x == 1440 then
	font = 1.27
end

addEventHandler("onClientRender", root,
function()
	local oG1 = getElementData(localPlayer, "TurfStat1")
	if oG1 then
		dxDrawFramedText(oG1[1], x*0.875, y*0.901, x*0.99, y*0.97, tocolor(oG1[2][1], oG1[2][2], oG1[2][3], 255), font, "default")
		dxDrawRectangle(x*0.87, y*0.895, x*0.125, y*0.032, tocolor(0, 0, 0, 150))
	end
	
	local oG2 = getElementData(localPlayer, "TurfStat2")
	if oG2 then
		if not oG1 then
			dxDrawFramedText(oG2[1], x*0.875, y*0.901, x*0.99, y*0.97, tocolor(oG2[2][1], oG2[2][2], oG2[2][3], 255), font, "default")
			dxDrawRectangle(x*0.87, y*0.895, x*0.125, y*0.032, tocolor(0, 0, 0, 150))
		else
			dxDrawFramedText(oG2[1], x*0.875, y*0.951, x*0.99, y*0.99, tocolor(oG2[2][1], oG2[2][2], oG2[2][3], 255), font, "default")
			dxDrawRectangle(x*0.87, y*0.945, x*0.125, y*0.032, tocolor(0, 0, 0, 150))
		end
	end
end)

BlockKillInHospital = createColCuboid(0, 0, 0, 0, 0, 0)

function isInColKill ()
	if isElementWithinColShape(localPlayer, BlockKillInHospital) then
		return true
	end
end

function ClientExplosionCFunction()
	if isElementWithinColShape(source, BlockKillInHospital) then
		cancelEvent()
	end
end
addEventHandler("onClientExplosion", root, ClientExplosionCFunction)

function stopDamage()
	if isInColKill ()  then
		cancelEvent() 
	end
end
addEventHandler("onClientPlayerDamage", localPlayer, stopDamage)

addEventHandler("onClientPreRender", root,
function()
	if isInColKill() then
		if not getElementData(localPlayer, "TurfStat1") then
			setElementData(localPlayer, "TurfStat1", {"Güvenli Bölge", {0, 255, 0}})
		end
		if getPedWeaponSlot(localPlayer) ~= 0 then
			setPedWeaponSlot(localPlayer, 0)
			-- exports["guimessages"]:outputClient("Güvenli bölge içerisinde silah kullanamazsınız !", 255, 0, 0)
		end
	end
end)

function onClientColShapeLeave(player)
	if player == localPlayer then
		setElementData(localPlayer, "TurfStat1", false)
	end
end
addEventHandler("onClientColShapeLeave", BlockKillInHospital, onClientColShapeLeave)

function dxDrawFramedText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, postGUI, frameColor)
  if not color then
    color = tocolor(255, 255, 255, 255)
  end
  if not frameColor then
    frameColor = tocolor(0, 0, 0, 255)
  end
  if not scale then
    scale = 1
  end
  if not sans then
    sans = "sans"
  end
  if not alignX then
    alignX = "left"
  end
  if not alignY then
    alignY = "top"
  end
  if not clip then
    clip = false
  end
  if not wordBreak then
    wordBreak = false
  end
  message1 = string.gsub(message, "#%x%x%x%x%x%x", "")
  dxDrawText(message, left + 1, top + 1, width + 1, height + 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left + 1, top - 1, width + 1, height - 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left - 1, top + 1, width - 1, height + 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left - 1, top - 1, width - 1, height - 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, true)
  dxDrawText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, true)
end

butons = {   
   {"TurfStat1",
      {
      ["F1"] = true,
      ["F2"] = true,
      ["F4"] = true,
      ["j"] = true,
      ["p"] = true,
      ["b"] = true,
      }  
   },   
}

addEventHandler("onClientKey", root, function(button, press)
   for i,v in pairs(butons) do
      veri, tus = unpack(v)
	  end
      if tus[button] and getElementData(localPlayer, veri) then 
	  outputChatBox("Turf bölgesinde F1, gibi tuşları kullanamazsınız", 255, 0, 0, true)
         cancelEvent()
   end      
end)