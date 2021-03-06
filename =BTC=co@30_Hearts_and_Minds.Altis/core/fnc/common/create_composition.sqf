
/* ----------------------------------------------------------------------------
Function: btc_fnc_create_composition

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]
    _setdir - [Number]
    _array - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_create_composition;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]],
    ["_setdir", 0, [0]],
    ["_array", [], [[]]]
];
_pos params ["_pos_x", "_pos_y", ["_pos_z", 0]];

_array apply {
    _x params ["_type", "_dir", "_rel_pos"];
    _rel_pos params ["_rel_x", "_rel_y", ["_rel_z", 0]];

    //// Determine position function of setdir \\\\
    private _final = [_pos_x + _rel_x*cos(_setdir) - _rel_y*sin(- _setdir), _pos_y + _rel_y*cos(_setdir) + _rel_x*sin(- _setdir)];
    _final pushBack (_pos_z + _rel_z + getTerrainHeightASL _final);
    private _obj = createVehicle [_type, ASLToATL _final, [], 0, "CAN_COLLIDE"];
    //// Determine direction function of setdir \\\\
    _obj setDir (_dir + _setdir);

    _obj setVectorUp surfaceNormal position _obj;
    _obj setPosWorld getPosWorld _obj;
    _obj;
};
