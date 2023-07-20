local Grid2RightClick = {};
local Grid2Ace = LibStub("AceAddon-3.0"):GetAddon("Grid2")

Grid2Ace:RegisterMessage("Grid_UnitUpdated", function()
	Grid2RightClick:setAction()
end)

function Grid2RightClick:setAction()
	local rc = Grid2Frame.db.profile.macroRightClickMacro and Grid2Frame.db.profile.macroRightClick;
	local v = Grid2Frame.db.profile.menuDisabled;

	Grid2Frame:WithAllFrames( function(f) 
		f:SetAttribute("*type2",rc and "macro" or ((not v) and "togglemenu" or nil)); 
		f:SetAttribute("macro", Grid2Frame.db.profile.macroRightClickMacro)
	end)
end