//execVM "DemoText.sqf";
onMapSingleClick "player setpos _pos";

while { true } do {
  _units = allUnits - ( playableUnits + switchableUnits );
  {
    if(isNil { _x getVariable "unitHasFSM" } && {!captive _x}) then {
      //_x doFSM ["aegis_surrender.fsm", Position _x, _x]; //Sobrescreve o comportamento da AI
      _x execFSM "aegis_surrender.fsm";
      _x setVariable ["unitHasFSM", true];
      sleep 1;
    };
  } forEach _units;
};
sleep 1;
