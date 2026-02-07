#include "..\script_component.hpp"

params ["_unit"];

if (GVAR(disableBoost) || {
	!(local _unit) || {
		(isPlayer _unit) } } ) exitWith {};

LOG_1("Fire handler added to unit:%1",_unit);

_unit setVariable ["cf_bai_boostInit",true];

_unit addEventHandler ["FiredMan", {
	_this call FUNC(fired);
}];

_unit addEventHandler ["Local", {
	params ["_unit", "_isLocal"];
	if (!_isLocal) exitWith {};
	private _init = _unit getVariable ["cf_bai_boostInit",false];
	if (_init) exitWith {};
	_unit setVariable ["cf_bai_boostInit",true];
	_unit addEventHandler ["FiredMan", {
		_this call FUNC(fired);
	}];
}];
