local printTalentsMode = false

-- Slash command for printing talent tree with talent names and ID numbers
SLASH_CONROCPRINTTALENTS1 = "/ConROCPT"
SlashCmdList["CONROCPRINTTALENTS"] = function()
    printTalentsMode = not printTalentsMode
    ConROC:PopulateTalentIDs()
end

ConROC.Paladin = {};

local ConROC_Paladin, ids = ...;
local optionMaxIds = ...;
local currentSpecName;
local currentSpecID;

local consecEXP = 0;

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Paladin.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end

	ConROC:JustCasted(spellID);
end

function ConROC:PopulateTalentIDs()
    local numTabs = GetNumTalentTabs()
    
    for tabIndex = 1, numTabs do
        local tabName = GetTalentTabInfo(tabIndex)
        tabName = string.gsub(tabName, "[^%w]", "") .. "_Talent" -- Remove spaces from tab name
        print("ids."..tabName.." = {")
        local numTalents = GetNumTalents(tabIndex)

        for talentIndex = 1, numTalents do
            local name, _, _, _, _ = GetTalentInfo(tabIndex, talentIndex)

            if name then
                local talentID = string.gsub(name, "[^%w]", "") -- Remove spaces from talent name
                    print(talentID .." = ", talentIndex ..",")
            end
        end
        print("}")
    end
end

local Racial, Spec, Holy_Ability, Holy_Talent, Prot_Ability, Prot_Talent, Ret_Ability, Ret_Talent, Player_Buff, Player_Debuff, Target_Debuff, Player_Auras = ids.Racial, ids.Spec, ids.Holy_Ability, ids.Holy_Talent, ids.Prot_Ability, ids.Protection_Talent, ids.Ret_Ability, ids.Retribution_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff, ids.Player_Auras;

function ConROC:SpecUpdate()
	currentSpecName = ConROC:currentSpec()
    currentSpecID = ConROC:currentSpec("ID")

	if currentSpecName then
	   ConROC:Print(self.Colors.Info .. "Current spec:", self.Colors.Success ..  currentSpecName)
	else
	   ConROC:Print(self.Colors.Error .. "You do not currently have a spec.")
	end
end
ConROC:SpecUpdate()
--Ranks
	local _autoAttack = 6603;
	--Holy
	local _BlessingofLight = Holy_Ability.BlessingofLightRank1;
	local _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank1;
	local _Consecration = Holy_Ability.ConsecrationRank1;
	local _Exorcism = Holy_Ability.ExorcismRank1;
	local _FlashofLight = Holy_Ability.FlashofLightRank1;
	local _GreaterBlessingofWisdom = Holy_Ability.GreaterBlessingofWisdomRank1;
	local _HammerofWrath = Holy_Ability.HammerofWrathRank1;
	local _HolyLight = Holy_Ability.HolyLightRank1;
	local _HolyShock = Holy_Ability.HolyShockRank1;	
	local _HolyWrath = Holy_Ability.HolyWrathRank1;
	local _LayonHands = Holy_Ability.LayonHandsRank1;
	local _Redemption = Holy_Ability.RedemptionRank1;
	local _SealofLight = Holy_Ability.SealofLightRank1;	
	local _SealofRighteousness = Holy_Ability.SealofRighteousnessRank0;
	local _SealofWisdom = Holy_Ability.SealofWisdomRank1;
	local _TurnUndead = Holy_Ability.TurnUndeadRank1;

	--Protection
	local _BlessingofKings = Prot_Ability.BlessingofKings;
	local _BlessingofProtection = Prot_Ability.BlessingofProtectionRank1;
	local _BlessingofSacrifice = Prot_Ability.BlessingofSacrificeRank1;
	local _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank1;
	local _DivineProtection = Prot_Ability.DivineProtectionRank1;	
	local _DivineShield = Prot_Ability.DivineShieldRank1;
	local _GreaterBlessingofKings = Prot_Ability.GreaterBlessingofKings;
	local _GreaterBlessingofSalvation = Prot_Ability.GreaterBlessingofSalvation;
	local _GreaterBlessingofSanctuary = Prot_Ability.GreaterBlessingofSanctuary;
	local _HammerofJustice = Prot_Ability.HammerofJusticeRank1;
	local _HammeroftheRighteous = Prot_Ability.HammeroftheRighteous;
	local _BlessingofSalvation = Prot_Ability.BlessingofSalvation;
	local _HolyShield = Prot_Ability.HolyShieldRank1;
	local _RighteousFury = Prot_Ability.RighteousFury;
	local _SealofJustice = Prot_Ability.SealofJustice;

	--Retribution
	local _AvengingWrath = Ret_Ability.AvengingWrath;
	local _BlessingofMight = Ret_Ability.BlessingofMightRank1;
	local _GreaterBlessingofMight = Ret_Ability.GreaterBlessingofMightRank1;
	local _SanctityAura = Player_Auras.SanctityAura;
	local _SealofCommand = Ret_Ability.SealofCommandRank1;
	local _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank1;
	local _JudgementoftheCrusaderDEBUFF = Target_Debuff.JudgementoftheCrusaderRank1;
	local _JudgementofJusticeDEBUFF = Target_Debuff.JudgementofJustice
	local _JudgementofLightDEBUFF = Target_Debuff.JudgementofLightRank1;
	local _JudgementofWisdomDEBUFF = Target_Debuff.JudgementofWisdomRank1;
