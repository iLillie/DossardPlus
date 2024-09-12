Dev::HookInfo@ g_DossardHookInfo;

// This is temporary solution until dependency plugin is done
// So I recommend waiting if you plan on reusing this code for something else.
// 2024-09-12: This was a lie.

void SetupHook() {    
    uint64 hookPtr = Dev::FindPattern(Constants::DOSSARD_PATTERN);

    if(hookPtr == 0) {
        error("Failed to find pattern");
        return;
    }
    
    @g_DossardHookInfo = Dev::Hook(hookPtr, 0, "UpdateDossard", Dev::PushRegisters::SSE);
}

void OnDestroyed()
{
    if (g_DossardHookInfo is null) return;
    Dev::Unhook(g_DossardHookInfo);
}

