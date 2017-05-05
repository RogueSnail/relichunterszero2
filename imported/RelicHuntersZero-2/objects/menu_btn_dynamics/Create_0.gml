///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_DYNAMICS");

if (global.max_casings == 100)
{
    myVariable = 3;
    myValueString = "100";
}

if (global.max_casings == 50)
{
    myVariable = 2;
    myValueString = "50";
}

if (global.max_casings == 20)
{
    myVariable = 1;
    myValueString = "20";
}

if (global.max_casings == 0)
{
    myVariable = 0;
    myValueString = "0";
}

myVariableMax = 3;

