codeunit 62000 "DCADV Field Rule Install Mgt."
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        SetupMgt: Codeunit "DCADV Field Rule Setup Mgt.";
    begin
        SetupMgt.SetupFieldRuleTable();
    end;
}
