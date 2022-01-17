codeunit 62000 "PTE DC Field Rule Install Mgt."
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        SetupMgt: Codeunit "PTE DC Field Rule Setup Mgt.";
    begin
        SetupMgt.SetupFieldRuleTable();
    end;
}
