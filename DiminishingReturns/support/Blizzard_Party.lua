local addon = DiminishingReturns
if not addon then return end

-- FrameXMLXXX is a internal fake to have this working like other support
addon:RegisterAddonSupport('FrameXMLParty', function()

	local db = addon.db:RegisterNamespace('Blizzard_Party', {profile={
		enabled = true,
		iconSize = 20,
		direction = 'RIGHT',
		spacing = 3,
		anchorPoint = 'TOPLEFT',
		relPoint = 'TOPLEFT',
		xOffset = 0,
		yOffset = 15,
	}})

	local function GetDatabase() 
		return db.profile, db
	end

	addon:RegisterFrameConfig('Party', GetDatabase)

	local function SetupFrame(frame)
		return addon:SpawnFrame(frame, frame, GetDatabase)
	end

	for i = 1,4 do
		addon:RegisterFrame('PartyMemberFrame'..i, SetupFrame)
	end
	
end)

