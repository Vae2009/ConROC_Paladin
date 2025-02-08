ConROC.Paladin = {};

local ConROC_Paladin, ids = ...;

function ConROC:EnableRotationModule()
	self.Description = "Paladin";
	self.NextSpell = ConROC.Paladin.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	if ConROCSpellmenuClass == nil then
		ConROC:SpellmenuClass();
	end
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Paladin.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end

	ConROC:JustCasted(spellID);
end

local Racial, Spec, Ability, Rank, Holy_Talent, Prot_Talent, Ret_Talent, Engrave, Runes, Buff, Debuff = ids.Racial, ids.Spec, ids.Ability, ids.Rank, ids.Holy_Talent, ids.Protection_Talent, ids.Retribution_Talent, ids.Engrave, ids.Runes, ids.Buff, ids.Debuff;
local consecEXP = 0;

--Info
local _Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
local _Player_Level = UnitLevel("player");
local _Player_Percent_Health = ConROC:PercentHealth('player');
local _is_PvP = ConROC:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConROC:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConROC:PercentHealth('target');

--Resources
local _Mana, _Mana_Max = ConROC:PlayerPower('Mana');

--Conditions
local _Queue = 0;
local _is__is_moving = ConROC:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
local _enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
local _enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _Perception, _Perception_RDY = _, _;

function ConROC:Stats()
	_Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
	_Player_Level = UnitLevel("player");
	_Player_Percent_Health = ConROC:PercentHealth('player');
	_is_PvP = ConROC:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConROC:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConROC:PercentHealth('target');

	_Mana, _Mana_Max = ConROC:PlayerPower('Mana');

	_Queue = 0;
	_is_moving = ConROC:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
	_enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
	_enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
	_can_Execute = _Target_Percent_Health < 20;

	_Perception, _Perception_RDY = ConROC:AbilityReady(Racial.Perception, timeShift);
end

function ConROC.Paladin.Damage(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedSpells);
	ConROC:Stats();

--Abilities	
	local _BlessingofMight, _BlessingofMight_RDY = ConROC:AbilityReady(Ability.BlessingofMight, timeShift);
		local _BlessingofMight_BUFF = ConROC:Aura(_BlessingofMight, timeShift);
	local _BlessingofWisdom, _BlessingofWisdom_RDY = ConROC:AbilityReady(Ability.BlessingofWisdom, timeShift);
		local _BlessingofWisdom_BUFF = ConROC:Aura(_BlessingofWisdom, timeShift);
	local _BlessingofKings, _BlessingofKings_RDY = ConROC:AbilityReady(Ability.BlessingofKings, timeShift);
		local _BlessingofKings_BUFF = ConROC:Aura(_BlessingofKings, timeShift);
	local _GreaterBlessingofKings, _GreaterBlessingofKings_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofKings, timeShift);
		local _GreaterBlessingofKings_BUFF = ConROC:Aura(_GreaterBlessingofKings, timeShift);
	local _BlessingofSalvation, _BlessingofSalvation_RDY = ConROC:AbilityReady(Ability.BlessingofSalvation, timeShift);
		local _BlessingofSalvation_BUFF = ConROC:Aura(_BlessingofSalvation, timeShift);
	local _Consecration, _Consecration_RDY = ConROC:AbilityReady(Ability.Consecration, timeShift);
		local _Consecration_DUR = consecEXP - GetTime();
	local _HolyWrath, _HolyWrath_RDY = ConROC:AbilityReady(Ability.HolyWrath, timeShift);
	local _HolyShield, _HolyShield_RDY = ConROC:AbilityReady(Ability.HolyShield, timeShift);
	local _GreaterBlessingofSalvation, _GreaterBlessingofSalvation_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofSalvation, timeShift);
		local _GreaterBlessingofSalvation_BUFF = ConROC:Aura(_GreaterBlessingofSalvation, timeShift);
	local _BlessingofSanctuary, _BlessingofSanctuary_RDY = ConROC:AbilityReady(Ability.BlessingofSanctuary, timeShift);
		local _BlessingofSanctuary_BUFF = ConROC:Aura(_BlessingofSanctuary, timeShift);
	local _GreaterBlessingofSanctuary, _GreaterBlessingofSanctuary_RDY = ConROC:AbilityReady(Ability.GreaterBlessingofSanctuary, timeShift);
		local _GreaterBlessingofSanctuary_BUFF = ConROC:Aura(_GreaterBlessingofSanctuary, timeShift);

	local _BlessingofLight, _BlessingofLight_RDY = ConROC:AbilityReady(Ability.BlessingofLight, timeShift);
		local _BlessingofLight_BUFF = ConROC:Aura(_BlessingofLight, timeShift);
	local _Judgement, _Judgement_RDY, judgeCD, judgeMCD = ConROC:AbilityReady(Ability.Judgement, timeShift);
	local _SealoftheCrusader, _SealoftheCrusader_RDY = ConROC:AbilityReady(Ability.SealoftheCrusader, timeShift);
		local _SealoftheCrusader_BUFF = ConROC:Aura(_SealoftheCrusader, timeShift);
		local _JudgementoftheCrusader_DEBUFF = ConROC:TargetAura(Debuff.JudgementoftheCrusader, timeShift);
	local _SealofJustice, _SealofJustice_RDY = ConROC:AbilityReady(Ability.SealofJustice, timeShift);
		local _SealofJustice_BUFF = ConROC:Aura(_SealofJustice, timeShift);
		local _JudgementofJustice_DEBUFF = ConROC:TargetAura(Debuff.JudgementofJustice, timeShift);
	local _SealofLight, _SealofLight_RDY = ConROC:AbilityReady(Ability.SealofLight, timeShift);
		local _SealofLight_BUFF = ConROC:Aura(_SealofLight, timeShift);
		local _JudgementofLight_DEBUFF = ConROC:TargetAura(Debuff.JudgementofLight, timeShift);
	local _SealofWisdom, _SealofWisdom_RDY = ConROC:AbilityReady(Ability.SealofWisdom, timeShift);
		local _SealofWisdom_BUFF = ConROC:Aura(_SealofWisdom, timeShift);
		local _JudgementofWisdom_DEBUFF = ConROC:TargetAura(Debuff.JudgementofWisdom, timeShift);
	local _SealofRighteousness, _SealofRighteousness_RDY = ConROC:AbilityReady(Ability.SealofRighteousness, timeShift);
		local _SealofRighteousness_BUFF, _, _SealofRighteousness_DUR = ConROC:Aura(_SealofRighteousness, timeShift);
	local _SealofCommand, _SealofCommand_RDY = ConROC:AbilityReady(Ability.SealofCommand, timeShift);
		local _SealofCommand_BUFF = ConROC:Aura(_SealofCommand, timeShift);
	local _Exorcism, _Exorcism_RDY = ConROC:AbilityReady(Ability.Exorcism, timeShift);
	local _HammerofJustice, _HammerofJustice_RDY = ConROC:AbilityReady(Ability.HammerofJustice, timeShift);

