/**********************************************
@File=fn_logicZombieSniff.sqf
@Author=Heisen
@LastEditor=Heisen
**********************************************/


private ["_bad"];
params [
	"_zombie"
];

_bad = [];

if (isMultiplayer) then {

	{
		if ((_x distance _zombie) <= 15) then {
			_bad pushback _x;
		};
	} forEach allPlayers;

} else {

	{
		if !(_x isEqualTo _zombie) then {
			if ((_x distance _zombie) <= 15) then {
				_bad pushback _x;
			};
		};
	} forEach allUnits;

};

_bad;