///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_DYNAMICS");

if (global.max_casings == 1000)
{
    myVariable = 3;
    myValueString = "1000";
}

if (global.max_casings == 500)
{
    myVariable = 2;
    myValueString = "500";
}

if (global.max_casings == 200)
{
    myVariable = 1;
    myValueString = "200";
}

if (global.max_casings == 0)
{
    myVariable = 0;
    myValueString = "0";
}

myVariableMax = 3;

