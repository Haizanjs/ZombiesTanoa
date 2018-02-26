/**********************************************
@File=fn_getDamageModel.sqf
@Author=Heisen
@LastEditor=Heisen
**********************************************/


_missionConfigFile = (missionConfigFile >> "cfgDamage");
_configuredDamageModel = getNumber (_missionConfigFile >> "damageModel" >> "handler");

if !(_configuredDamageModel IN [1,2]) exitWith {
	["Configured Damage Model not found: configured >>",_configuredDamageModel] call Client_fnc_systemMessage;
};