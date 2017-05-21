///Bootstrap
draw_texture_flush();
randomize();
//shadow_init(0.4);
//reflection_init();

// Sync Save
save_sync_read();
screen_update();

//Version
global.currentVersionNumber = "YEAR 2 - UPDATE 14";

//Multiplayer & Mode
global.playerCount = 1;
global.gameMode = gamemode_adventure;
global.currentLoop = 0;
global.isDaily = false;

//Global Data Structures
global.challengeList = ds_list_create();
global.challengeForbiddenList = ds_list_create();

//Sync 
ini_open(working_directory + "\\saveData.ini");
ini_write_string("Version","Version",global.currentVersionNumber);
ini_write_real("Character","playerCount",global.playerCount);
ini_write_real("Temp","isDaily",global.isDaily);
ini_write_real("Temp","Loop",global.currentLoop);

ini_close();

//Language Init
global.loc_map = noone;
loc_init();

// Debug Shit, don't mess with this
audio_stop_all();
if (!audio_group_is_loaded(ag_music)) audio_group_load(ag_music);

if (os_type == os_macosx) global.version = os_macosx;
else if (os_type == os_linux) global.version = os_linux;
else global.version = os_windows;

joy_init();

volume_update();

room_goto_next();