--Runes
	local _DivineStorm = ids.Runes.DivineStorm
	local _HornofLordaeron = ids.Runes.HornofLordaeron
	local _SealofMartyrdom = ids.Runes.SealofMartyrdom
	local _BeaconofLight = ids.Runes.BeaconofLight
	local _CrusaderStrike = ids.Runes.CrusaderStrike
	local _InspirationExemplar = ids.Runes.InspirationExemplar
	local _HandofReckoning = ids.Runes.HandofReckoning
	local _AvengersShield = ids.Runes.AvengersShield
	local _DivineSacrifice = ids.Runes.DivineSacrifice
	local _Rebuke = ids.Runes.Rebuke
--Auras
	--Holy
	local _ConcentrationAura = Player_Auras.ConcentrationAura;

	--Protection
	local _DevotionAura = Player_Auras.DevotionAuraRank1;
	local _FireResistanceAura = Player_Auras.FireResistanceAuraRank1;
	local _FrostResistanceAura = Player_Auras.FrostResistanceAuraRank1;	
	local _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank1;

	--Retribution
	local _RetributionAura = Player_Auras.RetributionAuraRank1;	

function ConROC:UpdateSpellID()
--Holy
if IsSpellKnown(Holy_Ability.BlessingofLightRank3) then _BlessingofLight = Holy_Ability.BlessingofLightRank3;	
elseif IsSpellKnown(Holy_Ability.BlessingofLightRank2) then _BlessingofLight = Holy_Ability.BlessingofLightRank2; end

if IsSpellKnown(Holy_Ability.BlessingofWisdomRank6) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank6;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank5) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank5;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank4) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank4;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank3) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank3;	
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank2) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank2; end

if IsSpellKnown(Holy_Ability.ConsecrationRank5) then _Consecration = Holy_Ability.ConsecrationRank5;
elseif IsSpellKnown(Holy_Ability.ConsecrationRank4) then _Consecration = Holy_Ability.ConsecrationRank4;
elseif IsSpellKnown(Holy_Ability.ConsecrationRank3) then _Consecration = Holy_Ability.ConsecrationRank3;	
elseif IsSpellKnown(Holy_Ability.ConsecrationRank2) then _Consecration = Holy_Ability.ConsecrationRank2; end

if IsSpellKnown(Holy_Ability.ExorcismRank6) then _Exorcism = Holy_Ability.ExorcismRank6;
elseif IsSpellKnown(Holy_Ability.ExorcismRank5) then _Exorcism = Holy_Ability.ExorcismRank5;
elseif IsSpellKnown(Holy_Ability.ExorcismRank4) then _Exorcism = Holy_Ability.ExorcismRank4;
elseif IsSpellKnown(Holy_Ability.ExorcismRank3) then _Exorcism = Holy_Ability.ExorcismRank3;
elseif IsSpellKnown(Holy_Ability.ExorcismRank2) then _Exorcism = Holy_Ability.ExorcismRank2; end

if IsSpellKnown(Holy_Ability.FlashofLightRank6) then _FlashofLight = Holy_Ability.FlashofLightRank6;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank5) then _FlashofLight = Holy_Ability.FlashofLightRank5;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank4) then _FlashofLight = Holy_Ability.FlashofLightRank4;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank3) then _FlashofLight = Holy_Ability.FlashofLightRank3;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank2) then _FlashofLight = Holy_Ability.FlashofLightRank2; end	

if IsSpellKnown(Holy_Ability.GreaterBlessingofWisdomRank2) then _GreaterBlessingofWisdom = Holy_Ability.GreaterBlessingofWisdomRank2; end

if IsSpellKnown(Holy_Ability.HammerofWrathRank3) then _HammerofWrath = Holy_Ability.HammerofWrathRank3;
elseif IsSpellKnown(Holy_Ability.HammerofWrathRank2) then _HammerofWrath = Holy_Ability.HammerofWrathRank2; end

