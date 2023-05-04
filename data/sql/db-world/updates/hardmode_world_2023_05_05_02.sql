DELETE FROM `hardmode_rewards`;
INSERT INTO `hardmode_rewards` (`mode`, `reward_type`, `reward_id`, `reward_count`, `comment`) VALUES
	(0, 0, 37711, 1000, 'SelfCraft - Item - Oceanic War Coin'),
	(0, 0, 54811, 1, 'SelfCraft - Item - Celestial Steed'),
	(0, 1, 128, 0, 'SelfCraft - Title - Flawless Victor'),
	(1, 0, 37711, 2000, 'Hardcore - Item - Oceanic War Coin'),
	(1, 0, 44164, 1, 'Hardcore - Item - Reins of the Black Proto-Drake'),
	(1, 1, 141, 0, 'Hardcore - Title - The Immortal'),
	(2, 0, 13325, 1, 'SlowXP - Item - Fluorescent Green Mechanostrider'),
	(2, 0, 37711, 500, 'SlowXP - Item - Oceanic War Coin'),
	(2, 1, 46, 0, 'SlowXP - Title - Scarab Lord');
