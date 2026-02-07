
class Extended_PreInit_EventHandlers {
    class CF_BAI_suppression {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\suppression\XEH_preInit.sqf'";
    };
};

class Extended_Init_EventHandlers {
    class CAManBase {
        class CF_BAI_suppression {
            init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\suppression\XEH_init.sqf'";
        };
    };
};


class Extended_PreStart_EventHandlers {
    class CF_BAI_suppression {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\suppression\XEH_preStart.sqf'";
    };
};
