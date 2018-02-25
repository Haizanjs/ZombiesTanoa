/**********************************************
@File=fn_spawnZombieAgent.sqf
@Author=Heisen
@LastEditor=Heisen
**********************************************/


params [
	["_zombieStartPoint",[0,0,0]]
];

if (_zombieStartPoint isEqualTo [0,0,0]) exitWith {
	["Zombie Creation Failed","Location not provided"] call Client_fnc_systemMessage;
};

_zombiesTypes = getArray(missionConfigFile >> "cfgZombies" >> "zombieTypes" >> "zombies");
_zombieClass = selectRandom _zombiesTypes;

_unit = createAgent [_zombieClass,_zombieStartPoint, [], 0, "NONE"];
_unit setVariable ["isZombieAlive",true,true];
_unit setVariable ["isZombieListening",true,true];

[_unit] remoteExec ["Client_fnc_logicZombieAgent",_unit];

ActiveZombies pushback _unit;

