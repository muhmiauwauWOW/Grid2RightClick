local Grid2RightClick = {};
local Grid2Ace = LibStub("AceAddon-3.0"):GetAddon("Grid2")

local macroName = "Grid2RightClick";

Grid2Ace:RegisterMessage("Grid_UnitUpdated", function()
	Grid2RightClick:setAction()
end)

function Grid2RightClick:createMacroIfnotExists()
	local macroExits = GetMacroInfo(macroName);
	if not macroExits then
		CreateMacro(macroName, "INV_MISC_QUESTIONMARK", "#showtooltip \n/cast [@mouseover] ", nil);
	end
end

function Grid2RightClick:setAction()
	Grid2RightClick:createMacroIfnotExists()
	for _,header in ipairs(Grid2Layout.groupsUsed) do
		for _,frame in ipairs(header) do
			local unit = frame:GetAttribute("unit");
			if unit then
				frame:SetAttribute("*type2", "macro")
				frame:SetAttribute("macro", macroName)
			end
		end  
	end
end

