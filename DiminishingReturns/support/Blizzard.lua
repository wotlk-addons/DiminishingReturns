local addon = DiminishingReturns
if not addon then return end

-- FrameXML is a internal fake to have this working like other support
addon:RegisterAddonSupport('FrameXML', function()
	
	local db = addon.db:RegisterNamespace('Blizzard', {profile={
		player = {
			enabled = true,
			iconSize = 30,
			direction = 'RIGHT',
			spacing = 3,
			anchorPoint = 'TOPLEFT',
			relPoint = 'TOPLEFT',
			xOffset = 40,
			yOffset = 20,
		},
		target = {
			enabled = true,
			iconSize = 30,
			direction = 'RIGHT',
			spacing = 3,
			anchorPoint = 'TOPLEFT',
			relPoint = 'TOPRIGHT',
			xOffset = -100,
			yOffset = 20,
		},
		focus = {
			enabled = true,
			iconSize = 30,
			direction = 'RIGHT',
			spacing = 3,
			anchorPoint = 'TOPLEFT',
			relPoint = 'TOPRIGHT',
			xOffset = -100,
			yOffset = 20,
		},
	}})
	
	local function RegisterFrame(name, unit)
		local function GetDatabase() return db.profile[unit], db end
		addon:RegisterFrameConfig('Blizzard: '..addon.L[unit], GetDatabase)
		addon:RegisterFrame(name, function(frame)
			return addon:SpawnFrame(frame, frame, GetDatabase)
		end)
	end

	RegisterFrame('PlayerFrame', 'player')
	RegisterFrame('TargetFrame', 'target')
	RegisterFrame('FocusFrame', 'focus')
end)

