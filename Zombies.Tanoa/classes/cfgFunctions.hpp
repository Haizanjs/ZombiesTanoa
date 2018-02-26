//cfgFunctions.hpp


class CfgFunctions
{
	class Client
	{
		class Core_Functions
		{
			file = "functions";
			class spawnZombieAgent {};
		};
		class Core_sys_behaviour
		{
			file = "functions\sys_behaviour";
			class findPlayer_ZombieAgent {};
			class logicZombieAgent {};
		};
		class Core_sys_damage
		{
			file = "functions\sys_damage";
			class getDamageModel {};
		};
		class Core_sys_util
		{
			file = "functions\sys_util";
			class systemMessage {};
		};
	};
};