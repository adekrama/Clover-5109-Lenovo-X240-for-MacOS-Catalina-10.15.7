// Automatic injection of HDEF properties

//DefinitionBlock("", "SSDT", 2, "X240", "_HDEF", 0)
//{
    External(_SB.PCI0.HDEF, DeviceObj)
    External(RMCF.AUDL, IntObj)

    // inject properties for audio
    Method(_SB.PCI0.HDEF._DSM, 4)
    {
        If (CondRefOf(\RMCF.AUDL)) { If (Ones == \RMCF.AUDL) { Return(0) } }
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Local0 = Package()
        {
            "layout-id", Buffer(4) { 28, 0, 0, 0 },
            "hda-gfx", Buffer() { "onboard-1" },
            "PinConfigurations", Buffer() { },
        }
        If (CondRefOf(\RMCF.AUDL))
        {
            CreateDWordField(DerefOf(Local0[1]), 0, AUDL)
            AUDL = \RMCF.AUDL
        }
        Return(Local0)
    }
//}
//EOF