if IsSpellKnown(Holy_Ability.HolyLightRank8) then _HolyLight = Holy_Ability.HolyLightRank8;
elseif IsSpellKnown(Holy_Ability.HolyLightRank7) then _HolyLight = Holy_Ability.HolyLightRank7;
elseif IsSpellKnown(Holy_Ability.HolyLightRank6) then _HolyLight = Holy_Ability.HolyLightRank6;
elseif IsSpellKnown(Holy_Ability.HolyLightRank5) then _HolyLight = Holy_Ability.HolyLightRank5;
elseif IsSpellKnown(Holy_Ability.HolyLightRank4) then _HolyLight = Holy_Ability.HolyLightRank4;
elseif IsSpellKnown(Holy_Ability.HolyLightRank3) then _HolyLight = Holy_Ability.HolyLightRank3;
elseif IsSpellKnown(Holy_Ability.HolyLightRank2) then _HolyLight = Holy_Ability.HolyLightRank2; end

if IsSpellKnown(Holy_Ability.HolyShockRank3) then _HolyShock = Holy_Ability.HolyShockRank3;	
elseif IsSpellKnown(Holy_Ability.HolyShockRank2) then _HolyShock = Holy_Ability.HolyShockRank2; end	

if IsSpellKnown(Holy_Ability.HolyWrathRank2) then _HolyWrath = Holy_Ability.HolyWrathRank2; end

if IsSpellKnown(Holy_Ability.SealofLightRank4) then _SealofLight = Holy_Ability.SealofLightRank4; _JudgementofLightDEBUFF = Target_Debuff.JudgementofLightRank4;
elseif IsSpellKnown(Holy_Ability.SealofLightRank3) then _SealofLight = Holy_Ability.SealofLightRank3; _JudgementofLightDEBUFF = Target_Debuff.JudgementofLightRank3;
elseif IsSpellKnown(Holy_Ability.SealofLightRank2) then _SealofLight = Holy_Ability.SealofLightRank2; _JudgementofLightDEBUFF = Target_Debuff.JudgementofLightRank2; end

if IsSpellKnown(Holy_Ability.SealofRighteousnessRank8) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank8;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank7) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank7;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank6) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank6;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank5) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank5;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank4) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank4;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank3) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank3;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank2) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank2;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank1) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank1; end

if IsSpellKnown(Holy_Ability.SealofWisdomRank3) then _SealofWisdom = Holy_Ability.SealofWisdomRank3; _JudgementofWisdomDEBUFF = Target_Debuff.JudgementofWisdomRank3;
elseif IsSpellKnown(Holy_Ability.SealofWisdomRank2) then _SealofWisdom = Holy_Ability.SealofWisdomRank2; _JudgementofWisdomDEBUFF = Target_Debuff.JudgementofWisdomRank2; end

if IsSpellKnown(Holy_Ability.TurnUndeadRank3) then _SealofWisdom = Holy_Ability.TurnUndeadRank3;
elseif IsSpellKnown(Holy_Ability.TurnUndeadRank2) then _SealofWisdom = Holy_Ability.TurnUndeadRank2;end

--Protection
if IsSpellKnown(Prot_Ability.BlessingofProtectionRank3) then _BlessingofProtection = Prot_Ability.BlessingofProtectionRank3;	
elseif IsSpellKnown(Prot_Ability.BlessingofProtectionRank2) then _BlessingofProtection = Prot_Ability.BlessingofProtectionRank2; end

if IsSpellKnown(Prot_Ability.BlessingofSacrificeRank2) then _BlessingofSacrifice = Prot_Ability.BlessingofSacrificeRank2; end

if IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank4) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank4;
elseif IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank3) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank3;	
elseif IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank2) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank2; end

if IsSpellKnown(Prot_Ability.DivineProtectionRank2) then _DivineProtection = Prot_Ability.DivineProtectionRank2; end

if IsSpellKnown(Prot_Ability.DivineShieldRank2) then _DivineShield = Prot_Ability.DivineShieldRank2; end

if IsSpellKnown(Prot_Ability.HammerofJusticeRank4) then _HammerofJustice = Prot_Ability.HammerofJusticeRank4;
elseif IsSpellKnown(Prot_Ability.HammerofJusticeRank3) then _HammerofJustice = Prot_Ability.HammerofJusticeRank3;
elseif IsSpellKnown(Prot_Ability.HammerofJusticeRank2) then _HammerofJustice = Prot_Ability.HammerofJusticeRank2; end

