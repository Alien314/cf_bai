#include "..\script_component.hpp"
params ["_unit","_terrain_impact"];
	
if !(_unit getVariable ["CF_BAI_MAXIMUM",false]) then {
	private _baseSkills = [
		[_unit,"aimingAccuracy",GVAR(maximum_aimingAccuracy)] call FUNC(getBaseSkill),
		[_unit,"aimingShake",GVAR(maximum_aimingShake)] call FUNC(getBaseSkill),
		[_unit,"aimingSpeed",GVAR(maximum_aimingSpeed)] call FUNC(getBaseSkill),
		[_unit,"spotDistance",GVAR(maximum_spotDistance)] call FUNC(getBaseSkill),
		[_unit,"spotTime",GVAR(maximum_spotTime)] call FUNC(getBaseSkill),
		[_unit,"courage",GVAR(maximum_courage)] call FUNC(getBaseSkill),
		[_unit,"reloadSpeed",GVAR(maximum_reloadSpeed)] call FUNC(getBaseSkill),
		[_unit,"commanding",GVAR(maximum_commanding)] call FUNC(getBaseSkill),
		[_unit,"general",GVAR(maximum_general)] call FUNC(getBaseSkill)
	];

	[_unit,_baseSkills] call CF_BAI_fnc_setBaseSkills;
	_unit setVariable ["CF_BAI_MAXIMUM",true,false];

	LOG_2("Unit: %1, set the base skills to %2",_unit,_baseSkills);
};

private _skillParameters = [
	[_terrain_impact,GVAR(minimum_aimingAccuracy)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_aimingShake)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_aimingSpeed)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_spotDistance)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_spotTime)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_courage)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_reloadSpeed)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_commanding)] call FUNC(getAdjustmentToSkill),
	[_terrain_impact,GVAR(minimum_general)] call FUNC(getAdjustmentToSkill)
];

[allUnits select 0,"CF_BAI_subskills",_skillParameters] call CF_BAI_fnc_setSkillsParameters;
