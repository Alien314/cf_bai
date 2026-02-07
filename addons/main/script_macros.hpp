//#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros_common.hpp"

#ifdef DISABLE_COMPILE_CACHE
  #undef PREP
  #undef PREPMAIN
  #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
  #define PREPMAIN(var1) TRIPLES(PREFIX,fnc,var1) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,var1).sqf)
#else
  #undef PREP
  #undef PREPMAIN
  #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
  #define PREPMAIN(var1) [QPATHTOF(functions\DOUBLES(fnc,var1).sqf), 'TRIPLES(PREFIX,fnc,var1)'] call  CBA_fnc_compileFunction
#endif
