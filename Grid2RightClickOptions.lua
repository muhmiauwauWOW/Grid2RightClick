local Grid2Ace = LibStub("AceAddon-3.0"):GetAddon("Grid2")




function getMacroData()
	local values = {}
	for i = 1,138,1 
	do 
		local name, icon, body = GetMacroInfo(i)
		if(name) then 
			values[name] = name
		end
	end
	return values
end

Grid2Ace:RegisterEvent("ADDON_LOADED", function(event, addonName)
	if(addonName == "Grid2Options") then
		local theme = Grid2Options.editedTheme


		local Options  = {
			group1 = { 
				type = "group", 
				inline = true, 
				order = 1, 
				name = "Right click Macro",   
				desc = "Right click Macro", 
				args = {
					enableToggle = {
						type = "toggle",
						name = "Enable",
						desc = "Use Macro on right clicking on a frame.",
						order = 10,
						get = function () return theme.frame.macroRightClick end,
						set = function (_, v)
							theme.frame.macroRightClick = true or false
							Grid2Layout:RefreshLayout()
						end,
					}, 
					selectMacro = {
						type = "select",
						name = "Select Macro",
						desc = "Select used Macro",
						order = 40,
						get = function () return theme.frame.macroRightClickMacro
						end,
						set = function (_, v)
							theme.frame.macroRightClickMacro  = v or nil
							Grid2Layout:RefreshLayout()
					  	end,
						values = getMacroData();
					}
				}
			}
		}
		Grid2Options:AddThemeOptions( "Grid2RightClick", "Grid2RightClick", Options)
	end
end)