--Runes
	local _AvengersShield, _AvengersShield_RDY = ConROC:AbilityReady(Runes.AvengersShield, timeShift);
	local _CrusaderStrike, _CrusaderStrike_RDY = ConROC:AbilityReady(Runes.CrusaderStrike, timeShift);
	local _DivineStorm, _DivineStorm_RDY = ConROC:AbilityReady(Runes.DivineStorm, timeShift);
	local _, _Exorcist_Passive = ConROC:AbilityReady(Runes.Exorcist, timeShift);
	local _HammeroftheRighteous, _HammeroftheRighteous_RDY = ConROC:AbilityReady(Runes.HammeroftheRighteous, timeShift);
	local _Rebuke, _Rebuke_RDY = ConROC:AbilityReady(Runes.Rebuke, timeShift);
	local _SealofMartyrdom, _SealofMartyrdom_RDY = ConROC:AbilityReady(Runes.SealofMartyrdom, timeShift);
		local _SealofMartyrdom_BUFF, _, _SealofMartyrdom_DUR = ConROC:Aura(_SealofMartyrdom, timeShift);
	local _ShieldoftheRighteousness, _ShieldoftheRighteousness_RDY = ConROC:AbilityReady(Runes.ShieldoftheRighteousness, timeShift);

	local _HornofLordaeron, _HornofLordaeron_RDY = ConROC:AbilityReady(Runes.HornofLordaeron, timeShift);
	local _BeaconofLight, _BeaconofLight_RDY = ConROC:AbilityReady(Runes.BeaconofLight, timeShift);
	local _InspirationExemplar, _InspirationExemplar_RDY = ConROC:AbilityReady(Runes.InspirationExemplar, timeShift);
	local _HandofReckoning, _HandofReckoning_RDY = ConROC:AbilityReady(Runes.HandofReckoning, timeShift);

