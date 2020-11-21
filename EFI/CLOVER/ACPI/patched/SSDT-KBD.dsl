// Lenovo ThinkPad X240 Keyboard Map.

//DefinitionBlock("", "SSDT", 2, "X240", "_KBD", 0)
//{
    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.LPC.KBD, DeviceObj)

    Scope (_SB.PCI0.LPC.EC)
    {
        Method (_Q14, 0, NotSerialized)  // Brightness Up
        {
            Notify (KBD, 0x0406)
        }

        Method (_Q15, 0, NotSerialized)  // Brightness Down
        {
            Notify (KBD, 0x0405)
        }

        Method (_Q6A, 0, NotSerialized)  //F4 Microphone Mute - Siri (SysPrefs>Siri>Keyboard Shortcut)
        {
            Notify (KBD, 0x033E)
        }

        Method (_Q16, 0, NotSerialized)  // Projector / Mirror mode
        {
            Notify (KBD, 0x046E)
        }

        Method (_Q64, 0, NotSerialized)  //F8 Wireless ON/OFF - Notification Center (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (KBD, 0x0342)
        }

        Method (_Q66, 0, NotSerialized)  // F16 Settings - System Preferences (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (KBD, 0x0367)
        }

        Method (_Q67, 0, NotSerialized)  //F17 Windows Search (Cortana) - Spotlight Search (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (KBD, 0x0368)
        }

        Method (_Q68, 0, NotSerialized)  //F18 ALT+TAB Menu - Mission Control (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (KBD, 0x0369)
        }

        Method (_Q69, 0, NotSerialized)  //F19 Start Menu - Launchpad (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (KBD, 0x036A)
        }
    }

    Scope (_SB.PCI0.LPC.KBD)
    {
        // Lenovo ThinkPad T460 Configuration Load
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "T460",
            })
        }

        // PrtSc to F13 & DynamicEWMode Off
        Name(RMCF, Package()
        {
            "Synaptics TouchPad", Package()
            {
                "DynamicEWMode", ">n",
            },
            "Keyboard", Package()
            {
                "Custom PS2 Map", Package()
                {
                    Package() { },
                    "e037=64", // PrtSc=F13
                },
            },  
        })
    }
//}
//EOF