#include "..\script_component.hpp"

params ["_unit","_boost"];

["CF_BAI_boost",_unit,"aimingAccuracy",_boost] call FUNCMAIN(setSkillParameter);
["CF_BAI_boost",_unit,"aimingShake",_boost] call FUNCMAIN(setSkillParameter);
["CF_BAI_boost",_unit,"aimingSpeed",_boost] call FUNCMAIN(setSkillParameter);
