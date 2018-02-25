/**********************************************
@File=fn_systemMessage.sqf
@Author=Heisen
@LastEditor=Heisen
**********************************************/


params [
	["_keyTitle",""],
	["_keyInformation",""]
]; 


diag_log format ["Server:: %1 :: %2",_keyTitle,_keyInformation];
hint format ["Server:: %1 :: %2",_keyTitle,_keyInformation];
systemChat format ["Server:: %1 :: %2",_keyTitle,_keyInformation];