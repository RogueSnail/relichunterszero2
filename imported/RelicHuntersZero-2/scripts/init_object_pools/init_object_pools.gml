global.bloodPool = create_object_pool();
//global.casingPool = create_object_pool();

fill_object_pool(global.bloodPool, abs(global.max_casings * 0.5), fx_blood, "Interactive");
//fill_object_pool(global.casingPool, abs(global.max_casings * 0.5), fx_blood, "Interactive");