if IsSpellKnown(Prot_Ability.HolyShieldRank3) then _HolyShield = Prot_Ability.HolyShieldRank3;	
elseif IsSpellKnown(Prot_Ability.HolyShieldRank2) then _HolyShield = Prot_Ability.HolyShieldRank2; end

--Retribution
if IsSpellKnown(Ret_Ability.BlessingofMightRank6) then _BlessingofMight = Ret_Ability.BlessingofMightRank6;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank5) then _BlessingofMight = Ret_Ability.BlessingofMightRank5;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank4) then _BlessingofMight = Ret_Ability.BlessingofMightRank4;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank3) then _BlessingofMight = Ret_Ability.BlessingofMightRank3;	
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank2) then _BlessingofMight = Ret_Ability.BlessingofMightRank2; end

if IsSpellKnown(Ret_Ability.GreaterBlessingofMightRank2) then _GreaterBlessingofMight = Ret_Ability.GreaterBlessingofMightRank2; end

if IsSpellKnown(Ret_Ability.SealofCommandRank5) then _SealofCommand = Ret_Ability.SealofCommandRank5;
elseif IsSpellKnown(Ret_Ability.SealofCommandRank4) then _SealofCommand = Ret_Ability.SealofCommandRank4;
elseif IsSpellKnown(Ret_Ability.SealofCommandRank3) then _SealofCommand = Ret_Ability.SealofCommandRank3;	
elseif IsSpellKnown(Ret_Ability.SealofCommandRank2) then _SealofCommand = Ret_Ability.SealofCommandRank2; end

if IsSpellKnown(Ret_Ability.SealoftheCrusaderRank6) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank6; _JudgementoftheCrusaderDEBUFF = Target_Debuff.JudgementoftheCrusaderRank6;
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank5) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank5; _JudgementoftheCrusaderDEBUFF = Target_Debuff.JudgementoftheCrusaderRank5;
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank4) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank4; _JudgementoftheCrusaderDEBUFF = Target_Debuff.JudgementoftheCrusaderRank4;
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank3) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank3; _JudgementoftheCrusaderDEBUFF = Target_Debuff.JudgementoftheCrusaderRank3;	
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank2) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank2; _JudgementoftheCrusaderDEBUFF = Target_Debuff.JudgementoftheCrusaderRank2; end

--Auras
--Holy
--Protection
if IsSpellKnown(Player_Auras.DevotionAuraRank7) then _DevotionAura = Player_Auras.DevotionAuraRank7;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank6) then _DevotionAura = Player_Auras.DevotionAuraRank6;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank5) then _DevotionAura = Player_Auras.DevotionAuraRank5;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank4) then _DevotionAura = Player_Auras.DevotionAuraRank4;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank3) then _DevotionAura = Player_Auras.DevotionAuraRank3;	
elseif IsSpellKnown(Player_Auras.DevotionAuraRank2) then _DevotionAura = Player_Auras.DevotionAuraRank2; end

if IsSpellKnown(Player_Auras.FireResistanceAuraRank3) then _FireResistanceAura = Player_Auras.FireResistanceAuraRank3;
elseif IsSpellKnown(Player_Auras.FireResistanceAuraRank2) then _FireResistanceAura = Player_Auras.FireResistanceAuraRank2; end

if IsSpellKnown(Player_Auras.FrostResistanceAuraRank3) then _FrostResistanceAura = Player_Auras.FrostResistanceAuraRank3;	
elseif IsSpellKnown(Player_Auras.FrostResistanceAuraRank2) then _FrostResistanceAura = Player_Auras.FrostResistanceAuraRank2; end

if IsSpellKnown(Player_Auras.ShadowResistanceAuraRank3) then _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank3;	
elseif IsSpellKnown(Player_Auras.ShadowResistanceAuraRank2) then _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank2; end	

--Retribution
if IsSpellKnown(Player_Auras.RetributionAuraRank5) then _RetributionAura = Player_Auras.RetributionAuraRank5;
elseif IsSpellKnown(Player_Auras.RetributionAuraRank4) then _RetributionAura = Player_Auras.RetributionAuraRank4;
elseif IsSpellKnown(Player_Auras.RetributionAuraRank3) then _RetributionAura = Player_Auras.RetributionAuraRank3;	
elseif IsSpellKnown(Player_Auras.RetributionAuraRank2) then _RetributionAura = Player_Auras.RetributionAuraRank2; end	


