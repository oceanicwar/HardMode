DELETE FROM `hardmode_auras`;
INSERT INTO `hardmode_auras` (`mode`, `aura`, `description`) VALUES
	(1, 52670, 'Mild Red Aura');

DELETE FROM `hardmode_modes`;
INSERT INTO `hardmode_modes` (`id`, `name`, `description`, `restrictions`, `enabled`) VALUES
	(1, '|cffff0000Hardcore|r', 'Permadeath', 1204216, 1),
	(2, '|cff00ff00Self Crafted|r', 'Self Crafted', 147708, 1),
	(3, '|cffffff00Slow XP|r', 'Retail XP', 131074, 1),
    (4, '|cffff8000Hell|r', 'No talents with poor loot and half modifiers', 966904, 1);

DELETE FROM `hardmode_rewards`;
INSERT INTO `hardmode_rewards` (`mode`, `reward_level`, `reward_type`, `reward_id`, `reward_count`, `comment`) VALUES
	(1, 80, 0, 37711, 3000, 'Hardcore - Item - Oceanic War Coin'),
	(1, 80, 0, 44164, 1, 'Hardcore - Item - Reins of the Black Proto-Drake'),
	(1, 80, 1, 141, 0, 'Hardcore - Title - The Immortal'),
	(2, 80, 0, 37711, 2000, 'SelfCraft - Item - Oceanic War Coin'),
	(2, 80, 0, 54811, 1, 'SelfCraft - Item - Celestial Steed'),
	(2, 80, 1, 128, 0, 'SelfCraft - Title - Flawless Victor'),
	(3, 80, 0, 13325, 1, 'SlowXP - Item - Fluorescent Green Mechanostrider'),
	(3, 80, 0, 37711, 1000, 'SlowXP - Item - Oceanic War Coin'),
	(3, 80, 1, 46, 0, 'SlowXP - Title - Scarab Lord');
