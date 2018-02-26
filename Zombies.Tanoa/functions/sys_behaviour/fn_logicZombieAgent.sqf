/**********************************************
@File=fn_logicZombieAgent.sqf
@Author=Heisen
@LastEditor=Heisen
@Desc=Main control over behavior of the Zombie Agent!
**********************************************/


[_this select 0] spawn {
	params [
		["_zombie",objNull]
	];

	if (_zombie isEqualTo objNull) exitWith {};

	_zombie disableAI "FSM";
	_zombie setBehaviour "CARELESS";

	for "_i" from 0 to 1 step +0 do {
		sleep 1;
		
		if !(_zombie getVariable "isZombieListening") exitWith {
			ActiveZombies deleteAt (ActiveZombies find _zombie);
			publicVariable "ActiveZombies";
			deleteVehicle _zombie;
		};
		
		_nearPlyUnit = [_zombie] call Client_fnc_findPlayer_ZombieAgent;
		if (count _nearPlyUnit >=1) then {
			
			if !((floor random 100) >= 96) then {
				_zombie moveTo (getPosATL (_nearPlyUnit select 0));
				if ((_zombie distance (_nearPlyUnit select 0)) <=1.5) then {
					_nearPlyUnit_damage = damage (_nearPlyUnit select 0);
					_damageGive = random [0.1,0.2,0.3];
					(_nearPlyUnit select 0) setDamage (_nearPlyUnit_damage + _damageGive);
					hint format ["Damage Taken; %2 %1",(_nearPlyUnit_damage + _damageGive),_damageGive];
				};
				
			} else {
				_zombiePos = getPosATL _zombie;
				_zombie moveTo [(_zombiePos select 0) + (random [-5,0,5]),(_zombiePos select 1) + (random [-5,0,5]),(_zombiePos select 2)];
			};
		} else {
			_zombiePos = getPosATL _zombie;
			_zombie moveTo [(_zombiePos select 0) + (random [-5,0,5]),(_zombiePos select 1) + (random [-5,0,5]),(_zombiePos select 2)];
		};
		systemChat str (getPosATL _zombie);
	};
};