ids.optionMaxIds = {
	--Holy
	BlessingofLight = _BlessingofLight,
	BlessingofWisdom = _BlessingofWisdom,
	Consecration = _Consecration,
	Exorcism = _Exorcism,
	FlashofLight = _FlashofLight,
	GreaterBlessingofWisdom = _GreaterBlessingofWisdom,
	HammerofWrath = _HammerofWrath,
	HolyLight = _HolyLight,
	HolyShock = _HolyShock,
	HolyWrath = _HolyWrath,
	LayonHands = _LayonHands,
	Redemption = _Redemption,
	SealofLight = _SealofLight,
	SealofRighteousness = _SealofRighteousness,
	SealofWisdom = _SealofWisdom,
	TurnUndead = _TurnUndead,
	--Protection
	BlessingofKings = _BlessingofKings,
	BlessingofProtection = _BlessingofProtection,
	BlessingofSacrifice = _BlessingofSacrifice,
	BlessingofSanctuary = _BlessingofSanctuary,
	DivineProtection = _DivineProtection,
	DivineShield = _DivineShield,
	GreaterBlessingofKings = _GreaterBlessingofKings,
	GreaterBlessingofSalvation = _GreaterBlessingofSalvation,
	GreaterBlessingofSanctuary = _GreaterBlessingofSanctuary,
	HammerofJustice = _HammerofJustice,
	HammeroftheRighteous = _HammeroftheRighteous,
	BlessingofSalvation = _BlessingofSalvation,
	HolyShield = _HolyShield,
	RighteousFury = _RighteousFury,
	SealofJustice = _SealofJustice,
	--Retribution
	BlessingofMight = _BlessingofMight,
	GreaterBlessingofMight = _GreaterBlessingofMight,
	SealofCommand = _SealofCommand,
	SealoftheCrusader = _SealoftheCrusader,
	--Auras
	ConcentrationAura = _ConcentrationAura,
	DevotionAura = _DevotionAura,
	FireResistanceAura = _FireResistanceAura,
	FrostResistanceAura = _FrostResistanceAura,
	SanctityAura = _SanctityAura,
	ShadowResistanceAura = _ShadowResistanceAura,
	RetributionAura = _RetributionAura,
	--Runes
	DivineStorm = _DivineStorm,
	HornofLordaeron = _HornofLordaeron,
	SealofMartyrdom = _SealofMartyrdom,
	BeaconofLight = _BeaconofLight,
	CrusaderStrike = _CrusaderStrike,
	InspirationExemplar = _InspirationExemplar,
	HandofReckoning = _HandofReckoning,
	AvengersShield = _AvengersShield,
	DivineSacrifice = _DivineSacrifice,
--	Rebuke = _Rebuke,
}
end
ConROC:UpdateSpellID()

function ConROC:EnableRotationModule()
	self.Description = "Paladin";
	self.NextSpell = ConROC.Paladin.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	ConROC:SpellmenuClass();
--	ConROCSpellmenuFrame:Hide();
end
function ConROC:PLAYER_TALENT_UPDATE()
	ConROC:SpecUpdate();
    ConROC:closeSpellmenu();
end

function ConROC.Paladin.Damage(_, timeShift, currentSpell, gcd)
ConROC:UpdateSpellID()
--Character
	local plvl 												= UnitLevel('player');
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
 
