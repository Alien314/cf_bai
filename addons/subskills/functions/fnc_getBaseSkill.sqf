params ["_unit","_subSkill","_maximumSkill"];

private _baseSkill = _maximumSkill;
if( _maximumSkill <= 0.0 ) then {
	_baseSkill = _unit skill _subSkill;
};

_baseSkill;