--Conditions
	local _Can_Exorcist = ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon");
	local isAutoAttacking = IsPlayerAttacking("target");
	local twohandIDs = {1,5,6,8,10} --Two-Handed Axes, Two-Handed Maces, Polearms, Two-Handed Swords, Saves
	local has2HandID = ConROC:Equipped(twohandIDs, "MAINHANDSLOT")

	local judgeDebuff = {
		_JudgementoftheCrusader_DEBUFF,
        _JudgementofJustice_DEBUFF,
		_JudgementofLight_DEBUFF,
        _JudgementofWisdom_DEBUFF,
    }

	local judgeUp = false;
	for k, v in pairs(judgeDebuff) do
		if v then
			judgeUp = true;
			break
		end
	end

	if _Exorcist_Passive then
		_Can_Exorcist = true;
	end

--Indicators	
	ConROC:AbilityRaidBuffs(_BlessingofMight, ConROC:CheckBox(ConROC_SM_Bless_Might) and _BlessingofMight_RDY and not _BlessingofMight_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofWisdom, ConROC:CheckBox(ConROC_SM_Bless_Wisdom) and _BlessingofWisdom_RDY and not _BlessingofWisdom_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_Kings) and _BlessingofKings_RDY and not _BlessingofKings_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_GreaterKings) and _GreaterBlessingofKings_RDY and not _GreaterBlessingofKings_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_Salvation) and _BlessingofSalvation_RDY and not _BlessingofSalvation_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_GreaterSalvation) and _GreaterBlessingofSalvation_RDY and not _GreaterBlessingofSalvation_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_Sanctuary) and _BlessingofSanctuary_RDY and not _BlessingofSanctuary_BUFF);
	ConROC:AbilityRaidBuffs(_GreaterBlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_GreaterSanctuary) and _GreaterBlessingofSanctuary_RDY and not _GreaterBlessingofSanctuary_BUFF);
	ConROC:AbilityRaidBuffs(_BlessingofLight, ConROC:CheckBox(ConROC_SM_Bless_Light) and _BlessingofLight_RDY and not _BlessingofLight_BUFF);

    ConROC:AbilityInterrupt(_Rebuke, ConROC:Interrupt() and _Rebuke_RDY)

--Warnings

