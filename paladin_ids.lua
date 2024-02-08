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
--Holy
	ids.Holy_Ability = {
		BlessingofLightRank1 = 19977,
		BlessingofLightRank2 = 19978,
		BlessingofLightRank3 = 19979,
		BlessingofWisdomRank1 = 19742,
		BlessingofWisdomRank2 = 19850,
		BlessingofWisdomRank3 = 19852,
		BlessingofWisdomRank4 = 19853,
		BlessingofWisdomRank5 = 19854,
		BlessingofWisdomRank6 = 25290,
		Cleanse = 4987,
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
		GreaterBlessingofLightRank1 = 25890,
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
		Purify = 1152,
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
		SenseUndead = 5502,
		TurnUndeadRank1 = 2878,
		TurnUndeadRank2 = 5627,
		TurnUndeadRank3 = 10326,
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
--Protection
	ids.Prot_Ability = {
		BlessingofFreedom = 1044,
		BlessingofKings = 20217,
		BlessingofProtectionRank1 = 1022,
		BlessingofProtectionRank2 = 5599,
		BlessingofProtectionRank3 = 10278,
		BlessingofSacrificeRank1 = 6940,
		BlessingofSacrificeRank2 = 20729,
		BlessingofSalvation = 1038,
		BlessingofSanctuaryRank1 = 20911,
		BlessingofSanctuaryRank2 = 20912,
		BlessingofSanctuaryRank3 = 20913,
		BlessingofSanctuaryRank4 = 20914,
		ConcentrationAura = 19746,
		DivineIntervention = 19752,
		DivineProtectionRank1 = 498,
		DivineProtectionRank2 = 5573,
		DivineShieldRank1 = 642,
		DivineShieldRank2 = 1020,
		GreaterBlessingofKings = 25898,
		GreaterBlessingofSalvation = 25895,
		GreaterBlessingofSanctuary = 25899,
		HammerofJusticeRank1 = 853,
		HammerofJusticeRank2 = 5588,
		HammerofJusticeRank3 = 5589,
		HammerofJusticeRank4 = 10308,
		HolyShieldRank1 = 20925,
		HolyShieldRank2 = 20927,
		HolyShieldRank3 = 20928,
		RighteousFury = 25780,
		SealofJustice = 20164,
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
--Retribution
	ids.Ret_Ability = {
		BlessingofMightRank1 = 19740,
		BlessingofMightRank2 = 19834,
		BlessingofMightRank3 = 19835,
		BlessingofMightRank4 = 19836,
		BlessingofMightRank5 = 19837,
		BlessingofMightRank6 = 19838,
		GreaterBlessingofMightRank1 = 25782,
		GreaterBlessingofMightRank2 = 25916,
		Judgement = 20271,
		Repentance = 20066,
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
	ids.Player_Auras = {
		ConcentrationAura = 19746,
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
		SanctityAura = 20218,
		ShadowResistanceAuraRank1 = 19876,
		ShadowResistanceAuraRank2 = 19875,
		ShadowResistanceAuraRank3 = 19896,
	}
	ids.Player_Buff = {
	}
	ids.Player_Debuff = {
		Forbearance = 25771,	
	}
	ids.Target_Debuff = {
		JudgementoftheCrusaderRank1 = 21183,	
		JudgementoftheCrusaderRank2 = 20188,
		JudgementoftheCrusaderRank3 = 20300,
		JudgementoftheCrusaderRank4 = 20301,
		JudgementoftheCrusaderRank5 = 20302,
		JudgementoftheCrusaderRank6 = 20303,
		JudgementofJustice = 20184,
		JudgementofLightRank1 = 20185,
		JudgementofLightRank2 = 20344,
		JudgementofLightRank3 = 20345,
		JudgementofLightRank4 = 20346,
		JudgementofWisdomRank1 = 20186,
		JudgementofWisdomRank2 = 20354,
		JudgementofWisdomRank3 = 20355,
	}
