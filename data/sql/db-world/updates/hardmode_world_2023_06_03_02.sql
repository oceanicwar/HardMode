DELETE FROM `hardmode_auras`;
INSERT INTO `hardmode_auras` (`mode`, `aura`, `description`) VALUES
	(1, 52670, 'Mild Red Aura');

DELETE FROM `hardmode_modes`;
INSERT INTO `hardmode_modes` (`id`, `name`, `description`, `restrictions`, `enabled`) VALUES
	(1, '|cffff0000Hardcore|r', 'Permadeath and limited services.', 155640, 1),
	(2, '|cff00ff00Self Crafted|r', 'Self Crafted items only and limited services.', 147708, 1),
	(3, '|cffffff00Slow XP|r', 'Retail 1x XP and must group with others within 3 levels, no other limitations.', 131074, 1),
    (4, '|cffff8000Hell|r', 'Half size, speed, damage, no talents, low drop rate and limited services.', 966904, 1);

DELETE FROM `hardmode_rewards`;
INSERT INTO `hardmode_rewards` (`mode`, `reward_level`, `reward_type`, `reward_id`, `reward_count`, `comment`) VALUES
	(1, 80, 0, 37711, 2000, 'Hardcore - Item - Oceanic War Coin'),
	(1, 80, 0, 44164, 1, 'Hardcore - Item - Reins of the Black Proto-Drake'),
	(1, 80, 1, 141, 0, 'Hardcore - Title - The Immortal'),
	(2, 80, 0, 37711, 1000, 'SelfCraft - Item - Oceanic War Coin'),
	(2, 80, 0, 54811, 1, 'SelfCraft - Item - Celestial Steed'),
	(2, 80, 1, 128, 0, 'SelfCraft - Title - Flawless Victor'),
	(3, 80, 0, 13325, 1, 'SlowXP - Item - Fluorescent Green Mechanostrider'),
	(3, 80, 0, 37711, 500, 'SlowXP - Item - Oceanic War Coin'),
	(3, 80, 1, 46, 0, 'SlowXP - Title - Scarab Lord');
