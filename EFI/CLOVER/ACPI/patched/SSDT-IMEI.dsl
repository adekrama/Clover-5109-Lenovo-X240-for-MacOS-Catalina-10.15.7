// Add missing IMEI device.

//DefinitionBlock("", "SSDT", 2, "X240", "_IMEI", 0)
//{
    // Note: If your ACPI set (DSDT+SSDTs) already defines IMEI (or HECI)
    // remove this Device definition
    Device(_SB.PCI0.IMEI) { Name(_ADR, 0x00160000) }
//}
//EOF