--Abilities	
	local boMight											= ConROC:AbilityReady(_BlessingofMight, timeShift);
		local bomBuff											= ConROC:Buff(_BlessingofMight, timeShift);	
	local boWisdom											= ConROC:AbilityReady(_BlessingofWisdom, timeShift);
		local bowBuff											= ConROC:Buff(_BlessingofWisdom, timeShift);	
	local boKings											= ConROC:AbilityReady(_BlessingofKings, timeShift);
		local bokBuff											= ConROC:Buff(_BlessingofKings, timeShift);	
	local gBoKings											= ConROC:AbilityReady(_GreaterBlessingofKings, timeShift);
		local gBokBuff											= ConROC:Buff(_GreaterBlessingofKings, timeShift);	
	local boSalv											= ConROC:AbilityReady(_BlessingofSalvation, timeShift);
		local bosBuff											= ConROC:Buff(_BlessingofSalvation, timeShift);	
	local consecRDY 										= ConROC:AbilityReady(_Consecration, timeShift);
		local consecDUR 										= consecEXP - GetTime();
	local hWrathRDY 										= ConROC:AbilityReady(_HolyWrath, timeShift);
	local hShieldRDY 										= ConROC:AbilityReady(_HolyShield, timeShift);
		local hShieldBUFF, hShieldCount, hShieldDUR				= ConROC:Buff(_HolyShield, timeShift);
		local incBlockBUFF, _, incBlockDUR						= ConROC:Buff(Player_Buff.IncreasedBlock)
	local gBoSalv											= ConROC:AbilityReady(_GreaterBlessingofSalvation, timeShift);
		local gBosBuff											= ConROC:Buff(_GreaterBlessingofSalvation, timeShift);	
	local boSanc											= ConROC:AbilityReady(_BlessingofSanctuary, timeShift);
		local bosaBuff											= ConROC:Buff(_BlessingofSanctuary, timeShift);	
	if ConROC:TalentChosen(Spec.Protection, Prot_Talent.BlessingofSanctuary) then
		local gBoSanc											= ConROC:AbilityReady(_GreaterBlessingofSanctuary, timeShift);
			local gBosaBuff											= ConROC:Buff(_GreaterBlessingofSanctuary, timeShift);	
	end
	local boLight											= ConROC:AbilityReady(_BlessingofLight, timeShift);
		local bolBuff											= ConROC:Buff(_BlessingofLight, timeShift);			
	local judgement, judgeCD, judgeMCD						= ConROC:AbilityReady(Ret_Ability.Judgement, timeShift);	
	local soCrusader										= ConROC:AbilityReady(_SealoftheCrusader, timeShift);
		local socBuff											= ConROC:Buff(_SealoftheCrusader, timeShift);
	local soJustice											= ConROC:AbilityReady(Prot_Ability.SealofJustice, timeShift);
		local sojBuff											= ConROC:Buff(Prot_Ability.SealofJustice, timeShift);
	local soLight											= ConROC:AbilityReady(_SealofLight, timeShift);
		local solBuff											= ConROC:Buff(_SealofLight, timeShift);
	local soWisdom											= ConROC:AbilityReady(_SealofWisdom, timeShift);
		local sowBuff											= ConROC:Buff(_SealofWisdom, timeShift);
	local soRighteousness									= ConROC:AbilityReady(_SealofRighteousness, timeShift);
		local sorBuff, sorDUR									= ConROC:BuffName(_SealofRighteousness, timeShift);	
	local soCommand											= ConROC:AbilityReady(_SealofCommand, timeShift);
		local socomBuff, socomDUR								= ConROC:BuffName(_SealofCommand, timeShift);
	local exorcism											= ConROC:AbilityReady(_Exorcism, timeShift);
	local hoJustice											= ConROC:AbilityReady(_HammerofJustice, timeShift);
		local hojDebuff = ConROC:TargetDebuff(_HammerofJustice, timeShift);
    
    local judgeDebuff = {
		joc = ConROC:TargetDebuff(_JudgementoftheCrusaderDEBUFF, timeShift);
        joj = ConROC:TargetDebuff(Target_Debuff.JudgementofJustice, timeShift);
		jol	= ConROC:TargetDebuff(_JudgementofLightDEBUFF, timeShift);
        jow	= ConROC:TargetDebuff(_JudgementofWisdomDEBUFF, timeShift);
    }	

	local judgeUp = false;
		for k, v in pairs(judgeDebuff) do
			if v then
				judgeUp = true;
				break
			end
		end

	--Runes
	local dStormRDY											= ConROC:AbilityReady(_DivineStorm, timeShift);
	local hofLRDY											= ConROC:AbilityReady(_HornofLordaeron, timeShift);
	local sofMRDY											= ConROC:AbilityReady(_SealofMartyrdom, timeShift);
		local sofMBUFF, sofMDUR 								=ConROC:BuffName(_SealofMartyrdom, timeShift);
	local bofLRDY											= ConROC:AbilityReady(_BeaconofLight, timeShift);
	local cStrikeRDY										= ConROC:AbilityReady(_CrusaderStrike, timeShift);
	local inspExemplarRDY									= ConROC:AbilityReady(_InspirationExemplar, timeShift);
	local hofRecRDY											= ConROC:AbilityReady(_HandofReckoning, timeShift);
	local aShieldRDY										= ConROC:AbilityReady(_AvengersShield, timeShift);
	local dSacrificeRDY										= ConROC:AbilityReady(_DivineSacrifice, timeShift);
	local rebukeRDY											= ConROC:AbilityReady(_Rebuke, timeShift);
 
		
--Conditions
	local knowMartyrdom										= IsSpellKnownOrOverridesKnown(_SealofMartyrdom)
	local isExorcist										= IsSpellKnownOrOverridesKnown(ids.Runes.Exorcist)
	local incombat 											= UnitAffectingCombat('player');	
	local isEnemy 											= ConROC:TarHostile();
	local isAutoAttacking 									= IsPlayerAttacking("target");
	local Close 											= ConROC:IsMeleeRange()--CheckInteractDistance("target", 3);
	local tarInMelee										= 0;
	local tarInAoe											= 0;
	local twohandIDs = {1,5,6,8,10} --Two-Handed Axes, Two-Handed Maces, Polearms, Two-Handed Swords, Saves
	local has2HandID = ConROC:Equipped(twohandIDs, "MAINHANDSLOT")

	if IsSpellKnown(_autoAttack) then
		tarInMelee = ConROC:Targets(_autoAttack);
	end
	if ConROC_AoEButton:IsVisible() and IsSpellKnown(_Consecration) then
		tarInAoe = ConROC:Targets(_Consecration);
	end