--Rotations
	repeat
		while(true) do
			if ConROC.Seasons.IsSoD then
				if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) and _SealoftheCrusader_RDY and not _SealoftheCrusader_BUFF and not _JudgementoftheCrusader_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealoftheCrusader);
					_SealoftheCrusader_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and _SealofJustice_RDY and not _SealofJustice_BUFF and not _JudgementofJustice_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealofJustice);
					_SealofJustice_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Judgement_Light) and _SealofLight_RDY and not _SealofLight_BUFF and not _JudgementofLight_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealofLight);
					_SealofLight_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and _SealofWisdom_RDY and not _SealofWisdom_BUFF and not _JudgementofWisdom_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealofWisdom);
					_SealofWisdom_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Judgement_RDY and not judgeUp then
					tinsert(ConROC.SuggestedSpells, _Judgement);
					_Judgement_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and _SealofRighteousness_RDY and (not _SealofRighteousness_BUFF or _SealofRighteousness_DUR <= 2) and not (_SealoftheCrusader_BUFF or _SealofMartyrdom_BUFF) then
					tinsert(ConROC.SuggestedSpells, _SealofRighteousness);
					_SealofRighteousness_BUFF = true;
					_SealofRighteousness_DUR = 30;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Seal_Command) and _SealofCommand_RDY and not _SealofCommand_BUFF then
					tinsert(ConROC.SuggestedSpells, _SealofCommand);
					_SealofCommand_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Seal_Martyrdom) and _SealofMartyrdom_RDY and not _SealofMartyrdom_BUFF then
					tinsert(ConROC.SuggestedSpells, _SealofMartyrdom);
					_SealofMartyrdom_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Seal_Crusader) and _SealoftheCrusader_RDY and not _SealoftheCrusader_BUFF and not _JudgementoftheCrusader_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealoftheCrusader);
					_SealoftheCrusader_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Seal_Justice) and _SealofJustice_RDY and not _SealofJustice_BUFF and not _JudgementofJustice_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealofJustice);
					_SealofJustice_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Seal_Light) and _SealofLight_RDY and not _SealofLight_BUFF and not _JudgementofLight_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealofLight);
					_SealofLight_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and _SealofWisdom_RDY and not _SealofWisdom_BUFF and not _JudgementofWisdom_DEBUFF and (judgeCD >= judgeMCD - 1) then
					tinsert(ConROC.SuggestedSpells, _SealofWisdom);
					_SealofWisdom_BUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if not ConROC:CheckBox(ConROC_SM_Role_Healer) or (ConROC:CheckBox(ConROC_SM_Role_Healer) and ConROC:TarHostile()) then
					if _HammeroftheRighteous_RDY then
						tinsert(ConROC.SuggestedSpells, _HammeroftheRighteous);
						_HammeroftheRighteous_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _ShieldoftheRighteousness_RDY and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
						tinsert(ConROC.SuggestedSpells, _ShieldoftheRighteousness);
						_ShieldoftheRighteousness_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if (ConROC_AoEButton:IsVisible() or _enemies_in_melee >= 3) and _DivineStorm_RDY then
						tinsert(ConROC.SuggestedSpells, _DivineStorm);
						_DivineStorm_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if (ConROC_AoEButton:IsVisible() or _enemies_in_melee >= 3) and _Consecration_RDY then
						tinsert(ConROC.SuggestedSpells, _Consecration);
						_Consecration_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if (ConROC_AoEButton:IsVisible() or _enemies_in_melee >= 3) and _HolyWrath_RDY then
						tinsert(ConROC.SuggestedSpells, _HolyWrath);
						_HolyWrath_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _Exorcism_RDY and _Can_Exorcist then
						tinsert(ConROC.SuggestedSpells, _Exorcism);
						_Exorcism_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _AvengersShield_RDY and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
						tinsert(ConROC.SuggestedSpells, _AvengersShield);
						_AvengersShield_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _CrusaderStrike_RDY then
						tinsert(ConROC.SuggestedSpells, _CrusaderStrike);
						_CrusaderStrike_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _DivineStorm_RDY then
						tinsert(ConROC.SuggestedSpells, _DivineStorm);
						_DivineStorm_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Stun_HammerofJustice) and _HammerofJustice_RDY then
						tinsert(ConROC.SuggestedSpells, _HammerofJustice);
						_HammerofJustice_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _Consecration_RDY then
						tinsert(ConROC.SuggestedSpells, _Consecration);
						_Consecration_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _Judgement_RDY then
						tinsert(ConROC.SuggestedSpells, _Judgement);
						_Judgement_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
				end
			else
				if (ConROC:CheckBox(ConROC_SM_Role_Healer) and ConROC:TarHostile()) or not ConROC:CheckBox(ConROC_SM_Role_Healer) then
					if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) and _SealoftheCrusader_RDY and not _SealoftheCrusader_BUFF and not _JudgementoftheCrusader_DEBUFF and (judgeCD >= judgeMCD - 1) then
						tinsert(ConROC.SuggestedSpells, _SealoftheCrusader);
						_SealoftheCrusader_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and _SealofJustice_RDY and not _SealofJustice_BUFF and not _JudgementofJustice_DEBUFF and (judgeCD >= judgeMCD - 1) then
						tinsert(ConROC.SuggestedSpells, _SealofJustice);
						_SealofJustice_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Judgement_Light) and _SealofLight_RDY and not _SealofLight_BUFF and not _JudgementofLight_DEBUFF and (judgeCD >= judgeMCD - 1) then
						tinsert(ConROC.SuggestedSpells, _SealofLight);
						_SealofLight_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and _SealofWisdom_RDY and not _SealofWisdom_BUFF and not _JudgementofWisdom_DEBUFF and (judgeCD >= judgeMCD - 1) then
						tinsert(ConROC.SuggestedSpells, _SealofWisdom);
						_SealofWisdom_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if _Judgement_RDY and not judgeUp then
						tinsert(ConROC.SuggestedSpells, _Judgement);
						_Judgement_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and _SealofRighteousness_RDY and not _SealofRighteousness_BUFF then
						tinsert(ConROC.SuggestedSpells, _SealofRighteousness);
						_SealofRighteousness_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Seal_Crusader) and _SealoftheCrusader_RDY and not _SealoftheCrusader_BUFF then
						tinsert(ConROC.SuggestedSpells, _SealoftheCrusader);
						_SealoftheCrusader_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Seal_Command) and _SealofCommand_RDY and not _SealofCommand_BUFF then
						tinsert(ConROC.SuggestedSpells, _SealofCommand);
						_SealofCommand_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Seal_Justice) and _SealofJustice_RDY and not _SealofJustice_BUFF then
						tinsert(ConROC.SuggestedSpells, _SealofJustice);
						_SealofJustice_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Seal_Light) and _SealofLight_RDY and not _SealofLight_BUFF then
						tinsert(ConROC.SuggestedSpells, _SealofLight);
						_SealofLight_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and _SealofWisdom_RDY and not _SealofWisdom_BUFF then
						tinsert(ConROC.SuggestedSpells, _SealofWisdom);
						_SealofWisdom_BUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if (ConROC_AoEButton:IsVisible() or _enemies_in_melee >= 3) and _Consecration_RDY then
						tinsert(ConROC.SuggestedSpells, _Consecration);
						_Consecration_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if (ConROC_AoEButton:IsVisible() or _enemies_in_melee >= 3) and _HolyWrath_RDY then
						tinsert(ConROC.SuggestedSpells, _HolyWrath);
						_HolyWrath_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Stun_HammerofJustice) and _HammerofJustice_RDY then
						tinsert(ConROC.SuggestedSpells, _HammerofJustice);
						_HammerofJustice_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _Exorcism_RDY and _Can_Exorcist then
						tinsert(ConROC.SuggestedSpells, _Exorcism);
						_Exorcism_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _Consecration_RDY then
						tinsert(ConROC.SuggestedSpells, _Consecration);
						_Consecration_RDY = false;
						_Queue = _Queue + 1;
						break;
					end

					if _Judgement_RDY then
						tinsert(ConROC.SuggestedSpells, _Judgement);
						_Judgement_RDY = false;
						_Queue = _Queue + 1;
						break;
					end
				end
			end

			tinsert(ConROC.SuggestedSpells, 26008); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
