#include "script_component.hpp"
class CfgPatches
{
	class ADDON
		{
			name = COMPONENT_NAME;
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_MAIN"};
			requiredVersion = REQUIRED_VERSION;
			author = "BrightCandle";
			authors[]= {"BrightCandle"};
			url = "https://www.charliefoxtrotops.com";
			VERSION_CONFIG;
		};
};

//#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"