--Indicators	
	ConROC:AbilityRaidBuffs(_BlessingofMight, ConROC:CheckBox(ConROC_SM_Bless_Might) and boMight and not bomBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofWisdom, ConROC:CheckBox(ConROC_SM_Bless_Wisdom) and boWisdom and not bowBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_Kings) and boKings and not bokBuff);	
	ConROC:AbilityRaidBuffs(_GreaterBlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_GreaterKings) and gBoKings and not gBokBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_Salvation) and boSalv and not bosBuff);	
	ConROC:AbilityRaidBuffs(_GreaterBlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_GreaterSalvation) and gBoSalv and not gBosBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_Sanctuary) and gBoSanc and not gBosaBuff);	
	if ConROC:TalentChosen(Spec.Protection, Prot_Talent.BlessingofSanctuary) then
		ConROC:AbilityRaidBuffs(_GreaterBlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_GreaterSanctuary) and gBoSanc and not gBosaBuff);
	end
	ConROC:AbilityRaidBuffs(_BlessingofLight, ConROC:CheckBox(ConROC_SM_Bless_Light) and boLight and not bolBuff);
    
    ConROC:AbilityInterrupt(_Rebuke, ConROC:Interrupt() and rebukeRDY)
	
--Warnings
	
--Rotations
	if ConROC.Seasons.IsSoD then
		if ConROC:CheckBox(ConROC_SM_Role_Melee) or (ConROC:CheckBox(ConROC_SM_Role_Healer) and ConROC:TarHostile()) then
			if not ConROC_AoEButton:IsVisible() then
				if ConROC:CheckBox(ConROC_SM_Seal_Crusader) and soCrusader and not socBuff and not judgeDebuff.joc and (judgeCD >= judgeMCD - 1) then
					return _SealoftheCrusader;
				end
				if judgement and not judgeUp and socBuff then
					return Ret_Ability.Judgement;
				end
			end

			if ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and soRighteousness and (not sorBuff or sorDUR <= 2) and not (socBuff or sofMBUFF) then
				return _SealofRighteousness;
			end
			if ConROC:CheckBox(ConROC_SM_Seal_Command) and soCommand and not socomBuff then
				return _SealofCommand;
			end
			if ConROC:CheckBox(ConROC_SM_Seal_Crusader) and soCrusader and not socBuff and not judgeDebuff.joc and (judgeCD >= judgeMCD - 1) then
				return _SealoftheCrusader;
			end

			if ConROC:CheckBox(ConROC_SM_Seal_Justice) and soJustice and not sojBuff and not judgeDebuff.joj and (judgeCD >= judgeMCD - 1) then
				return Prot_Ability.SealofJustice;
			end
			
			if ConROC:CheckBox(ConROC_SM_Seal_Light) and soLight and not solBuff and not judgeDebuff.jol and (judgeCD >= judgeMCD - 1) then
				return _SealofLight;
			end	
			
			if ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and soWisdom and not sowBuff and not judgeDebuff.jow and (judgeCD >= judgeMCD - 1) then
				return _SealofWisdom;
			end
			if dStormRDY then
				return _DivineStormRDY
			end
			if cStrikeRDY then
				return _CrusaderStrike
			end
			if exorcism and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon") or isExorcist ) then
				return _Exorcism;
			end
			if judgement and not judgeUp then
				return Ret_Ability.Judgement;
			end
		end
		if ConROC:CheckBox(ConROC_SM_Role_Tank) then		
			if soCommand and not socomBuff and not knowMartyrdom then
				return _SealofCommand;
			end
			if sofMRDY and knowMartyrdom and not sofMBUFF then
				return _SealofMartyrdom
			end
			if ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and soRighteousness and (not sorBuff or sorDUR <= 2) and not (socBuff or sofMBUFF) then
				return _SealofRighteousness;
			end
			if aShieldRDY then
				return _AvengersShield
			end
			if isExorcist and exorcism then
				return _Exorcism
			end
			if judgement and not judgeUp then
				return Ret_Ability.Judgement;
			end
			if dStormRDY then
				return _DivineStormRDY
			end
			if consecRDY then
				return _Consecration
			end
		end
		return nil
	end
	if (currentSpecID == ids.Spec.Holy and ConROC:TarHostile()) or (not currentSpecID == ids.Spec.Holy or not currentSpecID) then
		if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) and soCrusader and not socBuff and not judgeDebuff.joc and (judgeCD >= judgeMCD - 1) then
			return _SealoftheCrusader;
		end

		if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and soJustice and not sojBuff and not judgeDebuff.joj and (judgeCD >= judgeMCD - 1) then
			return Prot_Ability.SealofJustice;
		end
		
		if ConROC:CheckBox(ConROC_SM_Judgement_Light) and soLight and not solBuff and not judgeDebuff.jol and (judgeCD >= judgeMCD - 1) then
			return _SealofLight;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and soWisdom and not sowBuff and not judgeDebuff.jow and (judgeCD >= judgeMCD - 1) then
			return _SealofWisdom;
		end	
		
		if judgement and not judgeUp then
			return Ret_Ability.Judgement;
		end	

		if ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and soRighteousness and (not sorBuff or sorDUR <= 2) then
			return _SealofRighteousness;
		end
		
		if ConROC:CheckBox(ConROC_SM_Seal_Crusader) and soCrusader and not socBuff then
			return _SealoftheCrusader;
		end

		if ConROC:CheckBox(ConROC_SM_Seal_Command) and soCommand and not socomBuff then
			return _SealofCommand;
		end	
			
		if ConROC:CheckBox(ConROC_SM_Seal_Justice) and soJustice and not sojBuff then
			return Prot_Ability.SealofJustice;
		end
		
		if ConROC:CheckBox(ConROC_SM_Seal_Light) and soLight and not solBuff then
			return _SealofLight;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and soWisdom and not sowBuff then
			return _SealofWisdom;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Stun_HammerofJustice) and hoJustice and judgement then
			return _HammerofJustice;
		end

		if judgement and (socomBuff or sorBuff) then
			return Ret_Ability.Judgement;
		end
		
		if exorcism and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon")) then
			return _Exorcism;
		end
	end
	return nil;
	--[[
	if currentSpecID == ids.Spec.Holy then
	end
	if currentSpecID == ids.Spec.Protection then
	end
	if currentSpecID == ids.Spec.Retribution then
	end
	--]]
