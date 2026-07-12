#include "script_component.hpp"

params ["_unit"];

if (GVAR(disableSuppression)) exitWith {
	INFO("Suppression module disabled");
};

_unit addEventHandler ["Suppressed", {
	params ["_unit"];
	[_unit] call FUNC(updateSuppression);
}];

if (isPlayer _unit || !(local _unit)) exitWith {
	LOG_2("Unit %1 of type %2 is not tracking suppression",_unit,typeof _unit);
};

//[_unit] call FUNC(updateSuppression);
