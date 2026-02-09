#include "..\script_component.hpp"

params ["_unit","_position"];

private _assignedTarget = assignedTarget _unit;
private _range = GVAR(toleranceRange);
private _posClose = ((_position distance2D _assignedTarget) < _range);

LOG_4("Monitoring boost - Unit:%1, Alive:%2, AssignTarget: %3, Close:%4",_unit,alive _unit,_assignedTarget,_posClose);

private _delay = GVAR(targetChangeSleepTime);
while {(alive _unit) && {_posClose}} do {
    sleep _delay;
	private _newTarget = assignedTarget _unit;
    if(isNull _newTarget) exitWith { };
	if (_assignedTarget isEqualTo _newTarget) then {
		_posClose = ((_position distance2D _assignedTarget) < _range);
	} else {
		if ((_assignedTarget distance2D _newTarget) > GVAR(toleranceChange)) exitWith { 
			_posClose = [0,0,0];
		};
		_position = getPosWorld _assignedTarget;
		_assignedTarget = _newTarget;
		private _boostParameters = _unit getVariable ["CF_BAI_boost",[objNull,[0,0,0],0,0]];
		_boostParameters set [0,_newTarget];
		_boostParameters set [1,_position]; // shift boost position to original target
		_boostParameters set [3,cba_missionTime]; // delay boost interval
		_unit setVariable ["CF_BAI_boost",_boostParameters,false];
	};
};

LOG_4("Terminating boost for Unit:%1, Alive: %2, Close:%3, AssignedTarget:%4",_unit,alive _unit,_posClose,_assignedTarget);
if (alive _unit) then { [_unit,1.0] call FUNC(setSubSkills); };

_unit setVariable ["CF_BAI_boost",nil,false];
