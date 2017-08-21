if (!variable_global_exists("steamUGCChecked")) {
	global.steamUGCChecked = false;
}

if (!global.steamUGCChecked) {

	global.hasModType = ds_map_create();
	global.steamUGCItemsList = ds_list_create();
	global.steamUGCItemsListFolder = ds_list_create();
	//global.steamUGCItemsListData = ds_list_create();
	global.steamUGCChecked = steam_ugc_get_subscribed_items(global.steamUGCItemsList);

	//init mod types
	ds_map_add(global.hasModType, "gun", false);
	
	//
	if (global.steamUGCChecked) {
		show_debug_message("steamUGCChecked");
		for (var i = 0; i < ds_list_size(global.steamUGCItemsList); i += 1)
		{
			var value = ds_list_find_value(global.steamUGCItemsList, i);
			show_debug_message(value);	
			var item_map = ds_map_create();
			var itemInfoLoaded = steam_ugc_get_item_install_info(value, item_map);
			if (itemInfoLoaded) {
				show_debug_message("itemInfoLoaded");	
				folder = string(item_map[? "folder"]);	
				show_debug_message("folder: " + folder);		
			
				configFolder = string_replace_all(folder, "\\", "\\\\");
				configFilename = "config.json";
				fullPath = configFolder + "\\" + configFilename;
				if file_exists(fullPath)
				{
					show_debug_message("file exists 2");		
					var num = 0;
				
					file = file_text_open_read(fullPath);
					jsonStr = "";
					while (!file_text_eoln(file))
					{
						jsonStr = jsonStr + file_text_readln(file);
					}
					file_text_close(file);
	
					// check load data into vars
					configDataMap = json_decode(jsonStr);
					if (configDataMap == -1) show_debug_message("Invalid mod data "+value);
					// todo: create a global for each type of mod
					// eg: gunsList, charactersList
					// so you can tell how many of each type exists, for endless shop and chests
					if (configDataMap != -1) {
						ds_list_add(global.steamUGCItemsListFolder, configFolder);
						//ds_list_add(global.steamUGCItemsListData, jsonStr);
						show_debug_message(global.steamUGCItemsListFolder[| i]);
						//show_debug_message(global.steamUGCItemsListData[| i]);
						
						ds_map_replace(global.hasModType, "gun", true);
					}
				}
			} else {
				show_debug_message("itemInfoLoaded false");		
			}
			//steam_details = steam_ugc_request_item_details(value, 60);
		}
		show_debug_message("steamUGCLoaded");
	} else {
		show_debug_message("steamUGCChecked false");
	}
}
