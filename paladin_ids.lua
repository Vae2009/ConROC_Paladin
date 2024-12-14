local ConROC_Paladin, ids = ...;

--General
ids.Racial = {
	Perception = 20600,
}
ids.Spec = {
	Holy = 1,
	Protection = 2,
	Retribution = 3,
}
ids.Ability = {
--Holy
	BlessingofLight = 19977,
	BlessingofWisdom = 19742,
	Cleanse = 4987,
	Consecration = 26573,
	Exorcism = 879,
	FlashofLight = 19750,
	GreaterBlessingofLight = 25890,
	GreaterBlessingofWisdom = 25894,
	HammerofWrath = 24275,
	HolyLight = 635,
	HolyShock = 20473,
	HolyWrath = 2812,
	LayonHands = 633,
	Purify = 1152,
	Redemption = 7328,
	SealofLight = 20165,
	SealofRighteousness = 20154,
	SealofWisdom = 20166,
	SenseUndead = 5502,
	TurnUndead = 2878,
--Protection
	BlessingofFreedom = 1044,
	BlessingofKings = 20217,
	BlessingofProtection = 1022,
	BlessingofSacrifice = 6940,
	BlessingofSalvation = 1038,
	BlessingofSanctuary = 20911,
	ConcentrationAura = 19746,
	DivineIntervention = 19752,
	DivineProtection = 498,
	DivineShield = 642,
	GreaterBlessingofKings = 25898,
	GreaterBlessingofSalvation = 25895,
	GreaterBlessingofSanctuary = 25899,
	HammerofJustice = 853,
	HolyShield = 20925,
	RighteousFury = 25780,
	SealofJustice = 20164,
--Retribution
	BlessingofMight = 19740,
	GreaterBlessingofMight = 25782,
	Judgement = 20271,
	Repentance = 20066,
	SealofCommand = 20375,
	SealoftheCrusader = 21082,
--Auras
	DevotionAura = 465,
	FireResistanceAura = 19891,
	FrostResistanceAura = 19888,
	RetributionAura = 7294,
	SanctityAura = 20218,
	ShadowResistanceAura = 19876,
}
ids.Rank = {
--Holy
	BlessingofLightRank1 = 19977,
	BlessingofLightRank2 = 19978,
	BlessingofLightRank3 = 19979,
	BlessingofWisdomRank1 = 19742,
	BlessingofWisdomRank2 = 19850,
	BlessingofWisdomRank3 = 19852,
	BlessingofWisdomRank4 = 19853,
	BlessingofWisdomRank5 = 19854,
	BlessingofWisdomRank6 = 25290,
	ConsecrationRank1 = 26573,
	ConsecrationRank2 = 20116,
	ConsecrationRank3 = 20922,
	ConsecrationRank4 = 20923,
	ConsecrationRank5 = 20924,
	ExorcismRank1 = 879,
	ExorcismRank2 = 5614,
	ExorcismRank3 = 5615,
	ExorcismRank4 = 10312,
	ExorcismRank5 = 10313,
	ExorcismRank6 = 10314,
	FlashofLightRank1 = 19750,
	FlashofLightRank2 = 19939,
	FlashofLightRank3 = 19940,
	FlashofLightRank4 = 19941,
	FlashofLightRank5 = 19942,
	FlashofLightRank6 = 19943,
	GreaterBlessingofWisdomRank1 = 25894,
	GreaterBlessingofWisdomRank2 = 25918,
	HammerofWrathRank1 = 24275,
	HammerofWrathRank2 = 24274,
	HammerofWrathRank3 = 24239,
	HolyLightRank1 = 635,
	HolyLightRank2 = 639,
	HolyLightRank3 = 647,
	HolyLightRank4 = 1026,
	HolyLightRank5 = 1042,
	HolyLightRank6 = 3472,
	HolyLightRank7 = 10328,
	HolyLightRank8 = 10329,
	HolyShockRank1 = 20473,
	HolyShockRank2 = 20929,
	HolyShockRank3 = 20930,
	HolyWrathRank1 = 2812,
	HolyWrathRank2 = 10318,
	LayonHandsRank1 = 633,
	LayonHandsRank2 = 2800,
	LayonHandsRank3 = 10310,
	RedemptionRank1 = 7328,
	RedemptionRank2 = 10322,
	RedemptionRank3 = 10324,
	RedemptionRank4 = 20772,
	RedemptionRank5 = 20773,
	SealofLightRank1 = 20165,
	SealofLightRank2 = 20347,
	SealofLightRank3 = 20348,
	SealofLightRank4 = 20349,
	SealofRighteousnessRank0 = 20154,
	SealofRighteousnessRank1 = 21084,
	SealofRighteousnessRank2 = 20287,
	SealofRighteousnessRank3 = 20288,
	SealofRighteousnessRank4 = 20289,
	SealofRighteousnessRank5 = 20290,
	SealofRighteousnessRank6 = 20291,
	SealofRighteousnessRank7 = 20292,
	SealofRighteousnessRank8 = 20293,
	SealofWisdomRank1 = 20166,
	SealofWisdomRank2 = 20356,
	SealofWisdomRank3 = 20357,
	TurnUndeadRank1 = 2878,
	TurnUndeadRank2 = 5627,
	TurnUndeadRank3 = 10326,
--Protection
	BlessingofProtectionRank1 = 1022,
	BlessingofProtectionRank2 = 5599,
	BlessingofProtectionRank3 = 10278,
	BlessingofSacrificeRank1 = 6940,
	BlessingofSacrificeRank2 = 20729,
	BlessingofSanctuaryRank1 = 20911,
	BlessingofSanctuaryRank2 = 20912,
	BlessingofSanctuaryRank3 = 20913,
	BlessingofSanctuaryRank4 = 20914,
	DivineProtectionRank1 = 498,
	DivineProtectionRank2 = 5573,
	DivineShieldRank1 = 642,
	DivineShieldRank2 = 1020,
	HammerofJusticeRank1 = 853,
	HammerofJusticeRank2 = 5588,
	HammerofJusticeRank3 = 5589,
	HammerofJusticeRank4 = 10308,
	HolyShieldRank1 = 20925,
	HolyShieldRank2 = 20927,
	HolyShieldRank3 = 20928,
--Retribution
	BlessingofMightRank1 = 19740,
	BlessingofMightRank2 = 19834,
	BlessingofMightRank3 = 19835,
	BlessingofMightRank4 = 19836,
	BlessingofMightRank5 = 19837,
	BlessingofMightRank6 = 19838,
	GreaterBlessingofMightRank1 = 25782,
	GreaterBlessingofMightRank2 = 25916,
	SealofCommandRank1 = 20375,
	SealofCommandRank2 = 20915,
	SealofCommandRank3 = 20918,
	SealofCommandRank4 = 20919,
	SealofCommandRank5 = 20920,
	SealoftheCrusaderRank1 = 21082,
	SealoftheCrusaderRank2 = 20162,
	SealoftheCrusaderRank3 = 20305,
	SealoftheCrusaderRank4 = 20306,
	SealoftheCrusaderRank5 = 20307,
	SealoftheCrusaderRank6 = 20308,
--Auras
	DevotionAuraRank1 = 465,
	DevotionAuraRank2 = 10290,
	DevotionAuraRank3 = 643,
	DevotionAuraRank4 = 10291,
	DevotionAuraRank5 = 1032,
	DevotionAuraRank6 = 10292,
	DevotionAuraRank7 = 10293,
	FireResistanceAuraRank1 = 19891,
	FireResistanceAuraRank2 = 19899,
	FireResistanceAuraRank3 = 19900,
	FrostResistanceAuraRank1 = 19888,
	FrostResistanceAuraRank2 = 19897,
	FrostResistanceAuraRank3 = 19898,
	RetributionAuraRank1 = 7294,
	RetributionAuraRank2 = 10298,
	RetributionAuraRank3 = 10299,
	RetributionAuraRank4 = 10300,
	RetributionAuraRank5 = 10301,
	ShadowResistanceAuraRank1 = 19876,
	ShadowResistanceAuraRank2 = 19875,
	ShadowResistanceAuraRank3 = 19896,
	JudgementoftheCrusaderRank1 = 21183,
	JudgementoftheCrusaderRank2 = 20188,
	JudgementoftheCrusaderRank3 = 20300,
	JudgementoftheCrusaderRank4 = 20301,
	JudgementoftheCrusaderRank5 = 20302,
	JudgementoftheCrusaderRank6 = 20303,
	JudgementofLightRank1 = 20185,
	JudgementofLightRank2 = 20344,
	JudgementofLightRank3 = 20345,
	JudgementofLightRank4 = 20346,
	JudgementofWisdomRank1 = 20186,
	JudgementofWisdomRank2 = 20354,
	JudgementofWisdomRank3 = 20355,
}
ids.Holy_Talent = {
	SpiritualFocus =  1,
	DivineFavor =  2,
	Consecration =  3,
	ImprovedLayonHands =  4,
	HealingLight =  5,
	ImprovedBlessingofWisdom =  6,
	DivineIntellect =  7,
	DivineStrength =  8,
	Illumination =  9,
	ImprovedSealofRighteousness =  10,
	LastingJudgement =  11,
	HolyShock =  12,
	HolyPower =  13,
	UnyieldingFaith =  14,
}
ids.Protection_Talent = {
	Redoubt =  1,
	ImprovedDevotionAura =  2,
	Toughness =  3,
	ShieldSpecialization =  4,
	GuardiansFavor =  5,
	Reckoning =  6,
	OneHandedWeaponSpecialization =  7,
	HolyShield =  8,
	BlessingofSanctuary =  9,
	BlessingofKings =  10,
	ImprovedRighteousFury =  11,
	ImprovedHammerofJustice =  12,
	ImprovedConcentrationAura =  13,
	Anticipation =  14,
	Precision =  15,
} 
ids.Retribution_Talent = { 
	ImprovedBlessingofMight =  1,
	Vengeance =  2,
	Deflection =  3,
	ImprovedRetributionAura =  4,
	Benediction =  5,
	SanctityAura =  6,
	TwoHandedWeaponSpecialization =  7,
	Conviction =  8,
	Repentance =  9,
	ImprovedSealoftheCrusader =  10,
	SealofCommand =  11,
	ImprovedJudgement =  12,
	EyeforanEye =  13,
	Vindication =  14,
	PursuitofJustice =  15,
}
ids.Runes = {
	DivineStorm = 407778,
	HornofLordaeron = 425600,
	SealofMartyrdom = 407798,
	BeaconofLight = 407613,
	CrusaderStrike = 407676,
	InspirationExemplar = 407880,
	HandofReckoning = 407631,
	AvengersShield = 407669,
	DivineSacrifice = 407804,
	Rebuke = 425609,
	Exorcist = 415756,
	SheathofLight = 426158, --Phase 2 -passive
	GuardedbytheLight = 415755, --Phase 2 -passive
}
-- Auras
ids.Buff = {

}
ids.Debuff = {
	Forbearance = 25771,
	JudgementoftheCrusader = 21183,
	JudgementofJustice = 20184,
	JudgementofLight = 20185,
	JudgementofWisdom = 20186,
}

