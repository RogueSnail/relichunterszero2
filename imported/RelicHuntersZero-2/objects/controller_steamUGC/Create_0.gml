global.steamUGCChecked = false;
global.steamUGCLoaded = false;
global.steamUGCItemsList = ds_list_create();
global.steamUGCChecked = steam_ugc_get_subscribed_items(global.steamUGCItemsList);

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
			
			configDirectory = string_replace_all(folder, "\\", "\\\\");
			configFilename = "config.json";
			fullPath = configDirectory + "\\" + configFilename;
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
	
				// load data into vars
				configDataMap = json_decode(jsonStr);

				show_debug_message(configDataMap);

				// TODO: validate if is a valid config (eg: has all required properties?)

				// load data
				type = ds_map_find_value(configDataMap, "type");
				name = ds_map_find_value(configDataMap, "name");
				droppable = ds_map_find_value(configDataMap, "droppable");
				armory = ds_map_find_value(configDataMap, "armory");
				price = ds_map_find_value(configDataMap, "price");
				capacity = ds_map_find_value(configDataMap, "capacity");
				fire_rate_per_second = ds_map_find_value(configDataMap, "fire_rate_per_second");
				damage = ds_map_find_value(configDataMap, "damage");
				bullets_per_shot = ds_map_find_value(configDataMap, "bullets_per_shot");
				ammo_type = ds_map_find_value(configDataMap, "ammo_type");
				spread_angle = ds_map_find_value(configDataMap, "spread_angle");
				recoil_pixels = ds_map_find_value(configDataMap, "recoil_pixels");
				recoil_character_pixels = ds_map_find_value(configDataMap, "recoil_character_pixels");
				screen_shake_force = ds_map_find_value(configDataMap, "screen_shake_force");
				screen_shake_seconds = ds_map_find_value(configDataMap, "screen_shake_seconds");
				projectile = ds_map_find_value(configDataMap, "projectile");
				casing_origin_x = ds_map_find_value(configDataMap, "casing_origin_x");
				casing_origin_y = ds_map_find_value(configDataMap, "casing_origin_y");
				projectile_origin_x = ds_map_find_value(configDataMap, "projectile_origin_x");
				projectile_origin_y = ds_map_find_value(configDataMap, "projectile_origin_y");

				spritesheet_path = ds_map_find_value(configDataMap, "spritesheet_path");
				spritesheet_prefix = ds_map_find_value(configDataMap, "spritesheet_prefix");

				sprite_w = ds_map_find_value(configDataMap, "sprite_w");
				sprite_h = ds_map_find_value(configDataMap, "sprite_h");
				sprite_origin_x = ds_map_find_value(configDataMap, "sprite_origin_x");
				sprite_origin_y = ds_map_find_value(configDataMap, "sprite_origin_y");

				ds_map_destroy(configDataMap);

				// weapon animation frames
				//from obj_weapon::create os prototype
				animation_frames = 3;


				var surf;
				var surface_width = next_power_of_two(sprite_w * animation_frames);
				var surface_height = next_power_of_two(sprite_h);
				surf = surface_create(surface_width, surface_height);
				surface_set_target(surf);
				// load sprites
				sprite_filename = configDirectory + "\\assault_pistol-sheet.png";
				//show_debug_message(sprite_filename);
				if file_exists(sprite_filename)
				{
					//show_debug_message("image found: " + sprite_filename);		
					temp_sprite = sprite_add(sprite_filename, 1, false, true, 0, 0 );
		
					//clear surface
					draw_clear_alpha(c_black, 0); 

					draw_sprite(temp_sprite, 0, 0, 0);
					spr_custom = sprite_create_from_surface(surf, 0, 0, sprite_w, sprite_h, false, true, sprite_origin_x, sprite_origin_y);
					for (i = 1; i < animation_frames; i +=1)
					{
						sprite_add_from_surface(spr_custom, surf, i*sprite_w, 0, sprite_w, sprite_h, false, true);
					}

					sprite_index = spr_custom;
					object_set_sprite(sprite_index, spr_custom);
				}
				else {
					show_debug_message("Loading weapon mod error - image not found: " + sprite_filename);
				}

				surface_reset_target();
				surface_free(surf);

			}
		} else {
			show_debug_message("itemInfoLoaded false");		
		}
	
		//show_debug_message("request item details");	
		//steam_details = steam_ugc_request_item_details(value, 60);
	}
} else {
	show_debug_message("steamUGCChecked false");
}