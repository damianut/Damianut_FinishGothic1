/*
 *  Disable fighting
 */
func int ZS_Attack_Loop()
{
    return LOOP_CONTINUE;
};
func int ZS_MM_AttackMage_Loop()
{
    return LOOP_CONTINUE;
};
func int ZS_MM_Attack_Loop()
{
    return LOOP_CONTINUE;
};
func int ZS_Orc_Attack_Loop()
{
    return LOOP_CONTINUE;
};

/*
 *  TriggerChangeLevel
 */
func void TriggerChangeLevel(var string levelName, var string startpoint)
{
    //0x0063D480 public: virtual void __thiscall oCGame::TriggerChangeLevel(class zSTRING const &,class zSTRING const &)
	const int oCGame__TriggerChangeLevel_G1 = 6542464;
    
    CALL_zStringPtrParam(startpoint);
    CALL_zStringPtrParam(levelName);
    CALL__thiscall(_@(MEM_Game), oCGame__TriggerChangeLevel_G1);
};

/*
 *  Change a zen
 */
func int Info_Diego_Gamestart_Condition()
{
    const int once = false;
    if (!once)
    {
        once = true;
        
        // Create a sword
        CreateInvItem(hero, DAEMONENSTREICH);
        TriggerChangeLevel("ORCTEMPEL.ZEN", "TPL_409");
    };
    
    return false;
};

FUNC VOID EVT_TPL_SLEEPERDEMON_05 ()
{		
	ExitGame();
};