function ConROC:UpdateSpellID()
	--Holy
	if IsSpellKnown(ids.Rank.BlessingofLightRank3) then ids.Ability.BlessingofLight = ids.Rank.BlessingofLightRank3;
	elseif IsSpellKnown(ids.Rank.BlessingofLightRank2) then ids.Ability.BlessingofLight = ids.Rank.BlessingofLightRank2; end

	if IsSpellKnown(ids.Rank.BlessingofWisdomRank6) then ids.Ability.BlessingofWisdom = ids.Rank.BlessingofWisdomRank6;
	elseif IsSpellKnown(ids.Rank.BlessingofWisdomRank5) then ids.Ability.BlessingofWisdom = ids.Rank.BlessingofWisdomRank5;
	elseif IsSpellKnown(ids.Rank.BlessingofWisdomRank4) then ids.Ability.BlessingofWisdom = ids.Rank.BlessingofWisdomRank4;
	elseif IsSpellKnown(ids.Rank.BlessingofWisdomRank3) then ids.Ability.BlessingofWisdom = ids.Rank.BlessingofWisdomRank3;
	elseif IsSpellKnown(ids.Rank.BlessingofWisdomRank2) then ids.Ability.BlessingofWisdom = ids.Rank.BlessingofWisdomRank2; end

	if IsSpellKnown(ids.Rank.ConsecrationRank5) then ids.Ability.Consecration = ids.Rank.ConsecrationRank5;
	elseif IsSpellKnown(ids.Rank.ConsecrationRank4) then ids.Ability.Consecration = ids.Rank.ConsecrationRank4;
	elseif IsSpellKnown(ids.Rank.ConsecrationRank3) then ids.Ability.Consecration = ids.Rank.ConsecrationRank3;
	elseif IsSpellKnown(ids.Rank.ConsecrationRank2) then ids.Ability.Consecration = ids.Rank.ConsecrationRank2; end

	if IsSpellKnown(ids.Rank.ExorcismRank6) then ids.Ability.Exorcism = ids.Rank.ExorcismRank6;
	elseif IsSpellKnown(ids.Rank.ExorcismRank5) then ids.Ability.Exorcism = ids.Rank.ExorcismRank5;
	elseif IsSpellKnown(ids.Rank.ExorcismRank4) then ids.Ability.Exorcism = ids.Rank.ExorcismRank4;
	elseif IsSpellKnown(ids.Rank.ExorcismRank3) then ids.Ability.Exorcism = ids.Rank.ExorcismRank3;
	elseif IsSpellKnown(ids.Rank.ExorcismRank2) then ids.Ability.Exorcism = ids.Rank.ExorcismRank2; end

	if IsSpellKnown(ids.Rank.FlashofLightRank6) then ids.Ability.FlashofLight = ids.Rank.FlashofLightRank6;
	elseif IsSpellKnown(ids.Rank.FlashofLightRank5) then ids.Ability.FlashofLight = ids.Rank.FlashofLightRank5;
	elseif IsSpellKnown(ids.Rank.FlashofLightRank4) then ids.Ability.FlashofLight = ids.Rank.FlashofLightRank4;
	elseif IsSpellKnown(ids.Rank.FlashofLightRank3) then ids.Ability.FlashofLight = ids.Rank.FlashofLightRank3;
	elseif IsSpellKnown(ids.Rank.FlashofLightRank2) then ids.Ability.FlashofLight = ids.Rank.FlashofLightRank2; end

	if IsSpellKnown(ids.Rank.GreaterBlessingofWisdomRank2) then ids.Ability.GreaterBlessingofWisdom = ids.Rank.GreaterBlessingofWisdomRank2; end

	if IsSpellKnown(ids.Rank.HammerofWrathRank3) then ids.Ability.HammerofWrath = ids.Rank.HammerofWrathRank3;
	elseif IsSpellKnown(ids.Rank.HammerofWrathRank2) then ids.Ability.HammerofWrath = ids.Rank.HammerofWrathRank2; end

	if IsSpellKnown(ids.Rank.HolyLightRank8) then ids.Ability.HolyLight = ids.Rank.HolyLightRank8;
	elseif IsSpellKnown(ids.Rank.HolyLightRank7) then ids.Ability.HolyLight = ids.Rank.HolyLightRank7;
	elseif IsSpellKnown(ids.Rank.HolyLightRank6) then ids.Ability.HolyLight = ids.Rank.HolyLightRank6;
	elseif IsSpellKnown(ids.Rank.HolyLightRank5) then ids.Ability.HolyLight = ids.Rank.HolyLightRank5;
	elseif IsSpellKnown(ids.Rank.HolyLightRank4) then ids.Ability.HolyLight = ids.Rank.HolyLightRank4;
	elseif IsSpellKnown(ids.Rank.HolyLightRank3) then ids.Ability.HolyLight = ids.Rank.HolyLightRank3;
	elseif IsSpellKnown(ids.Rank.HolyLightRank2) then ids.Ability.HolyLight = ids.Rank.HolyLightRank2; end

	if IsSpellKnown(ids.Rank.HolyShockRank3) then ids.Ability.HolyShock = ids.Rank.HolyShockRank3;
	elseif IsSpellKnown(ids.Rank.HolyShockRank2) then ids.Ability.HolyShock = ids.Rank.HolyShockRank2; end

	if IsSpellKnown(ids.Rank.HolyWrathRank2) then ids.Ability.HolyWrath = ids.Rank.HolyWrathRank2; end

	if IsSpellKnown(ids.Rank.SealofLightRank4) then ids.Ability.SealofLight = ids.Rank.SealofLightRank4; ids.Debuff.JudgementofLight = ids.Rank.JudgementofLightRank4;
	elseif IsSpellKnown(ids.Rank.SealofLightRank3) then ids.Ability.SealofLight = ids.Rank.SealofLightRank3; ids.Debuff.JudgementofLight = ids.Rank.JudgementofLightRank3;
	elseif IsSpellKnown(ids.Rank.SealofLightRank2) then ids.Ability.SealofLight = ids.Rank.SealofLightRank2; ids.Debuff.JudgementofLight = ids.Rank.JudgementofLightRank2; end

	if IsSpellKnown(ids.Rank.SealofRighteousnessRank8) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank8;
	elseif IsSpellKnown(ids.Rank.SealofRighteousnessRank7) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank7;
	elseif IsSpellKnown(ids.Rank.SealofRighteousnessRank6) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank6;
	elseif IsSpellKnown(ids.Rank.SealofRighteousnessRank5) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank5;
	elseif IsSpellKnown(ids.Rank.SealofRighteousnessRank4) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank4;
	elseif IsSpellKnown(ids.Rank.SealofRighteousnessRank3) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank3;
	elseif IsSpellKnown(ids.Rank.SealofRighteousnessRank2) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank2;
	elseif IsSpellKnown(ids.Rank.SealofRighteousnessRank1) then ids.Ability.SealofRighteousness = ids.Rank.SealofRighteousnessRank1; end

	if IsSpellKnown(ids.Rank.SealofWisdomRank3) then ids.Ability.SealofWisdom = ids.Rank.SealofWisdomRank3; ids.Debuff.JudgementofWisdom = ids.Rank.JudgementofWisdomRank3;
	elseif IsSpellKnown(ids.Rank.SealofWisdomRank2) then ids.Ability.SealofWisdom = ids.Rank.SealofWisdomRank2; ids.Debuff.JudgementofWisdom = ids.Rank.JudgementofWisdomRank2; end

	if IsSpellKnown(ids.Rank.TurnUndeadRank3) then ids.Ability.TurnUndead = ids.Rank.TurnUndeadRank3;
	elseif IsSpellKnown(ids.Rank.TurnUndeadRank2) then ids.Ability.TurnUndead = ids.Rank.TurnUndeadRank2;end

	--Protection
	if IsSpellKnown(ids.Rank.BlessingofProtectionRank3) then ids.Ability.BlessingofProtection = ids.Rank.BlessingofProtectionRank3;
	elseif IsSpellKnown(ids.Rank.BlessingofProtectionRank2) then ids.Ability.BlessingofProtection = ids.Rank.BlessingofProtectionRank2; end

	if IsSpellKnown(ids.Rank.BlessingofSacrificeRank2) then ids.Ability.BlessingofSacrifice = ids.Rank.BlessingofSacrificeRank2; end

	if IsSpellKnown(ids.Rank.BlessingofSanctuaryRank4) then ids.Ability.BlessingofSanctuary = ids.Rank.BlessingofSanctuaryRank4;
	elseif IsSpellKnown(ids.Rank.BlessingofSanctuaryRank3) then ids.Ability.BlessingofSanctuary = ids.Rank.BlessingofSanctuaryRank3;
	elseif IsSpellKnown(ids.Rank.BlessingofSanctuaryRank2) then ids.Ability.BlessingofSanctuary = ids.Rank.BlessingofSanctuaryRank2; end

	if IsSpellKnown(ids.Rank.DivineProtectionRank2) then ids.Ability.DivineProtection = ids.Rank.DivineProtectionRank2; end

	if IsSpellKnown(ids.Rank.DivineShieldRank2) then ids.Ability.DivineShield = ids.Rank.DivineShieldRank2; end

	if IsSpellKnown(ids.Rank.HammerofJusticeRank4) then ids.Ability.HammerofJustice = ids.Rank.HammerofJusticeRank4;
	elseif IsSpellKnown(ids.Rank.HammerofJusticeRank3) then ids.Ability.HammerofJustice = ids.Rank.HammerofJusticeRank3;
	elseif IsSpellKnown(ids.Rank.HammerofJusticeRank2) then ids.Ability.HammerofJustice = ids.Rank.HammerofJusticeRank2; end

	if IsSpellKnown(ids.Rank.HolyShieldRank3) then ids.Ability.HolyShield = ids.Rank.HolyShieldRank3;
	elseif IsSpellKnown(ids.Rank.HolyShieldRank2) then ids.Ability.HolyShield = ids.Rank.HolyShieldRank2; end

	--Retribution
	if IsSpellKnown(ids.Rank.BlessingofMightRank6) then ids.Ability.BlessingofMight = ids.Rank.BlessingofMightRank6;
	elseif IsSpellKnown(ids.Rank.BlessingofMightRank5) then ids.Ability.BlessingofMight = ids.Rank.BlessingofMightRank5;
	elseif IsSpellKnown(ids.Rank.BlessingofMightRank4) then ids.Ability.BlessingofMight = ids.Rank.BlessingofMightRank4;
	elseif IsSpellKnown(ids.Rank.BlessingofMightRank3) then ids.Ability.BlessingofMight = ids.Rank.BlessingofMightRank3;
	elseif IsSpellKnown(ids.Rank.BlessingofMightRank2) then ids.Ability.BlessingofMight = ids.Rank.BlessingofMightRank2; end

	if IsSpellKnown(ids.Rank.GreaterBlessingofMightRank2) then ids.Ability.GreaterBlessingofMight = ids.Rank.GreaterBlessingofMightRank2; end

	if IsSpellKnown(ids.Rank.SealofCommandRank5) then ids.Ability.SealofCommand = ids.Rank.SealofCommandRank5;
	elseif IsSpellKnown(ids.Rank.SealofCommandRank4) then ids.Ability.SealofCommand = ids.Rank.SealofCommandRank4;
	elseif IsSpellKnown(ids.Rank.SealofCommandRank3) then ids.Ability.SealofCommand = ids.Rank.SealofCommandRank3;
	elseif IsSpellKnown(ids.Rank.SealofCommandRank2) then ids.Ability.SealofCommand = ids.Rank.SealofCommandRank2; end

	if IsSpellKnown(ids.Rank.SealoftheCrusaderRank6) then ids.Ability.SealoftheCrusader = ids.Rank.SealoftheCrusaderRank6; ids.Debuff.JudgementoftheCrusader = ids.Rank.JudgementoftheCrusaderRank6;
	elseif IsSpellKnown(ids.Rank.SealoftheCrusaderRank5) then ids.Ability.SealoftheCrusader = ids.Rank.SealoftheCrusaderRank5; ids.Debuff.JudgementoftheCrusader = ids.Rank.JudgementoftheCrusaderRank5;
	elseif IsSpellKnown(ids.Rank.SealoftheCrusaderRank4) then ids.Ability.SealoftheCrusader = ids.Rank.SealoftheCrusaderRank4; ids.Debuff.JudgementoftheCrusader = ids.Rank.JudgementoftheCrusaderRank4;
	elseif IsSpellKnown(ids.Rank.SealoftheCrusaderRank3) then ids.Ability.SealoftheCrusader = ids.Rank.SealoftheCrusaderRank3; ids.Debuff.JudgementoftheCrusader = ids.Rank.JudgementoftheCrusaderRank3;
	elseif IsSpellKnown(ids.Rank.SealoftheCrusaderRank2) then ids.Ability.SealoftheCrusader = ids.Rank.SealoftheCrusaderRank2; ids.Debuff.JudgementoftheCrusader = ids.Rank.JudgementoftheCrusaderRank2; end

	--Auras
	if IsSpellKnown(ids.Rank.DevotionAuraRank7) then ids.Ability.DevotionAura = ids.Rank.DevotionAuraRank7;
	elseif IsSpellKnown(ids.Rank.DevotionAuraRank6) then ids.Ability.DevotionAura = ids.Rank.DevotionAuraRank6;
	elseif IsSpellKnown(ids.Rank.DevotionAuraRank5) then ids.Ability.DevotionAura = ids.Rank.DevotionAuraRank5;
	elseif IsSpellKnown(ids.Rank.DevotionAuraRank4) then ids.Ability.DevotionAura = ids.Rank.DevotionAuraRank4;
	elseif IsSpellKnown(ids.Rank.DevotionAuraRank3) then ids.Ability.DevotionAura = ids.Rank.DevotionAuraRank3;
	elseif IsSpellKnown(ids.Rank.DevotionAuraRank2) then ids.Ability.DevotionAura = ids.Rank.DevotionAuraRank2; end

	if IsSpellKnown(ids.Rank.FireResistanceAuraRank3) then ids.Ability.FireResistanceAura = ids.Rank.FireResistanceAuraRank3;
	elseif IsSpellKnown(ids.Rank.FireResistanceAuraRank2) then ids.Ability.FireResistanceAura = ids.Rank.FireResistanceAuraRank2; end

	if IsSpellKnown(ids.Rank.FrostResistanceAuraRank3) then ids.Ability.FrostResistanceAura = ids.Rank.FrostResistanceAuraRank3;	
	elseif IsSpellKnown(ids.Rank.FrostResistanceAuraRank2) then ids.Ability.FrostResistanceAura = ids.Rank.FrostResistanceAuraRank2; end

	if IsSpellKnown(ids.Rank.ShadowResistanceAuraRank3) then ids.Ability.ShadowResistanceAura = ids.Rank.ShadowResistanceAuraRank3;
	elseif IsSpellKnown(ids.Rank.ShadowResistanceAuraRank2) then ids.Ability.ShadowResistanceAura = ids.Rank.ShadowResistanceAuraRank2; end

	if IsSpellKnown(ids.Rank.RetributionAuraRank5) then ids.Ability.RetributionAura = ids.Rank.RetributionAuraRank5;
	elseif IsSpellKnown(ids.Rank.RetributionAuraRank4) then ids.Ability.RetributionAura = ids.Rank.RetributionAuraRank4;
	elseif IsSpellKnown(ids.Rank.RetributionAuraRank3) then ids.Ability.RetributionAura = ids.Rank.RetributionAuraRank3;
	elseif IsSpellKnown(ids.Rank.RetributionAuraRank2) then ids.Ability.RetributionAura = ids.Rank.RetributionAuraRank2; end
end