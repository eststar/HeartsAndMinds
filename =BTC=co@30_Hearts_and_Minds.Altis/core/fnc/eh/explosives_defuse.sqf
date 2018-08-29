
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_explosives_defuse

Description:
    Fill me when you edit me !

Parameters:
    _ied - [Object]
    _unit - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_explosives_defuse;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_ied", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

private _type_ied = typeOf _ied;
if ((_type_ied select [0, _type_ied find "_"]) in (btc_type_ieds_ace apply {_x select [0, _x find "_"]})) then {
    btc_rep_bonus_disarm call btc_fnc_rep_change;
};