end

function ConROC.Paladin.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);

--Abilities	
	local dAura												= ConROC:AbilityReady(_DevotionAura, timeShift);
		local daBuff											= ConROC:Form(_DevotionAura);
	local rAura												= ConROC:AbilityReady(_RetributionAura, timeShift);
		local raBuff											= ConROC:Form(_RetributionAura);
	local cAura												= ConROC:AbilityReady(_ConcentrationAura, timeShift);
		local caBuff											= ConROC:Form(_ConcentrationAura);
	local sAura												= ConROC:AbilityReady(_SanctityAura, timeShift);
		local saBuff											= ConROC:Form(_SanctityAura);
	local fRAura											= ConROC:AbilityReady(_FireResistanceAura, timeShift);
		local fRBuff											= ConROC:Form(_FireResistanceAura);
	local frRAura											= ConROC:AbilityReady(_FrostResistanceAura, timeShift);
		local frRBuff											= ConROC:Form(_FrostResistanceAura);
	local shaAura											= ConROC:AbilityReady(_ShadowResistanceAura, timeShift);
		local shaBuff											= ConROC:Form(_ShadowResistanceAura);
		
--Conditions
	local playerPh 											= ConROC:PercentHealth('player');

--Rotations
	if dAura and not daBuff and ConROC:CheckBox(ConROC_SM_Aura_Devotion) then
		return _DevotionAura;
	end
	
	if rAura and not raBuff and ConROC:CheckBox(ConROC_SM_Aura_Retribution) then
		return _RetributionAura;
	end
	
	if cAura and not caBuff and ConROC:CheckBox(ConROC_SM_Aura_Concentration) then
		return _ConcentrationAura;
	end
	
	if sAura and not saBuff and ConROC:CheckBox(ConROC_SM_Aura_Sanctity) then
		return _SanctityAura;
	end
	
	if fRAura and not fRBuff and ConROC:CheckBox(ConROC_SM_Aura_FireResistance) then
		return _FireResistanceAura;
	end
	
	if frRAura and not frRBuff and ConROC:CheckBox(ConROC_SM_Aura_FrostResistance) then
		return _FrostResistanceAura;
	end
	
	if shaAura and not shaBuff and ConROC:CheckBox(ConROC_SM_Aura_ShadowResistance) then
		return _ShadowResistanceAura;
	end
	
	return nil;
end

function ConROC:JustCasted(spellID)
	if spellID == _Consecration then
		local expTime = GetTime() + 8;
		consecEXP = expTime;
	end
end
