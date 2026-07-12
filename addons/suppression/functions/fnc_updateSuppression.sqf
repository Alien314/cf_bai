#include "..\script_component.hpp"

params ["_unit"];

if (!(alive _unit && {local _unit}) || { isPlayer _unit }) exitWith {};

private _suppression = (_unit getVariable [QGVAR(suppression),0]);
//private _lastSuppressed=0;
//private _prior = (_unit getVariable [QGVAR(priorSupp),0]);

//while {alive _unit} do {
	private _current = getSuppression _unit;
	
	if (_current > 0) then {
		_suppression = (_suppression + GVAR(bulletImpact)) min 1.0;
		[_unit,_suppression] call FUNC(setSubSkills);

		_unit setVariable [QGVAR(suppression),_suppression];

		LOG_3("Unit: %1, Increased Suppression to: %2 with input unit suppression: %3",_unit,_suppression,_current);
	};

	private _decay = _unit getVariable [QGVAR(decay),nil];
	if !(isNil "_decay") then { terminate _decay; };
    _unit setVariable [QGVAR(decay), ([_unit,_suppression] spawn { sleep GVAR(heldTime);
		params ['_unit','_suppression'];
		while { alive _unit && {_suppression > 0} } do {

			_suppression = (_suppression - GVAR(decay)) max 0;
			
			[_unit,_suppression] call FUNC(setSubSkills);

			_unit setVariable [QGVAR(suppression),_suppression];

			LOG_2("Unit: %1, decayed suppression to: %2",_unit,_suppression);

			sleep 0.1;
		};

		_unit setVariable [QGVAR(suppression),nil];

		LOG_1("Unit: %1 died or no longer suppressed.",_unit);
	})];
/*
	if (_suppression > 0.0) then {
		if((time - _lastSuppressed) > GVAR(heldTime)) then {
			_suppression = (_suppression - GVAR(decay)) max 0;
			
			[_unit,_suppression] call FUNC(setSubSkills);

			LOG_2("Unit: %1, decayed suppression to: %2",_unit,_suppression);
		};
	};
	_prior = _current;
*/
//	sleep 0.1;
//};

//LOG_1("Unit: %1 died",_unit);
