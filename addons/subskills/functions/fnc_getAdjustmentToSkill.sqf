params ["_terrain","_subSkillMultiplier"];

private _a = 1-_subSkillMultiplier;
private _x2 = _terrain * _terrain;

1 - (_a * _x2);
