#define PREFIX CF_BAI

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.88
#define REQUIRED_CBA_VERSION {3,9,0}

#define COMPONENT_NAME QUOTE(PREFIX - COMPONENT)
