Config = {}

Config.NotifyType = "okok"                                  -- Notification type: 'qb' for qb-core standard notifications, 'okok' for okokNotify notifications

Config.GloveTearFailChance = 15 
Config.GloveTearSuccessChance = 2    

Config.cokeField = vector3(2864.44, 4642.98, 48.63)     
Config.cokeHeight = 49.66                              
Config.cokeRounded = 19  
Config.cokeProp = `h4_prop_bush_cocaplant_01` 
Config.UseGloves = true  
-------------
--MZ-SKILLS--
-------------
Config.mzskills = true                                      -- Change to "false" to run resource without regard to mz-skills "Drug Manufacturing"
-- if "Config.mzskills = true", then the following parameters apply: 
Config.drugXPlow = 1                                        -- Lowest "Drug Manufacture" XP awarded to the player.
Config.drugXPhigh = 3                                       -- Highest "Drug Manufacture" XP awarded to the player.
Config.drugXPloss = 10                                       -- "Drug Manufacture" XP lost for failing the skill check.

---------------
--SKILL CHECK--
---------------
Config.skillcheck = true                                    -- Change to "false" to remove skill checks from picking and crafting processes.
Config.SkillUse = 'ps-ui'                                   -- Change to either 'ps-ui' for picking the mucokes or 'skillbar' for the qb-skillbar export.
Config.SkillbarDuration = math.random(2000, 4000)           -- How long the skill bar runs for.
Config.SkillbarPos = math.random(20, 30)                    -- How far to the right the static box is.
Config.SkillbarWidth = math.random(20, 30)                  -- How wide the static box is.
--Picking cokes
Config.cokeskillCheck = 1                                  -- Lowest number of parses of the skill check.
Config.cokeskillTime = 10                                  -- Time to complete the skill check; the lower, the more difficult.
Config.Doublechance = 10

--Bag up cokes
Config.BagcokesLow = 3                                     -- Lowest number of parses of the skill check.
Config.BagcokesHigh = 5                                    -- Highest number of parses of the skill check.
Config.BagcokesTimeLow = 4                                 -- Lowest time it takes (in seconds) to bag up cokes.
Config.BagcokesTimeHigh = 8                                -- Highest time it takes (in seconds) to bag up cokes.
Config.cokesNeeded = 5                                  -- Number of cokes needed to bag them up.
Config.BagsNeeded = 15  
Config.SodaNeeded = 1   
Config.cocainebrickNeeded = 100  

                              -- Number of cokes needed to bag them up.

--OUTPUT--
----------
-- if "Config.mzskills = true", then the following parameters apply: 
-- (amount of the final product the player gets based on Drug Manufacturing level - with mz-skills)
--Level 0--
Config.cokelevel0low = 5
Config.cokelevel0high = 7
--Level 1--
Config.cokelevel1low = 7
Config.cokelevel1high = 10
--Level 2--
Config.cokelevel2low = 10
Config.cokelevel2high = 13
--Level 3--
Config.cokelevel3low = 13
Config.cokelevel3high = 15
--Level 4--
Config.cokelevel4low = 15
Config.cokelevel4high = 16
--Level 5--
Config.cokelevel5low = 16
Config.cokelevel5high = 17
--Level 6--
Config.cokelevel6low = 17
Config.cokelevel6high = 18
--Level 7--
Config.cokelevel7low = 19
Config.cokelevel7high = 20
--Level 8--
Config.cokelevel8low = 20
Config.cokelevel8high = 21

-- if "Config.mzskills = false", then the following parameters apply: 
--OUTPUT (amount of the final product the player gets based on Drug Manufacturing level - with no mz-skills)
Config.cokeNoXPlow = 3
Config.cokeNoXPhigh = 5

Config.cocainelevel0low = 1
Config.cocainelevel0high = 3
--Level 1--
Config.cocainelevel1low = 2
Config.cocainelevel1high = 4
--Level 2--
Config.cocainelevel2low = 3
Config.cocainelevel2high = 5
--Level 3--
Config.cocainelevel3low = 3
Config.cocainelevel3high = 7
--Level 4--
Config.cocainelevel4low = 4
Config.cocainelevel4high = 8
--Level 5--
Config.cocainelevel5low = 4
Config.cocainelevel5high = 10
--Level 6--
Config.cocainelevel6low = 5
Config.cocainelevel6high = 11
--Level 7--
Config.cocainelevel7low = 6
Config.cocainelevel7high = 12
--Level 8--
Config.cocainelevel8low = 6
Config.cocainelevel8high = 14

-- if "Config.mzskills = false", then the following parameters apply: 
--OUTPUT (amount of the final product the player gets based on Drug Manufacturing level - with no mz-skills)
Config.cocaineNoXPlow = 3
Config.cocaineNoXPhigh = 5

