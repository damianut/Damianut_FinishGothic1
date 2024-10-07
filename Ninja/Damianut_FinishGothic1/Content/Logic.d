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
func int Diego_Gamestart_Condition()
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

/*
 *  Update_EVT_TPL_TRIGGER_SLEEPERHEARTS_05
 */
func void Update_EVT_TPL_TRIGGER_SLEEPERHEARTS_05()
{
    var int mobPtr; mobPtr = MEM_SearchVobByName("EVT_TPL_TRIGGER_SLEEPERHEARTS_05");
    var oCMobInter mob; mob = _^(mobPtr);
    mob.onStateFuncName = "DIA_EXTRO_AVI";
};

/*
 *  INIT_ORCTEMPEL
 */
FUNC VOID INIT_ORCTEMPEL ()
{
	//-------- Objekt-TAs --------
	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);

	//-------- Attitüden initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
    
    Update_EVT_TPL_TRIGGER_SLEEPERHEARTS_05();
};


// EVT_TPL_TRIGGERSCRIPT_SLEEPERHEARTS_01
func void DIA_EXTRO_AVI_S1 ()
{
	ExitGame();
};