return nil;
end

function ConROC.Paladin.Defense(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedDefSpells);
	ConROC:Stats();

--Abilities	
	local _DevotionAura, _DevotionAura_RDY = ConROC:AbilityReady(Ability.DevotionAura, timeShift);
		local _DevotionAura_FORM = ConROC:Form(_DevotionAura);
	local _RetributionAura, _RetributionAura_RDY = ConROC:AbilityReady(Ability.RetributionAura, timeShift);
		local _RetributionAura_FORM = ConROC:Form(_RetributionAura);
	local _ConcentrationAura, _ConcentrationAura_RDY = ConROC:AbilityReady(Ability.ConcentrationAura, timeShift);
		local _ConcentrationAura_FORM = ConROC:Form(_ConcentrationAura);
	local _SanctityAura, _SanctityAura_RDY = ConROC:AbilityReady(Ability.SanctityAura, timeShift);
		local _SanctityAura_FORM = ConROC:Form(_SanctityAura);
	local _FireResistanceAura, _FireResistanceAura_RDY = ConROC:AbilityReady(Ability.FireResistanceAura, timeShift);
		local _FireResistanceAura_FORM = ConROC:Form(_FireResistanceAura);
	local _FrostResistanceAura, _FrostResistanceAura_RDY = ConROC:AbilityReady(Ability.FrostResistanceAura, timeShift);
		local _FrostResistanceAura_FORM = ConROC:Form(_FrostResistanceAura);
	local _ShadowResistanceAura, _ShadowResistanceAura_RDY = ConROC:AbilityReady(Ability.ShadowResistanceAura, timeShift);
		local _ShadowResistanceAura_FORM = ConROC:Form(_ShadowResistanceAura);

--Rotations
	if _DevotionAura_RDY and not _DevotionAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Devotion) then
		tinsert(ConROC.SuggestedDefSpells, _DevotionAura);
	end

	if _RetributionAura_RDY and not _RetributionAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Retribution) then
		tinsert(ConROC.SuggestedDefSpells, _RetributionAura);
	end

	if _ConcentrationAura_RDY and not _ConcentrationAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Concentration) then
		tinsert(ConROC.SuggestedDefSpells, _ConcentrationAura);
	end

	if _SanctityAura_RDY and not _SanctityAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_Sanctity) then
		tinsert(ConROC.SuggestedDefSpells, _SanctityAura);
	end

	if _FireResistanceAura_RDY and not _FireResistanceAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_FireResistance) then
		tinsert(ConROC.SuggestedDefSpells, _FireResistanceAura);
	end

	if _FrostResistanceAura_RDY and not _FrostResistanceAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_FrostResistance) then
		tinsert(ConROC.SuggestedDefSpells, _FrostResistanceAura);
	end

	if _ShadowResistanceAura_RDY and not _ShadowResistanceAura_FORM and ConROC:CheckBox(ConROC_SM_Aura_ShadowResistance) then
		tinsert(ConROC.SuggestedDefSpells, _ShadowResistanceAura);
	end
return nil;
end

function ConROC:JustCasted(spellID)
	if spellID == _Consecration then
		local expTime = GetTime() + 8;
		consecEXP = expTime;
	end
end
