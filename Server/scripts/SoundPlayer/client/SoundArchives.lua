class 'SoundArchives'
function SoundArchives:LoadSounds()
	local archive = {
[1] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " AR_LowRate",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " AR_MidRate",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " AR_HighRate",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " MG_LowRate",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " MG_MidRate",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " MG_HighRate",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " SMG_LowRate",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "velocity",
                        },
                },
                ["name"] = " MiniGun_Fire",
        },
        [9] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " SMG_MidRate",
        },
        [10] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " FLAK",
        },
        [11] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sentry_Loop",
        },
        [12] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "velocity",
                        },
                },
                ["name"] = " Vulcan_Fire",
        },
        [13] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SMG_HighRate",
        },
        [14] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 45,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "variation2",
                        },
                },
                ["name"] = " DLC_Airzooka",
        },
        [15] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "velocity",
                        },
                },
                ["name"] = " MiniGun_Motor",
        },
        [16] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " MiniGun_Motor_Start",
        },
        [17] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " MiniGun_Motor_Stop",
        },
        [18] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Vulcan_Motor_Start",
        },
        [19] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Vulcan_Motor_Stop",
        },
        [20] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "velocity",
                        },
                },
                ["name"] = " Vulcan_Motor",
        },
},
[2] = {
        [1] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "distance",
                        },
                },
                ["name"] = " 1",
        },
        [2] = {
                ["index"] = 2,
                ["parameters"] = {
                },
                ["name"] = " 2",
        },
        [3] = {
                ["index"] = 3,
                ["parameters"] = {
                },
                ["name"] = " 3",
        },
        [4] = {
                ["index"] = 4,
                ["parameters"] = {
                },
                ["name"] = " 4",
        },
        [5] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " SignatureGun_Shot",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Pistol_Shot",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Shotgun_Shot",
        },
        [8] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Rocket Launcher Shot",
        },
        [9] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Rocket Launcher Loop",
        },
        [10] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mounted Cannon_Shot",
        },
        [11] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sniper",
        },
        [12] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SAM_Shot",
        },
        [13] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SawedOff Shotgun",
        },
        [14] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Grenade Launcher",
        },
        [15] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 15 - Missile AI Loop",
        },
        [16] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "distance",
                        },
                },
                ["name"] = " Single_Click",
        },
},
[3] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "hardness",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Shell",
        },
},
[4] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SlapBack_OpenField_FarOff",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " EarlyReflection_AR_Ridge",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " EarlyReflection_MiniGun_Ridge",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " EarlyReflection_SMG_Ridge",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " EarlyReflection_Sentry_Ridge",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " EarlyReflection_Sniper_Ridge",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " EarlyReflection_Cannon/FLAK_Ridge",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Revolver_Acoustics",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2000,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "automation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " DLC_Airzooka_slap",
        },
},
[5] = {
        [1] = {
                ["index"] = 1,
                ["parameters"] = {
                },
                ["name"] = " 1",
        },
        [2] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 42,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Chassi Wind",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 42,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Chassi Wind & Noise",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "length_difference_per_frame",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " suspension",
        },
},
[6] = {
        [1] = {
                ["index"] = 11,
                ["parameters"] = {
                },
                ["name"] = " 11",
        },
        [2] = {
                ["index"] = 12,
                ["parameters"] = {
                },
                ["name"] = " 12",
        },
        [3] = {
                ["index"] = 13,
                ["parameters"] = {
                },
                ["name"] = " 13",
        },
        [4] = {
                ["index"] = 17,
                ["parameters"] = {
                },
                ["name"] = " 17",
        },
        [5] = {
                ["index"] = 81,
                ["parameters"] = {
                },
                ["name"] = " 62",
        },
        [6] = {
                ["index"] = 82,
                ["parameters"] = {
                },
                ["name"] = " 63",
        },
        [7] = {
                ["index"] = 83,
                ["parameters"] = {
                },
                ["name"] = " 64",
        },
        [8] = {
                ["index"] = 97,
                ["parameters"] = {
                },
                ["name"] = " 78",
        },
        [9] = {
                ["index"] = 98,
                ["parameters"] = {
                },
                ["name"] = " 79",
        },
        [10] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Hummer Engine",
        },
        [11] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "oneshot",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Hummer Engine Bludder",
        },
        [12] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Hummer Start",
        },
        [13] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Hummer Stop",
        },
        [14] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " BigTruck Engine",
        },
        [15] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " BigTruck Engine Gear",
        },
        [16] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " BigTruck Start",
        },
        [17] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " BigTruck Stop",
        },
        [18] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Small Sedan",
        },
        [19] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Small Sedan Start",
        },
        [20] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Small Sedan Stop",
        },
        [21] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 6000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Challenger",
        },
        [22] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Cheyenne",
        },
        [23] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Cheyenne startup",
        },
        [24] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Cheyenne engstop",
        },
        [25] = {
                ["index"] = 29,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8500,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Moped 2 taktare",
        },
        [26] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Moped startup",
        },
        [27] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Moped engstop",
        },
        [28] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2700,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Traktor",
        },
        [29] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Traktor startup",
        },
        [30] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Traktor engstop",
        },
        [31] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4200,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Jeep",
        },
        [32] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Jeep startup",
        },
        [33] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Jeep engstop",
        },
        [34] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7500,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Corvette",
        },
        [35] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Corvette startup",
        },
        [36] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Corvette engstop",
        },
        [37] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 12000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Dirtbike",
        },
        [38] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Dirtbike startup",
        },
        [39] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Dirtbike engstop",
        },
        [40] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5500,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Harley",
        },
        [41] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Harley startup",
        },
        [42] = {
                ["index"] = 49,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Harley engstop",
        },
        [43] = {
                ["index"] = 50,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 13500,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Kawasaki",
        },
        [44] = {
                ["index"] = 51,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Kawasaki startup",
        },
        [45] = {
                ["index"] = 52,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Kawasaki engstop",
        },
        [46] = {
                ["index"] = 53,
                ["parameters"] = {
                },
                ["name"] = " Skoter startup - Empty",
        },
        [47] = {
                ["index"] = 54,
                ["parameters"] = {
                },
                ["name"] = " Skoter engstop - Empty",
        },
        [48] = {
                ["index"] = 55,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " ATV_engine",
        },
        [49] = {
                ["index"] = 56,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " ATV startup",
        },
        [50] = {
                ["index"] = 57,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " ATV engstop",
        },
        [51] = {
                ["index"] = 58,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Challenger startup",
        },
        [52] = {
                ["index"] = 59,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Challenger engstop",
        },
        [53] = {
                ["index"] = 60,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Vespa",
        },
        [54] = {
                ["index"] = 61,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Vespa startup",
        },
        [55] = {
                ["index"] = 62,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Vespa engstop",
        },
        [56] = {
                ["index"] = 63,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Tank",
        },
        [57] = {
                ["index"] = 64,
                ["parameters"] = {
                },
                ["name"] = " Turning agg - Empty",
        },
        [58] = {
                ["index"] = 65,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Tank startup",
        },
        [59] = {
                ["index"] = 66,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Tank engstop",
        },
        [60] = {
                ["index"] = 67,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4500,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Bus",
        },
        [61] = {
                ["index"] = 68,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Bus startup",
        },
        [62] = {
                ["index"] = 69,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Bus engstop",
        },
        [63] = {
                ["index"] = 71,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Passat",
        },
        [64] = {
                ["index"] = 72,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Passat startup",
        },
        [65] = {
                ["index"] = 73,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Passat engstop",
        },
        [66] = {
                ["index"] = 74,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Brake Noise",
        },
        [67] = {
                ["index"] = 75,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Turbo Noise",
        },
        [68] = {
                ["index"] = 76,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Backfires",
        },
        [69] = {
                ["index"] = 77,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "oneshot",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Engine Flutter",
        },
        [70] = {
                ["index"] = 78,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8500,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Ferrari 430",
        },
        [71] = {
                ["index"] = 79,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Ferrari startup",
        },
        [72] = {
                ["index"] = 80,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Ferrari eng stop",
        },
        [73] = {
                ["index"] = 87,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Longtail",
        },
        [74] = {
                ["index"] = 88,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Longtail startup",
        },
        [75] = {
                ["index"] = 89,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Longtail engstop",
        },
        [76] = {
                ["index"] = 90,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " BMW R1100S",
        },
        [77] = {
                ["index"] = 91,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " BMW R1100S startup",
        },
        [78] = {
                ["index"] = 92,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " BMW R1100S engstop",
        },
        [79] = {
                ["index"] = 106,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Monster Truck",
        },
        [80] = {
                ["index"] = 107,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Monster Truck Start",
        },
        [81] = {
                ["index"] = 108,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Monster Truck Stop",
        },
        [82] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4500,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Speedboat",
        },
        [83] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "Focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Speedboat startup",
        },
        [84] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "Focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Speedboat engstop",
        },
        [85] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Big boat",
        },
        [86] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Big boat startup",
        },
        [87] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Big boat engstop",
        },
        [88] = {
                ["index"] = 103,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Hovercraft",
        },
        [89] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Transport Helicopter",
        },
        [90] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param02",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Transport Heli engstart",
        },
        [91] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param02",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Transport Heli engstop",
        },
        [92] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 9000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Jet_JAS",
        },
        [93] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Jet helicopter",
        },
        [94] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Jet helicopter startup",
        },
        [95] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param02",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Jet helicopter engstop",
        },
        [96] = {
                ["index"] = 70,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2200,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Helicopter R44",
        },
        [97] = {
                ["index"] = 84,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2900,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cessna",
        },
        [98] = {
                ["index"] = 85,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Cessna startup",
        },
        [99] = {
                ["index"] = 86,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Cessna engstop",
        },
        [100] = {
                ["index"] = 93,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 9000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " New BigJet Plane",
        },
        [101] = {
                ["index"] = 94,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8000,
                                ["name"] = "rpm",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "damage",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Small_Jet _Plane",
        },
        [102] = {
                ["index"] = 95,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param02",
                        },
                },
                ["name"] = " Small Jet startup",
        },
        [103] = {
                ["index"] = 96,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Small Jet engstop",
        },
        [104] = {
                ["index"] = 99,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " R44  startup",
        },
        [105] = {
                ["index"] = 100,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " R44 engstop",
        },
        [106] = {
                ["index"] = 101,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Jet Fighter  startup",
        },
        [107] = {
                ["index"] = 102,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Jet Fighter engstop",
        },
        [108] = {
                ["index"] = 104,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Hovercraft Startup",
        },
        [109] = {
                ["index"] = 105,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Hovercraft Engstop",
        },
},
[7] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Horn medium",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Door Big Open",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Door Big Close",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Door Small Open",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Door Small Close",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Reverse Warning Beep",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Ice Cream",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "timer",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " CarAlarm 1",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " HeliAlarm",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Arve_Door_Slide",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " LAVE_Siren",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Ice Cream Pimped",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Horn big",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Horn small",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Horn truck 1",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Horn truck 2",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 45,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " Military Siren",
        },
},
[8] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Rolling_Water",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Rolling_Asphalt",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Rolling_Gravel",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Rolling_Soil",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8.5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Rolling_Rim",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "skid",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Skid_Gravel",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "skid",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Skid_Dirt",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "skid",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Skid_Asphalt",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Skid_Water",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "skid",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Skid_Snow",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Water Interact",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "spin",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Spin_Gravel",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 12,
                                ["name"] = "spin",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Spin_Snow",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Rolling_Snow",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Rolling_Ice",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8,
                                ["name"] = "spin",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Spin_Ice",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "skid",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Skid_Ice",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "spin",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Spin_Asphalt",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 9,
                                ["name"] = "spin",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Spin_Soil",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 28,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " Wobbling Tyre",
        },
},
[9] = {
        [1] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 6 - empty",
        },
        [2] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sentry Beep",
        },
        [3] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SAM Warning",
        },
        [4] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " MountedFlak_Mech",
        },
        [5] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SAM_Mech",
        },
        [6] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Sentry_Cooldown",
        },
        [7] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Sentry_Mech",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Sentry_Death",
        },
},
[10] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SigGunReload_Metal",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "(velocity)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SigGunReload_HardSurface",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SigGunReload_Generic",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1.6,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SnpRifleReload",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Machinegun_Reload",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " ShtGunPump",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " ShtGunShells",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " PistolReload",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " PistolDualReload",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " SMGReload",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RocketLauncher_Reload",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " GrenadeLauncher_Reload",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " airzooka reload",
        },
},
[11] = {
        [1] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Arctic_Det",
        },
        [2] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Desert_3_Detail_1",
        },
        [3] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jungle_3_Detail_1",
        },
        [4] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " City_3_Detail_1",
        },
        [5] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Field_3_Detail_1",
        },
        [6] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Jungle_3_Detail_1",
        },
        [7] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Arctic_Det",
        },
        [8] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Desert_3_Detail_1",
        },
        [9] = {
                ["index"] = 29,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Jungle_3_Detail_1",
        },
        [10] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Arctic_Det",
        },
        [11] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Desert_3_Detail_1",
        },
        [12] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Jungle_3_Detail_1",
        },
        [13] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Arctic_Det",
        },
        [14] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Desert_3_Detail_1",
        },
        [15] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Jungle_3_Detail_1",
        },
        [16] = {
                ["index"] = 50,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Arctic_Det",
        },
        [17] = {
                ["index"] = 53,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Desert_3_Detail_1",
        },
        [18] = {
                ["index"] = 56,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Jungle_3_Detail_1",
        },
        [19] = {
                ["index"] = 59,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Arctic_Det",
        },
        [20] = {
                ["index"] = 62,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 14,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Desert_3_Detail_1",
        },
        [21] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Arctic_Amb",
        },
        [22] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Desert_Amb",
        },
        [23] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jungle_Amb",
        },
        [24] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " City_Amb",
        },
        [25] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Field_Amb",
        },
        [26] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -50,
                                ["max"] = 30,
                                ["name"] = "inversed_height",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "temperature",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sea_Amb",
        },
        [27] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Ice_Amb",
        },
        [28] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Jungle_Amb",
        },
        [29] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Arctic_Amb",
        },
        [30] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Desert_Amb",
        },
        [31] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Jungle_Amb",
        },
        [32] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Arctic_Amb",
        },
        [33] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Desert_Amb",
        },
        [34] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Jungle_Amb",
        },
        [35] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Arctic_Amb",
        },
        [36] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Desert_Amb",
        },
        [37] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Jungle_Amb",
        },
        [38] = {
                ["index"] = 49,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Arctic_Amb",
        },
        [39] = {
                ["index"] = 52,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Desert_Amb",
        },
        [40] = {
                ["index"] = 55,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Jungle_Amb",
        },
        [41] = {
                ["index"] = 58,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Arctic_Amb",
        },
        [42] = {
                ["index"] = 61,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Desert_Amb",
        },
        [43] = {
                ["index"] = 64,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 60,
                                ["name"] = "variation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " City_Park_1",
        },
        [44] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Arctic_Sprinkle",
        },
        [45] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 60,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Desert_Sprinkle",
        },
        [46] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jungle_Sprinkle",
        },
        [47] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " City_Sprinkle",
        },
        [48] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Field_Sprinkle",
        },
        [49] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 18,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sea_Sprinkle",
        },
        [50] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Ice_Sprinkle",
        },
        [51] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Jungle_Sprinkle",
        },
        [52] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Arctic_Sprinkle",
        },
        [53] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Fisher_Desert_Sprinkle",
        },
        [54] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Jungle_Sprinkle",
        },
        [55] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Arctic_Sprinkle",
        },
        [56] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tourist_Desert_Sprinkle",
        },
        [57] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Jungle_Sprinkle",
        },
        [58] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Arctic_Sprinkle",
        },
        [59] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Religous_Desert_Sprinkle",
        },
        [60] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Jungle_Sprinkle",
        },
        [61] = {
                ["index"] = 51,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Arctic_Sprinkle",
        },
        [62] = {
                ["index"] = 54,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Military_Desert_Sprinkle",
        },
        [63] = {
                ["index"] = 57,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Jungle_Sprinkle",
        },
        [64] = {
                ["index"] = 60,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Arctic_Sprinkle",
        },
        [65] = {
                ["index"] = 63,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Industrial_Desert_Sprinkle",
        },
},
[12] = {
        [1] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 13,
                                ["name"] = "time",
                        },
                },
                ["name"] = " 16 - destruction_antenna_small",
        },
        [2] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 17 - Statue Explo (+km06 domedebris impact)",
        },
        [3] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 13,
                                ["name"] = "time",
                        },
                },
                ["name"] = " 7 - Water_Tower",
        },
        [4] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 8 - Explosion default",
        },
        [5] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 9 - Missile Explo",
        },
        [6] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 10 - Mortar Explosion",
        },
        [7] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 750,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 11 - Explosion Medium",
        },
        [8] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 12 - Cl.Mine_Fragm.Bomb",
        },
        [9] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 550,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 13 - Grenade Explo",
        },
        [10] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 750,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 14 - Trig. Mine C4",
        },
        [11] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 15 - Explo_c4_fireworks",
        },
        [12] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 18 - Wood Obelisk Explosion",
        },
        [13] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20 - km01_explosion_in_air",
        },
        [14] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 750,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cluster Grenade",
        },
        [15] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 750,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 22 cannon explosion",
        },
        [16] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 750,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " laser explosions km05",
        },
        [17] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2.5,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 0 - Extraction",
        },
        [18] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timer",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 1 - Demolition_Man_killed(warning)",
        },
        [19] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Triggered Explosive_Armed",
        },
        [20] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cloaked Mine_Armed",
        },
        [21] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timer",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cloaked Mine_Proximity",
        },
        [22] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timer",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 60,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Handgrenade_Proximity",
        },
        [23] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 6.1,
                                ["name"] = "timer",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 60,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 19 - Handgrenade_Proximity_AI",
        },
        [24] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 3 - Blast_Alarm",
        },
},
[13] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Water_Horisontal",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Water_Vertical_Down",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1.5,
                                ["name"] = "depth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Water_Vertical_Up",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Snow",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Stone",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Snow",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Stone",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Snow",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Stone",
        },
        [10] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Metal",
        },
        [11] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Metal",
        },
        [12] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Hands",
        },
        [13] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Slide",
        },
        [14] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Metal_Solid",
        },
        [15] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "distance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Dirt",
        },
        [16] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Dirt",
        },
        [17] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Gravel",
        },
        [18] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Gravel",
        },
        [19] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Gravel",
        },
        [20] = {
                ["index"] = 28,
                ["parameters"] = {
                },
                ["name"] = " _Footsteps_Mud",
        },
        [21] = {
                ["index"] = 29,
                ["parameters"] = {
                },
                ["name"] = " _Jump_Land_Mud",
        },
        [22] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "speed",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Ragdoll_Tumble",
        },
        [23] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Sand_Dry",
        },
        [24] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Sand_Dry",
        },
        [25] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Sand_Dry",
        },
        [26] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Metal_Catwalk",
        },
        [27] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Metal_Catwalk",
        },
        [28] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Metal_Catwalk",
        },
        [29] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Metal_Car",
        },
        [30] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Metal_Car",
        },
        [31] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Metal_Car",
        },
        [32] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Glass_Broken",
        },
        [33] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Glass_Broken",
        },
        [34] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Glass_Broken",
        },
        [35] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Wood_Solid",
        },
        [36] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Wood_Solid",
        },
        [37] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Wood_Solid",
        },
        [38] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Footsteps_Ice_Solid",
        },
        [39] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Land_Ice_Solid",
        },
        [40] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Ice_Solid",
        },
        [41] = {
                ["index"] = 50,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = -1,
                                ["max"] = 50,
                                ["name"] = "waterdepth",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " In Water",
        },
        [42] = {
                ["index"] = 51,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Jump_Up_Dirt",
        },
        [43] = {
                ["index"] = 53,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param04",
                        },
                },
                ["name"] = " Ladder",
        },
        [44] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Clothing_Jump",
        },
        [45] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Clothing_Walk_Run",
        },
        [46] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Evade_Groundcontact",
        },
        [47] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Throw_Over",
        },
        [48] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Throw_Under",
        },
        [49] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Wield_Down",
        },
        [50] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Wield_Up",
        },
        [51] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Wield_Up_Grenade",
        },
        [52] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "vegetation",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Foliage",
        },
        [53] = {
                ["index"] = 49,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "waterdepth",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Ice_Cracks",
        },
        [54] = {
                ["index"] = 52,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 9,
                                ["name"] = "Speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Turn",
        },
},
[14] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Punch",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Swisch",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Hijack-Punch",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Hijack-Swisch",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Melee_Strike",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Punch",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Counter_Foley",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Headbutt_Foley",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Headbutt_Block_Foley",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Idle_Foley",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Knee_Foley",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Knee_Block_Foley",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Lft_Punch_Foley",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Struggle_Lft_Punch_Block_Foley",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Neutral_To_Struggle_Foley",
        },
},
[15] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Parachute_Horiz",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param04",
                        },
                },
                ["name"] = " Parachute_InFlight",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 65,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "height",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "speedvertical",
                        },
                },
                ["name"] = " Wind_skydive",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "steer",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "var",
                        },
                },
                ["name"] = " Parachute_steer",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "variation",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "height",
                        },
                },
                ["name"] = " Wind_height",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Parachute_Vert",
        },
},
[16] = {
        [1] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Antenna Huge Fall",
        },
        [2] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "deltavelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Lave_Slide",
        },
        [3] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 26 - Crane Fall",
        },
        [4] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "angularvelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 27 - Lave_Aggroll",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Constraint Brake",
        },
        [6] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Statue Crumble",
        },
        [7] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "time",
                        },
                },
                ["name"] = " 15_Pipeline_ventpop",
        },
        [8] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 240,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 18_Explosion_antenna_break",
        },
        [9] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 22 - Tree Small",
        },
        [10] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 23 - Tree Medium",
        },
        [11] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 24 - Tree Large",
        },
        [12] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 25 - Water_Splash",
        },
        [13] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Statue Generic Debris",
        },
        [14] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Wiggle Mast",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 14_Wiresnap",
        },
        [16] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "velocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 16_Pipeline_pressure",
        },
        [17] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "time",
                        },
                },
                ["name"] = " 17_Pipeline_Steam360",
        },
        [18] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 19 - Floodgate waterloop",
        },
        [19] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash",
        },
        [20] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Deformation",
        },
        [21] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash_Metal",
        },
        [22] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash_Sand_Dirt",
        },
        [23] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash_Stone",
        },
        [24] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash_Wood",
        },
        [25] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash_Glass",
        },
        [26] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash_Snow",
        },
        [27] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2.5,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Crash_Water",
        },
        [28] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "deltavelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20 - Seve_Slide_Vehicle",
        },
        [29] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "deltavelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 21 - Seve_Slide_Land",
        },
},
[17] = {
        [1] = {
                ["index"] = 1,
                ["parameters"] = {
                },
                ["name"] = " 1",
        },
        [2] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "intensity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Health",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "load",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Personal Thruster",
        },
},
[18] = {
        [1] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Gong",
        },
        [2] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 35 Melee_Hit_Gong",
        },
        [3] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Bullet_Hit_Shielder",
        },
        [4] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Metal_Impact_Large",
        },
        [5] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Metal_Impact_Medium",
        },
        [6] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Metal_Impact_Medium_nodebris",
        },
        [7] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " flak impact",
        },
        [8] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 - Melee_Punch",
        },
        [9] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " Statue Impact",
        },
        [10] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mast_Impact",
        },
        [11] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 60,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 2000,
                                ["name"] = "impulse",
                        },
                },
                ["name"] = " Cable Car Impact",
        },
        [12] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Pillar_Impact",
        },
        [13] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Stone_Impact(melee_etc)",
        },
        [14] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Metal Shed Impacts",
        },
        [15] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Metal_Impact_Small",
        },
        [16] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Glassobject_small",
        },
        [17] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20 - Metal_bin_Impact_Coll",
        },
        [18] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Plastic_Impact_Coll",
        },
        [19] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sheetmetal_Impact_Coll",
        },
        [20] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Body_Impact_Coll",
        },
        [21] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 25 - Props_Impact_Coll",
        },
        [22] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Car_Chassis_Impact_Coll",
        },
        [23] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Wood_Impact_Coll",
        },
        [24] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "deltavelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Body_Impact_Slide",
        },
        [25] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Metal_bin_Impact_Roll",
        },
        [26] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Plastic_bin_Impact_Roll",
        },
        [27] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Dirt",
        },
        [28] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Flesh",
        },
        [29] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Glass",
        },
        [30] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Metal",
        },
        [31] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Misc_Plastic",
        },
        [32] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Water",
        },
        [33] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_Wood",
        },
        [34] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Hit_SheetMetal",
        },
        [35] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 40,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Whizzes",
        },
        [36] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 40,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Riccos",
        },
        [37] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 40,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Whizzes_HighSpeed",
        },
        [38] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 40,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Bullet_Whizzes_Burst",
        },
        [39] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Seve_Impact",
        },
        [40] = {
                ["index"] = 29,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "deltavelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Plastic_Impact_Slide",
        },
        [41] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "deltavelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 30 - Metal_Impact_Slide",
        },
        [42] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "deltavelocity",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Wood_Impact_Slide",
        },
        [43] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 42 Seve_Impact_water",
        },
        [44] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 25000,
                                ["name"] = "impulse",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 43 Seve_Impact_sand",
        },
},
[19] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " Cancel",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " Select",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " Scroll",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " start_game",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " 4",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " 5",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " Spinner_Radio",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " selection_change_fail",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param00",
                        },
                },
                ["name"] = " volume_test_music",
        },
        [10] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " selection_change_complete",
        },
        [11] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "",
                        },
                },
                ["name"] = " attention_working",
        },
        [12] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " cutscene text",
        },
        [13] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " End Credits Text In",
        },
},
[20] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Objective_Show N",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Heat",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Weapon_Switch_Walk_Over N",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Pick_Up N",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Pick_Up_Ammo N",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Equip Shoulder N",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Equip N",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Equip Switch N",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Reject N",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sniper_Left_Right",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 - Sniper_Up_Down",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sniper_Zoom_In",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sniper_Zoom_Out",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Disarm_Positive N",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Disarm_Negative N",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Disarm_Success N",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Disarm_Failed N",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Tutorial Small In N",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Tutorial Largel In N",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Tutorial Out N",
        },
        [21] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20 - Tutorial Incoming File N",
        },
        [22] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Tutorial Incoming File Loop N",
        },
        [23] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Tutorial Small Heading Flash N",
        },
        [24] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Attention N",
        },
        [25] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Rewards N",
        },
        [26] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission Start N",
        },
        [27] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission Complete N",
        },
        [28] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission Fade N",
        },
        [29] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Progression N",
        },
        [30] = {
                ["index"] = 29,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission Complete Split Pt 2 N",
        },
        [31] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Pick Up Healthbox N",
        },
        [32] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 31 - Flare Yes",
        },
        [33] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 32 - Flare No",
        },
        [34] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Objective_Complete",
        },
        [35] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Download",
        },
        [36] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " chaos_lvl_2-3",
        },
        [37] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission_Complete_Parts_logo",
        },
        [38] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission_Complete_Meter_progress",
        },
        [39] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission_complete_Meter_topped",
        },
        [40] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mission_complete_Chaos_logo",
        },
        [41] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Challenge start",
        },
        [42] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mercenary Mode screen",
        },
        [43] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Mercenary Mode Percentage",
        },
},
[21] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Scroll Int File Loop N",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Lock Int File N",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Open Int File N",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Close Int File N",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Enter N",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Exit N",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Zoom Loop N",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Counter Money Loop N",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Open Close Sub Menu N",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Confirm Selection N",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 - Scroll In Sub Menu N",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Select In Sub Menu  N",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Waypoint Set N",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Waypoint Remove N",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Selection Rejected N",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Black Market Buy",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Black Market Unlock",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Black Market Upgrade",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Black Market Enter",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " AOI New Icon",
        },
        [21] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20 AOI Expanded",
        },
        [22] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 21 Black MArket Top Menu Scroll",
        },
        [23] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 22 Black MArket Top Menu Selcet",
        },
        [24] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 23 Black Market Top Menu Exit",
        },
        [25] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Show Chaos Info",
        },
},
[22] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 160,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " combat_",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "(listenerangle)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " rico",
        },
},
[23] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "velocity",
                        },
                },
                ["name"] = " Siren",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "velocity",
                        },
                },
                ["name"] = " Alarm",
        },
},
[24] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "Focus",
                        },
                },
                ["name"] = " Gong",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                },
                ["name"] = " empty_15",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                },
                ["name"] = " empty_14",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                },
                ["name"] = " empty_17",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                },
                ["name"] = " empty_13",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                },
                ["name"] = " empty_19",
        },
        [7] = {
                ["index"] = 9,
                ["parameters"] = {
                },
                ["name"] = " Window Crash (Empty)",
        },
        [8] = {
                ["index"] = 6,
                ["parameters"] = {
                },
                ["name"] = " Resource_Item_DrugDrop(empty)",
        },
        [9] = {
                ["index"] = 7,
                ["parameters"] = {
                },
                ["name"] = " Resource_Item_BlackBox(empty)",
        },
        [10] = {
                ["index"] = 8,
                ["parameters"] = {
                },
                ["name"] = " Resource_Item_Skulls(empty)",
        },
        [11] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "distance",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Siren old",
        },
        [12] = {
                ["index"] = 10,
                ["parameters"] = {
                },
                ["name"] = " Bang From Car (empty)",
        },
},
[25] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Weird_Undetected",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Weird_Combat",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Weird_Evasion",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Nig_Scary_Undetected",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Nig_Scary_Combat",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Nig_Scary_Evasion",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Techy_Undetected",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Techy_Combat",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Techy_Evasion",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Agentish_Undetected",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Agentish_Combat",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Agentish_Evasion",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Stressful_Undetected",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Stressful_Combat",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Stressful_Evasion",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Nervous_Undetected",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Nervous_Combat",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Nervous_Evasion",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Bondish_Undetected",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Bondish_Combat",
        },
        [21] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Bondish_Evasion",
        },
        [22] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Military_Undetected",
        },
        [23] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Military_Combat",
        },
        [24] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Military_Evasion",
        },
        [25] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Tribal_Undetected",
        },
        [26] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Tribal_Combat",
        },
        [27] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_Tribal_Evasion",
        },
        [28] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_TheBrass_Undetected",
        },
        [29] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_TheBrass_Combat",
        },
        [30] = {
                ["index"] = 29,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Def_TheBrass_Evasion",
        },
        [31] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Prime_Undetected",
        },
        [32] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Prime_Combat",
        },
        [33] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Prime_Evasion",
        },
        [34] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Peak_Undetected",
        },
        [35] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Peak_Combat",
        },
        [36] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Peak_Evasion",
        },
        [37] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Heat_Undetected",
        },
        [38] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Heat_Combat",
        },
        [39] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Heat_Evasion",
        },
        [40] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Finale_Undetected",
        },
        [41] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Finale_Combat",
        },
        [42] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "heat",
                        },
                },
                ["name"] = " Cha_Finale_Evasion",
        },
        [43] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Carchase",
        },
        [44] = {
                ["index"] = 43,
                ["parameters"] = {
                },
                ["name"] = " Frontend",
        },
        [45] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " GameOver",
        },
        [46] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " MissionComplete",
        },
        [47] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " MissionFail",
        },
        [48] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " MissionStart",
        },
        [49] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Panau_National_theme",
        },
        [50] = {
                ["index"] = 49,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 Baby_Panay_atmospheric",
        },
        [51] = {
                ["index"] = 50,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Km07 Rocket Combat",
        },
        [52] = {
                ["index"] = 51,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 Baby_Panay_Synt_2",
        },
        [53] = {
                ["index"] = 52,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 Panau_National_Theme_alt",
        },
        [54] = {
                ["index"] = 53,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06 Baby_Panay_March",
        },
        [55] = {
                ["index"] = 54,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07 Baby_Panay_Harp",
        },
        [56] = {
                ["index"] = 55,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08 Baby_Panay_Flute",
        },
        [57] = {
                ["index"] = 56,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 OpeningScene_main",
        },
        [58] = {
                ["index"] = 57,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 OpeningScene_no_guittrump",
        },
        [59] = {
                ["index"] = 58,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 Cresc_all_OpeningScene",
        },
        [60] = {
                ["index"] = 59,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 GitarrMel_OpeningScene",
        },
        [61] = {
                ["index"] = 60,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 Opening_scene_short",
        },
        [62] = {
                ["index"] = 61,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06 Opening_scene_short_quickstart",
        },
        [63] = {
                ["index"] = 62,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07 Cresc_1_OpeningScene",
        },
        [64] = {
                ["index"] = 63,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08 Cresc_2_OpeningScene",
        },
        [65] = {
                ["index"] = 64,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 09 Cresc_3_OpeningScene",
        },
        [66] = {
                ["index"] = 65,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 Cresc_4_OpeningScene",
        },
        [67] = {
                ["index"] = 66,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 11 Cresc_5_OpeningScene",
        },
        [68] = {
                ["index"] = 67,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 12 Cresc_6_OpeningScene",
        },
        [69] = {
                ["index"] = 68,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Rico_Main",
        },
        [70] = {
                ["index"] = 69,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 RICO_nylon_theme",
        },
        [71] = {
                ["index"] = 70,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 RICO_harmon_theme",
        },
        [72] = {
                ["index"] = 71,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 RICO_nylon_kort",
        },
        [73] = {
                ["index"] = 72,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 RICO_harmon_kort",
        },
        [74] = {
                ["index"] = 73,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 theCrook_MainTheme",
        },
        [75] = {
                ["index"] = 74,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 theCrook_Theme_2",
        },
        [76] = {
                ["index"] = 75,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 theCrook_Theme_2_nomel",
        },
        [77] = {
                ["index"] = 76,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 theCrook_Theme_2_mel",
        },
        [78] = {
                ["index"] = 77,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 theCrook_Theme_1",
        },
        [79] = {
                ["index"] = 78,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06 theCrook_Theme_1_SOLO",
        },
        [80] = {
                ["index"] = 79,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07 Fanfarer_theCrook_1",
        },
        [81] = {
                ["index"] = 80,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08 Fanfarer_theCrook_2",
        },
        [82] = {
                ["index"] = 81,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 09 Fanfarer_theCrook_3",
        },
        [83] = {
                ["index"] = 82,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 Fanfarer_theCrook_4",
        },
        [84] = {
                ["index"] = 83,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 11 Fanfarer_theCrook_5",
        },
        [85] = {
                ["index"] = 84,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 12 Fanfarer_theCrook_6",
        },
        [86] = {
                ["index"] = 85,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Sloth_TomSheldon_Main",
        },
        [87] = {
                ["index"] = 86,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 Tom_MainTheme",
        },
        [88] = {
                ["index"] = 87,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 Sloth_Main",
        },
        [89] = {
                ["index"] = 88,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 Sloth_no_Slide",
        },
        [90] = {
                ["index"] = 89,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 Tom_no_solos",
        },
        [91] = {
                ["index"] = 90,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06 Sloth_Short",
        },
        [92] = {
                ["index"] = 91,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07 Sloth_Short_2",
        },
        [93] = {
                ["index"] = 92,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08 Sloth_Slide",
        },
        [94] = {
                ["index"] = 93,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 09 Sloth_Slide_2",
        },
        [95] = {
                ["index"] = 94,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Reap_Theme_Full",
        },
        [96] = {
                ["index"] = 95,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 Reap_Theme_Whistle+Perc",
        },
        [97] = {
                ["index"] = 96,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 Reap_Theme_Choir+Perc",
        },
        [98] = {
                ["index"] = 97,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 Reap_Theme_ChoirOnly",
        },
        [99] = {
                ["index"] = 98,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 Reap_Suspense_Full",
        },
        [100] = {
                ["index"] = 99,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06 Reap_Shouts+Perc",
        },
        [101] = {
                ["index"] = 100,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07 Reap_ShoutsOnly",
        },
        [102] = {
                ["index"] = 101,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08 Reap_PercOnly",
        },
        [103] = {
                ["index"] = 102,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 09 Reap_Suspense_NoMel",
        },
        [104] = {
                ["index"] = 103,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 Reap_Susp_NoBassline",
        },
        [105] = {
                ["index"] = 104,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 11 Reap_Susp_NoBassline_NoMel",
        },
        [106] = {
                ["index"] = 105,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 12 Reap_Susp_MelOnly1",
        },
        [107] = {
                ["index"] = 106,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 13 Reap_Susp_MelOnly2",
        },
        [108] = {
                ["index"] = 107,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 14 Reap_Susp_MelOnly3",
        },
        [109] = {
                ["index"] = 108,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 15 Reap_Bumper1",
        },
        [110] = {
                ["index"] = 109,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 16 Reap_Bumper2",
        },
        [111] = {
                ["index"] = 110,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 17 Reap_Bumper3",
        },
        [112] = {
                ["index"] = 111,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 18 Reap_Bumper4",
        },
        [113] = {
                ["index"] = 112,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 19 Reap_Bumper5",
        },
        [114] = {
                ["index"] = 113,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20 Reap_Bumper6",
        },
        [115] = {
                ["index"] = 114,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 21 Reap_Bumper7",
        },
        [116] = {
                ["index"] = 115,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 22 Reap_Bumper8",
        },
        [117] = {
                ["index"] = 116,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Ro_MainTheme",
        },
        [118] = {
                ["index"] = 117,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 Ro_MainTheme_NoMel",
        },
        [119] = {
                ["index"] = 118,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 Ro_MainTheme_Hard",
        },
        [120] = {
                ["index"] = 119,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 Ro_MainTheme_Soft",
        },
        [121] = {
                ["index"] = 120,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 Ro_MainTheme_Gitr",
        },
        [122] = {
                ["index"] = 121,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06 Ro_MainTheme_OnlyMel",
        },
        [123] = {
                ["index"] = 122,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07 Ro_MainTheme_Hard_OnlyMel",
        },
        [124] = {
                ["index"] = 123,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08 Ro_Susp",
        },
        [125] = {
                ["index"] = 124,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 09 Ro_Susp_NoMel",
        },
        [126] = {
                ["index"] = 125,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 Ro_Susp_PainoFig",
        },
        [127] = {
                ["index"] = 126,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 11 Ro_Susp_Swell1",
        },
        [128] = {
                ["index"] = 127,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 12 Ro_Susp_Swell2",
        },
        [129] = {
                ["index"] = 128,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 13 Ro_Susp_Swell3",
        },
        [130] = {
                ["index"] = 129,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 14 Ro_MainTheme_Fanfar_Hard",
        },
        [131] = {
                ["index"] = 130,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 15 Ro_MainTheme_Fanfar_Hard2",
        },
        [132] = {
                ["index"] = 131,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 16 Ro_MainTheme_Fanfar_Hard3",
        },
        [133] = {
                ["index"] = 132,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Ular_Theme_Laidback",
        },
        [134] = {
                ["index"] = 133,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 Ular_Theme_Laidback_NoMel",
        },
        [135] = {
                ["index"] = 134,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 Ular_Theme_LessPerc",
        },
        [136] = {
                ["index"] = 135,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04 Ular_Theme_MorePerc",
        },
        [137] = {
                ["index"] = 136,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05 Ular_Theme_NoMel_MorePerc",
        },
        [138] = {
                ["index"] = 137,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06 Ular_Theme_NoPerc",
        },
        [139] = {
                ["index"] = 138,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07 Ular_Theme_Bumper1",
        },
        [140] = {
                ["index"] = 139,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08 Ular_Theme_Bumper2",
        },
        [141] = {
                ["index"] = 140,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 09 Ular_Theme_Bumper3",
        },
        [142] = {
                ["index"] = 141,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10 Ular_Theme_Bumper4",
        },
        [143] = {
                ["index"] = 142,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 11 Ular_Theme_Bumper5",
        },
        [144] = {
                ["index"] = 143,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 12 Ular_Theme_Bumper6",
        },
        [145] = {
                ["index"] = 144,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 13 Ular_Theme_Bumper7",
        },
        [146] = {
                ["index"] = 145,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 14 Ular_Theme_Bumper8",
        },
        [147] = {
                ["index"] = 146,
                ["parameters"] = {
                },
                ["name"] = " Extraction Sloth",
        },
        [148] = {
                ["index"] = 147,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Challenge",
        },
        [149] = {
                ["index"] = 148,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 850,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " MileHighClub",
        },
        [150] = {
                ["index"] = 149,
                ["parameters"] = {
                },
                ["name"] = " FrontEnd_Logos_Intro",
        },
        [151] = {
                ["index"] = 150,
                ["parameters"] = {
                },
                ["name"] = " FrontEnd_Startup_Theme",
        },
        [152] = {
                ["index"] = 151,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM01_Gunner",
        },
        [153] = {
                ["index"] = 152,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM01_Landing",
        },
        [154] = {
                ["index"] = 153,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Rico_Main_cut1",
        },
        [155] = {
                ["index"] = 154,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01 Fighting",
        },
        [156] = {
                ["index"] = 155,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02 Fighting",
        },
        [157] = {
                ["index"] = 156,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cha_Prime_Combat_Max_Heat",
        },
        [158] = {
                ["index"] = 157,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cha_Peak_Combat_Max_Heat",
        },
        [159] = {
                ["index"] = 158,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cha_Heat_Combat_Max_Heat",
        },
        [160] = {
                ["index"] = 159,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Def_Tribal_Combat_Max_Heat",
        },
        [161] = {
                ["index"] = 160,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cha_Finale_Combat_Max_Heat",
        },
        [162] = {
                ["index"] = 161,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " km06 Ular_Theme_01",
        },
        [163] = {
                ["index"] = 162,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 15 Ular_Theme_NoMel_NoPerc_Suspense",
        },
        [164] = {
                ["index"] = 163,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 16 Ular_TribalGroove",
        },
        [165] = {
                ["index"] = 164,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Cha_TheBrass_Max_Heat",
        },
        [166] = {
                ["index"] = 165,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f3m05_Reap_Broadcast",
        },
        [167] = {
                ["index"] = 166,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 850,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " MileHighClub_Combat",
        },
        [168] = {
                ["index"] = 167,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RICO_StrBumper",
        },
        [169] = {
                ["index"] = 168,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RICO_Bumper_4",
        },
        [170] = {
                ["index"] = 169,
                ["parameters"] = {
                },
                ["name"] = " JC2-Theme - End Credits",
        },
        [171] = {
                ["index"] = 170,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " Hud_Heat_Drone",
        },
        [172] = {
                ["index"] = 171,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " PartyTent",
        },
        [173] = {
                ["index"] = 172,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tracks_Region01",
        },
        [174] = {
                ["index"] = 173,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tracks_Region02",
        },
        [175] = {
                ["index"] = 174,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Settlement_Tracks_Region03",
        },
        [176] = {
                ["index"] = 175,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 175 freeroam_night",
        },
        [177] = {
                ["index"] = 176,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " freeroam_day",
        },
        [178] = {
                ["index"] = 177,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " freeroam_race",
        },
        [179] = {
                ["index"] = 178,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " freeroam_vista_view",
        },
        [180] = {
                ["index"] = 179,
                ["parameters"] = {
                },
                ["name"] = " End Credits",
        },
        [181] = {
                ["index"] = 180,
                ["parameters"] = {
                },
                ["name"] = " reap_stronghold_bumper",
        },
        [182] = {
                ["index"] = 181,
                ["parameters"] = {
                },
                ["name"] = " ro_stronghold_bumper",
        },
        [183] = {
                ["index"] = 182,
                ["parameters"] = {
                },
                ["name"] = " ular_stronghold_bumper",
        },
        [184] = {
                ["index"] = 183,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Emo_National_Anthem",
        },
        [185] = {
                ["index"] = 184,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Km02_On_Car_Roof",
        },
},
[26] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " grappling_fire_wire",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 80,
                                ["name"] = "speed",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "var",
                        },
                },
                ["name"] = " grappling_reel_loop",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " grappling_reel_back",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " grappling_impact_def",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " grappling_impact_rock",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " grappling_impact_hardmetal",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " grappling_impact_hollowmetal",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " grappling_impact_body",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " grappling_impact_dual",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " grappling_detatch",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " grappling_carstop",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " grappling_detatch_dual",
        },
},
[27] = {
        [1] = {
                ["index"] = 64,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 64 - Intro",
        },
        [2] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 00_KM00_02",
        },
        [3] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 01_KM00_04",
        },
        [4] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 02_KM00_03",
        },
        [5] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 03 - (KM00_03_Dialog_tempfix)",
        },
        [6] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 04_KM02_02A1",
        },
        [7] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 05_KM02_02A",
        },
        [8] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 06_KM02_02B",
        },
        [9] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 10_KM04_05",
        },
        [10] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 11_KM01_01B",
        },
        [11] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 12_KM01_01C",
        },
        [12] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 13_KM04_03",
        },
        [13] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 14_KM03_01A",
        },
        [14] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 15_KM04_01",
        },
        [15] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 16_KM03_01B",
        },
        [16] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 17_KM03_01C",
        },
        [17] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 18_KM01_02",
        },
        [18] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 19_KM06_09",
        },
        [19] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM03_00B",
        },
        [20] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM04_06",
        },
        [21] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_01",
        },
        [22] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_01B",
        },
        [23] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_02A",
        },
        [24] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_02B",
        },
        [25] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_02C",
        },
        [26] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_02D",
        },
        [27] = {
                ["index"] = 29,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_02E",
        },
        [28] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 30_KM05_03",
        },
        [29] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM06_08",
        },
        [30] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM07_01",
        },
        [31] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM07_02",
        },
        [32] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM07_04",
        },
        [33] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM07_07",
        },
        [34] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM03_03",
        },
        [35] = {
                ["index"] = 49,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM01_00",
        },
        [36] = {
                ["index"] = 50,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 50 - (KM01??)",
        },
        [37] = {
                ["index"] = 51,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM01_01",
        },
        [38] = {
                ["index"] = 54,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM01_03",
        },
        [39] = {
                ["index"] = 57,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM05_03",
        },
        [40] = {
                ["index"] = 58,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM02_03",
        },
        [41] = {
                ["index"] = 59,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " KM02_03B",
        },
        [42] = {
                ["index"] = 66,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 66 - KM03_00C",
        },
        [43] = {
                ["index"] = 67,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 67 - KM03_00D",
        },
        [44] = {
                ["index"] = 68,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 68 - KM02_00",
        },
        [45] = {
                ["index"] = 69,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 69 - KM03_00A",
        },
        [46] = {
                ["index"] = 70,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 70 - KM03_00E",
        },
        [47] = {
                ["index"] = 71,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 71 - KM04_00",
        },
        [48] = {
                ["index"] = 72,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 72 - KM04_06B",
        },
        [49] = {
                ["index"] = 73,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 73 - KM06_01",
        },
        [50] = {
                ["index"] = 74,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 74 - KM06_02",
        },
        [51] = {
                ["index"] = 75,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 75 - KM06_02B",
        },
        [52] = {
                ["index"] = 76,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 76 - KM06_03",
        },
        [53] = {
                ["index"] = 77,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 77 - KM06_04",
        },
        [54] = {
                ["index"] = 78,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 78 - KM06_04B",
        },
        [55] = {
                ["index"] = 79,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 79 - KM06_10",
        },
        [56] = {
                ["index"] = 87,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 87 - KM03_03B",
        },
        [57] = {
                ["index"] = 88,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 88 - KM04_00B",
        },
        [58] = {
                ["index"] = 89,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 89 - KM06_03B",
        },
        [59] = {
                ["index"] = 90,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 90 - Fxsxb",
        },
        [60] = {
                ["index"] = 91,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 91 - f1s02",
        },
        [61] = {
                ["index"] = 92,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 92 - f1s03",
        },
        [62] = {
                ["index"] = 93,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 93 - f2s07",
        },
        [63] = {
                ["index"] = 94,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 94 - f2s01",
        },
        [64] = {
                ["index"] = 95,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 95 - f3s06",
        },
        [65] = {
                ["index"] = 96,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 96 - f3s04",
        },
        [66] = {
                ["index"] = 97,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 97 f2m05_micro_01",
        },
        [67] = {
                ["index"] = 98,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 98 f2m08_micro_01",
        },
        [68] = {
                ["index"] = 99,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 99 - Benchmark 1",
        },
        [69] = {
                ["index"] = 100,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 100 - Benchmark 2",
        },
        [70] = {
                ["index"] = 101,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 101 - Benchmark 3",
        },
        [71] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 07_KM02_mini_Heli",
        },
        [72] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08_KM02_mini_TowerExplode",
        },
        [73] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 08_KM02_mini_Bomber",
        },
        [74] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20_KM04_mini_sub",
        },
        [75] = {
                ["index"] = 65,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 65 - KM01_micro_02 (sams)",
        },
        [76] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f1_00a",
        },
        [77] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f1_00b",
        },
        [78] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f1_01",
        },
        [79] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f1_01b",
        },
        [80] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 40_f2_00a",
        },
        [81] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2_00b",
        },
        [82] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2_01",
        },
        [83] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2_01b",
        },
        [84] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2s04",
        },
        [85] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f3_01",
        },
        [86] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f3_01b",
        },
        [87] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f3s01",
        },
        [88] = {
                ["index"] = 52,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f3s01b",
        },
        [89] = {
                ["index"] = 53,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2s04b",
        },
        [90] = {
                ["index"] = 55,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f1s07",
        },
        [91] = {
                ["index"] = 56,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f1s07b",
        },
        [92] = {
                ["index"] = 60,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " 60 - f3t-bus",
        },
        [93] = {
                ["index"] = 61,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " 61 - f-boat",
        },
        [94] = {
                ["index"] = 62,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " 62 - f-jeep",
        },
        [95] = {
                ["index"] = 63,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 63 - f3t04",
        },
        [96] = {
                ["index"] = 80,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " 80 - f-speedboat",
        },
        [97] = {
                ["index"] = 81,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 81 - F1_02",
        },
        [98] = {
                ["index"] = 82,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 82 - F1_03",
        },
        [99] = {
                ["index"] = 83,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 83 - F2_02",
        },
        [100] = {
                ["index"] = 84,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 84 - F2_03",
        },
        [101] = {
                ["index"] = 85,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 85 - F3_02",
        },
        [102] = {
                ["index"] = 86,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 86 - F3_03",
        },
},
[28] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 160,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " combat_",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 74,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = -180,
                                ["max"] = 180,
                                ["name"] = "(listenerangle)",
                        },
                },
                ["name"] = " wsim_",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " general",
        },
},
[29] = {
        [1] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 12_Communication_Station",
        },
        [2] = {
                ["index"] = 14,
                ["parameters"] = {
                },
                ["name"] = " 14",
        },
        [3] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f3m05 - Pirate Dish",
        },
        [4] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Satelite Core Buzz",
        },
        [5] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Zeppelin Engine",
        },
        [6] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timelinee",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Elevator Engine",
        },
        [7] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Large Dish Servo",
        },
        [8] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Small Dish Servo",
        },
        [9] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 600,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Huge Dish Servo",
        },
        [10] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Motorhouse_Skilift",
        },
        [11] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "Focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Fan",
        },
        [12] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 40,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Motorhouse",
        },
        [13] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Pulley By",
        },
        [14] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " PulleyOnboard",
        },
        [15] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 40,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 11_Arctic_Radar",
        },
        [16] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 13_Turbine",
        },
        [17] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Retract Wires Underwater",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Skilift By",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 6,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Electric_Trafo_Station",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Electric_Tower_Small",
        },
        [21] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Barge",
        },
        [22] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f3m05 - Huge Dish Creaks",
        },
        [23] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Samsite_doors",
        },
        [24] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Tram Start Signal",
        },
        [25] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 24,
                                ["name"] = "timeofday",
                        },
                },
                ["name"] = " ChurchBells",
        },
},
[30] = {
        [1] = {
                ["index"] = 3,
                ["parameters"] = {
                },
                ["name"] = " Sewer (Empty)",
        },
        [2] = {
                ["index"] = 6,
                ["parameters"] = {
                },
                ["name"] = " Canal (Empty)",
        },
        [3] = {
                ["index"] = 8,
                ["parameters"] = {
                },
                ["name"] = " Distant Firefight 1(Empty)",
        },
        [4] = {
                ["index"] = 19,
                ["parameters"] = {
                },
                ["name"] = " empty_10",
        },
        [5] = {
                ["index"] = 20,
                ["parameters"] = {
                },
                ["name"] = " empty_19",
        },
        [6] = {
                ["index"] = 21,
                ["parameters"] = {
                },
                ["name"] = " AC Broken (Empty)",
        },
        [7] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 70,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " SawMill House",
        },
        [8] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "Focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " SawMill Round Thingie",
        },
        [9] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " AC",
        },
        [10] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Roof Ventilationduct",
        },
        [11] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Voltage Overtone",
        },
        [12] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Server Room",
        },
        [13] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Waterfall (To Tight Loop?)",
        },
        [14] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 130,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 45,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " dome_ambience",
        },
        [15] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Drug_Factory_Amb",
        },
        [16] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Windchimes",
        },
        [17] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Signs Hum",
        },
        [18] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Store_Restau_TV",
        },
        [19] = {
                ["index"] = 14,
                ["parameters"] = {
                },
                ["name"] = " Store_Restau_Music",
        },
        [20] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " WindonBridge",
        },
        [21] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Fountain Idle",
        },
        [22] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Fountain Gush Large",
        },
        [23] = {
                ["index"] = 18,
                ["parameters"] = {
                },
                ["name"] = " Casino Amb (Redundant?)",
        },
        [24] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Underwater Bubbles",
        },
        [25] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "variation",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Electric Fence",
        },
},
[31] = {
        [1] = {
                ["index"] = 6,
                ["parameters"] = {
                },
                ["name"] = " empty_20",
        },
        [2] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sluss_door",
        },
        [3] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "Focus",
                        },
                },
                ["name"] = " Metal Door Slam",
        },
        [4] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Dish Door",
        },
        [5] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Stone Door",
        },
        [6] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Dam Door",
        },
        [7] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Metal Door",
        },
},
[32] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                },
                ["name"] = " empty_8",
        },
},
[33] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                },
                ["name"] = " empty_4",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                },
                ["name"] = " empty_3",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                },
                ["name"] = " empty_2",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                },
                ["name"] = " empty",
        },
        [5] = {
                ["index"] = 7,
                ["parameters"] = {
                },
                ["name"] = " empty_18",
        },
        [6] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Control_Panel_On",
        },
        [7] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Control_Panel_Off",
        },
        [8] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Control_Panel_Done",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " Disarm",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 25,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Panel Button",
        },
},
[34] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30000,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "Timeline",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Lightning",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Rain_HardSurface",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Rain_SoftSurface",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "precipitation",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Rain_Water",
        },
},
[35] = {
        [1] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "time",
                        },
                },
                ["name"] = " 17 - expl_antenna_destroy",
        },
        [2] = {
                ["index"] = 24,
                ["parameters"] = {
                },
                ["name"] = " _24",
        },
        [3] = {
                ["index"] = 25,
                ["parameters"] = {
                },
                ["name"] = " _25",
        },
        [4] = {
                ["index"] = 26,
                ["parameters"] = {
                },
                ["name"] = " _26",
        },
        [5] = {
                ["index"] = 27,
                ["parameters"] = {
                },
                ["name"] = " _27",
        },
        [6] = {
                ["index"] = 28,
                ["parameters"] = {
                },
                ["name"] = " _28",
        },
        [7] = {
                ["index"] = 29,
                ["parameters"] = {
                },
                ["name"] = " _29",
        },
        [8] = {
                ["index"] = 30,
                ["parameters"] = {
                },
                ["name"] = " _30",
        },
        [9] = {
                ["index"] = 31,
                ["parameters"] = {
                },
                ["name"] = " _31",
        },
        [10] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Space Rocket Engine",
        },
        [11] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Space Rocket Take Off",
        },
        [12] = {
                ["index"] = 41,
                ["parameters"] = {
                },
                ["name"] = " _41",
        },
        [13] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 6.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Silosphere",
        },
        [14] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Electric Small",
        },
        [15] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 75,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 2 - Electric Medium",
        },
        [16] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Electric Large",
        },
        [17] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Metal Chamber Huge",
        },
        [18] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Metal Chamber Large",
        },
        [19] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Metal Chamber Medium",
        },
        [20] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Metal Chamber Small",
        },
        [21] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Underwater Explosion",
        },
        [22] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "time",
                        },
                },
                ["name"] = " 14 - nodraket",
        },
        [23] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Barrel Explode",
        },
        [24] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 18 - Airplane Burning Engine",
        },
        [25] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 20 - Checkpoint Complete",
        },
        [26] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 32 - Airplane Crash",
        },
        [27] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Blimp Explode",
        },
        [28] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 90,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " Tire Explosion",
        },
        [29] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 800,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 38 - Space Rocket Explode (PH)",
        },
        [30] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " EMT Tower Explode",
        },
        [31] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 15,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 42 - Glassdome falling",
        },
        [32] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Canon_Explode",
        },
        [33] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 250,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " MetalGate_Explode",
        },
        [34] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 6,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Watermine Explosion",
        },
        [35] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Sub_Missile_Explo",
        },
        [36] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Temple Explosion",
        },
        [37] = {
                ["index"] = 50,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 50 - km07 cylinder e",
        },
        [38] = {
                ["index"] = 51,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 700,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " km07 cylinder L1",
        },
        [39] = {
                ["index"] = 52,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " km07 cylinder L2",
        },
        [40] = {
                ["index"] = 53,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 3.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " km07 G",
        },
        [41] = {
                ["index"] = 54,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " km07 T3",
        },
        [42] = {
                ["index"] = 55,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 600,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Explo Resource Fuel Depot",
        },
        [43] = {
                ["index"] = 57,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Lave Explosion",
        },
        [44] = {
                ["index"] = 58,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Glass cover f1m03",
        },
        [45] = {
                ["index"] = 59,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1.8,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " f1m08 fireplume",
        },
        [46] = {
                ["index"] = 60,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 60 - f2m07 icebreak",
        },
        [47] = {
                ["index"] = 61,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 5.5,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " f2m05 building destroyed",
        },
        [48] = {
                ["index"] = 62,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " f2m05 gate explosion",
        },
        [49] = {
                ["index"] = 63,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Lave Large Explosion",
        },
        [50] = {
                ["index"] = 64,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Seve Explosion",
        },
        [51] = {
                ["index"] = 65,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Helicopter & Plane Explosion",
        },
        [52] = {
                ["index"] = 66,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 6,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2m08 satellite explo",
        },
        [53] = {
                ["index"] = 67,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 700,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Big Plane Explosion",
        },
        [54] = {
                ["index"] = 69,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 600,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " f3m05 dish explosion",
        },
        [55] = {
                ["index"] = 73,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2m06 emptower active (PH)",
        },
        [56] = {
                ["index"] = 74,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 8,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 7000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2m06 emptower pulse (PH)",
        },
        [57] = {
                ["index"] = 75,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " f2m05 millround explo",
        },
        [58] = {
                ["index"] = 77,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Light Pillar km02",
        },
        [59] = {
                ["index"] = 78,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 80,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Nuke Engine",
        },
        [60] = {
                ["index"] = 79,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 80,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                },
                ["name"] = " Lasers",
        },
        [61] = {
                ["index"] = 80,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 80 ninja",
        },
        [62] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 16 - tower env_gb87_dest",
        },
        [63] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 39 - Airplane Hit",
        },
        [64] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Glasscrash",
        },
        [65] = {
                ["index"] = 71,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 7,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 71 - f3m05 dish impact",
        },
        [66] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1.5,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Wooden Crate",
        },
        [67] = {
                ["index"] = 76,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 2,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Wooden Fence",
        },
        [68] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 60,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " 21 - Headlight Explo",
        },
        [69] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Fuel Burning Small",
        },
        [70] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 5 - Fuel Burning Medium",
        },
        [71] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Fuel Burning Large",
        },
        [72] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "time",
                        },
                },
                ["name"] = " 7 - Gas",
        },
        [73] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 80,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 8 - Steam",
        },
        [74] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 600,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 19 - Checkpoint Flash",
        },
        [75] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " 22 - Airplane Broken Engine",
        },
        [76] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 10,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 2000,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Blimp On Fire",
        },
        [77] = {
                ["index"] = 68,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Water Cascade",
        },
        [78] = {
                ["index"] = 72,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 0.4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 150,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " f2m06 empfence (PH)",
        },
        [79] = {
                ["index"] = 49,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 50,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Engine damage",
        },
        [80] = {
                ["index"] = 56,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " Eng misfire",
        },
        [81] = {
                ["index"] = 70,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " 70 - f3m05 dish debris",
        },
},
[36] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Agency_Dial",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Agency_Off",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Agency_On",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_BlackHand_Dial",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_BlackHand_Off",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_BlackHand_On",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Gov_Dial",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Gov_Off",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Gov_On",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Reapers_Dial",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Reapers_Off",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Reapers_On",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Roaches_Dial",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Roaches_Off",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Roaches_On",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Ular_Dial",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Ular_Off",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                },
                ["name"] = " RadioComm_Ular_On",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param00",
                        },
                },
                ["name"] = " RadioComm_Broadcast_OnOff",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param00",
                        },
                },
                ["name"] = " RadioComm_Sheldon_Off",
        },
        [21] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "param00",
                        },
                },
                ["name"] = " RadioComm_Sheldon_On",
        },
},
[37] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " PostExplosion_All_Small",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " PostExplosion_All_Medium",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " PostExplosion_All_Large",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Rumble_Small",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Rumble_Medium",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Rumble_Large",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Stone_Small",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Stone_Medium",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Stone_Large",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Fire_Small",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Fire_Medium",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Fire_Large",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Metal_Small",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Metal_Medium",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Metal_Large",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Wood_Small",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Wood_Medium",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Wood_Large",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Glass_Small",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Glass_Medium",
        },
        [21] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Glass_Large",
        },
        [22] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 4,
                                ["name"] = "timeline",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Debris_Metal_Constraints",
        },
},
[38] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " crowds",
        },
        [2] = {
                ["index"] = 1,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_01",
        },
        [3] = {
                ["index"] = 2,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_02",
        },
        [4] = {
                ["index"] = 3,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_03",
        },
        [5] = {
                ["index"] = 4,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_04",
        },
        [6] = {
                ["index"] = 5,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s02_govelite_m_qq_01",
        },
        [7] = {
                ["index"] = 6,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s02_govelite_m_qq_02",
        },
        [8] = {
                ["index"] = 7,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s02_govelite_m_qq_03",
        },
        [9] = {
                ["index"] = 8,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s02_govelite_m_qq_04",
        },
        [10] = {
                ["index"] = 9,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s02_govelite_m_qq_05",
        },
        [11] = {
                ["index"] = 10,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s07_govelite_m_qq_01",
        },
        [12] = {
                ["index"] = 11,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s07_govelite_m_qq_02",
        },
        [13] = {
                ["index"] = 12,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s07_govelite_m_qq_03",
        },
        [14] = {
                ["index"] = 13,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s07_govelite_m_qq_04",
        },
        [15] = {
                ["index"] = 14,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f1s07_govelite_m_qq_05",
        },
        [16] = {
                ["index"] = 15,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2m07_govelite1_zz_m_04",
        },
        [17] = {
                ["index"] = 16,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2m07_scientist_zz_m_03",
        },
        [18] = {
                ["index"] = 17,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2m07_scientist_zz_m_031",
        },
        [19] = {
                ["index"] = 18,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s04_govelite_m_qq_01",
        },
        [20] = {
                ["index"] = 19,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s04_govelite_m_qq_02",
        },
        [21] = {
                ["index"] = 20,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s04_govelite_m_qq_03",
        },
        [22] = {
                ["index"] = 21,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s04_govelite_m_qq_04",
        },
        [23] = {
                ["index"] = 22,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s04_govelite_m_qq_05",
        },
        [24] = {
                ["index"] = 23,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s07_govelite_m_qq_01",
        },
        [25] = {
                ["index"] = 24,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s07_govelite_m_qq_02",
        },
        [26] = {
                ["index"] = 25,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s07_govelite_m_qq_03",
        },
        [27] = {
                ["index"] = 26,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s07_govelite_m_qq_04",
        },
        [28] = {
                ["index"] = 27,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f2s07_govelite_m_qq_05",
        },
        [29] = {
                ["index"] = 28,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_01",
        },
        [30] = {
                ["index"] = 29,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_02",
        },
        [31] = {
                ["index"] = 30,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_03",
        },
        [32] = {
                ["index"] = 31,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_04",
        },
        [33] = {
                ["index"] = 32,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_05",
        },
        [34] = {
                ["index"] = 33,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_06",
        },
        [35] = {
                ["index"] = 34,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_07",
        },
        [36] = {
                ["index"] = 35,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_08",
        },
        [37] = {
                ["index"] = 36,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_09",
        },
        [38] = {
                ["index"] = 37,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_10",
        },
        [39] = {
                ["index"] = 38,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_11",
        },
        [40] = {
                ["index"] = 39,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1500,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3m04_female_zz_f_12",
        },
        [41] = {
                ["index"] = 40,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s01_govelite_m_qq_01",
        },
        [42] = {
                ["index"] = 41,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s01_govelite_m_qq_02",
        },
        [43] = {
                ["index"] = 42,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s01_govelite_m_qq_03",
        },
        [44] = {
                ["index"] = 43,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s01_govelite_m_qq_04",
        },
        [45] = {
                ["index"] = 44,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s01_govelite_m_qq_05",
        },
        [46] = {
                ["index"] = 45,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s06_govelite_m_qq_01",
        },
        [47] = {
                ["index"] = 46,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s06_govelite_m_qq_02",
        },
        [48] = {
                ["index"] = 47,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s06_govelite_m_qq_03",
        },
        [49] = {
                ["index"] = 48,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " f3s06_govelite_m_qq_04",
        },
        [50] = {
                ["index"] = 49,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " gen_govpilot_m_qq_01",
        },
        [51] = {
                ["index"] = 50,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " gen_govpilot_m_qq_02",
        },
        [52] = {
                ["index"] = 51,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " gen_govpilot_m_qq_03",
        },
        [53] = {
                ["index"] = 52,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km04_govelite1_m_qq_02",
        },
        [54] = {
                ["index"] = 53,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km06_female_zz_01",
        },
        [55] = {
                ["index"] = 54,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km06_female_zz_02",
        },
        [56] = {
                ["index"] = 55,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_01",
        },
        [57] = {
                ["index"] = 56,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_02",
        },
        [58] = {
                ["index"] = 57,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_03",
        },
        [59] = {
                ["index"] = 58,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_04",
        },
        [60] = {
                ["index"] = 59,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_05",
        },
        [61] = {
                ["index"] = 60,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_06",
        },
        [62] = {
                ["index"] = 61,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_07",
        },
        [63] = {
                ["index"] = 62,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_08",
        },
        [64] = {
                ["index"] = 63,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_09",
        },
        [65] = {
                ["index"] = 64,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_10",
        },
        [66] = {
                ["index"] = 65,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_11",
        },
        [67] = {
                ["index"] = 66,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_12",
        },
        [68] = {
                ["index"] = 67,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_13",
        },
        [69] = {
                ["index"] = 68,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km07_countdown_f_qq_14",
        },
        [70] = {
                ["index"] = 69,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_01",
        },
        [71] = {
                ["index"] = 70,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_02",
        },
        [72] = {
                ["index"] = 71,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_03",
        },
        [73] = {
                ["index"] = 72,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_04",
        },
        [74] = {
                ["index"] = 73,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_05",
        },
        [75] = {
                ["index"] = 74,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_06",
        },
        [76] = {
                ["index"] = 75,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_07",
        },
        [77] = {
                ["index"] = 76,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_08",
        },
        [78] = {
                ["index"] = 77,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_09",
        },
        [79] = {
                ["index"] = 78,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp1_m_qq_10",
        },
        [80] = {
                ["index"] = 79,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_01",
        },
        [81] = {
                ["index"] = 80,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_02",
        },
        [82] = {
                ["index"] = 81,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_03",
        },
        [83] = {
                ["index"] = 82,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_04",
        },
        [84] = {
                ["index"] = 83,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_05",
        },
        [85] = {
                ["index"] = 84,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_06",
        },
        [86] = {
                ["index"] = 85,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_07",
        },
        [87] = {
                ["index"] = 86,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_08",
        },
        [88] = {
                ["index"] = 87,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_09",
        },
        [89] = {
                ["index"] = 88,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " wsim_govmp2_m_qq_10",
        },
        [90] = {
                ["index"] = 89,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_05",
        },
        [91] = {
                ["index"] = 90,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_06",
        },
        [92] = {
                ["index"] = 91,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_07",
        },
        [93] = {
                ["index"] = 92,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_08",
        },
        [94] = {
                ["index"] = 93,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_09",
        },
        [95] = {
                ["index"] = 94,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_10",
        },
        [96] = {
                ["index"] = 95,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_11",
        },
        [97] = {
                ["index"] = 96,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_12",
        },
        [98] = {
                ["index"] = 97,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 100,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " dpv_baby_m_qq_13",
        },
        [99] = {
                ["index"] = 98,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " km04_govelite1_m_qq_01",
        },
        [100] = {
                ["index"] = 99,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1000,
                                ["name"] = "(distance)",
                        },
                },
                ["name"] = " cut0401_baby_m_qq_01",
        },
},
[39] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 20,
                                ["name"] = "amount",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 300,
                                ["name"] = "averagedistance",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 400,
                                ["name"] = "height",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 30,
                                ["name"] = "variation",
                        },
                },
                ["name"] = " Traffic",
        },
},
[40] = {
        [1] = {
                ["index"] = 0,
                ["parameters"] = {
                        [1] = {
                                ["index"] = 0,
                                ["min"] = 0,
                                ["max"] = 0.5,
                                ["name"] = "size",
                        },
                        [2] = {
                                ["index"] = 1,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "panic",
                        },
                        [3] = {
                                ["index"] = 2,
                                ["min"] = 0,
                                ["max"] = 40,
                                ["name"] = "variation",
                        },
                        [4] = {
                                ["index"] = 3,
                                ["min"] = 0,
                                ["max"] = 200,
                                ["name"] = "(distance)",
                        },
                        [5] = {
                                ["index"] = 4,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "focus",
                        },
                        [6] = {
                                ["index"] = 5,
                                ["min"] = 0,
                                ["max"] = 1,
                                ["name"] = "3dspread",
                        },
                },
                ["name"] = " Crowd_General_City_Amb",
        },
}
}
return archive
end