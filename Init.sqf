//execVM "DemoText.sqf";
onMapSingleClick "player setpos _pos";

while { true } do {
  _units = allUnits - ( playableUnits + switchableUnits );
  {
    if(isNil { _x getVariable "unitHasFSM" } && {!captive _x}) then {
      //_x doFSM ["Surrender.fsm", Position _x, _x]; //Sobrescvre o comportamento da AI
      _x execFSM "Surrender.fsm";
      _x setVariable ["unitHasFSM", true];
      sleep 1;
    };
  } forEach _units;
};
sleep 1;
