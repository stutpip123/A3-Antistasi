params ["_side"];

if(tierWar < 3) exitWith {-1};

//Select a timer index and the max number of timers available
private _timerIndex = -1;
private _playerAdjustment = ceil (sqrt (count allPlayers));

//Search for a timer which allows the support to be fired
if(_side == Occupants) then
{
    if(isNil "occupantsAirstrikeTimer") then
    {
        occupantsAirstrikeTimer = [];
    };
    if(count occupantsAirstrikeTimer < _playerAdjustment) then
    {
        _timerIndex = count occupantsAirstrikeTimer;
        for "_i" from ((count occupantsAirstrikeTimer) + 1) to _playerAdjustment do
        {
            occupantsAirstrikeTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = occupantsAirstrikeTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};
if(_side == Invaders) then
{
    if(isNil "invadersAirstrikeTimer") then
    {
        invadersAirstrikeTimer = [];
    };
    if(count invadersAirstrikeTimer < _playerAdjustment) then
    {
        _timerIndex = count invadersAirstrikeTimer;
        for "_i" from ((count invadersAirstrikeTimer) + 1) to _playerAdjustment do
        {
            invadersAirstrikeTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = invadersAirstrikeTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};

_timerIndex;