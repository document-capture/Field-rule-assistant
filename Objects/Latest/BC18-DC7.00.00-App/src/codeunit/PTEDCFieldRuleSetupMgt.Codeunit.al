codeunit 62001 "PTE DC Field Rule Setup Mgt."
{
    Access = Public;
    internal procedure SetupFieldRuleTable()
    var
        Handled: Boolean;
    begin
        OnBeforeSetupSystemRule(Handled);

        if Handled then
            exit;
        CreateSystemRule := true;

        DeleteSystemRules();
        InsertSystemRules();

        OnAfterSetupSystemRule();
    end;

    local procedure DeleteSystemRules()
    var
        FieldRuleExample: Record "PTE DC Field rule examples";
    begin
        FieldRuleExample.SetRange("System rule", true);
        FieldRuleExample.DeleteAll();
    end;

    local procedure InsertSystemRules()
    var
        LineNo: Integer;
        FieldRuleType: Enum "PTE DC Field rule type";
    begin
        InsertRuleExample(LineNo, Rule1, RuleDescription1, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule2, RuleDescription2, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule3, RuleDescription3, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule4, RuleDescription4, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule5, RuleDescription5, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule6, RuleDescription6, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule7, RuleDescription7, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule8, RuleDescription8, FieldRuleType::Header);
        InsertRuleExample(LineNo, Rule9, RuleDescription9, FieldRuleType::Line);
        InsertRuleExample(LineNo, Rule10, RuleDescription10, FieldRuleType::Line);
        InsertRuleExample(LineNo, Rule11, RuleDescription11, FieldRuleType::Line);
        InsertRuleExample(LineNo, Rule12, RuleDescription12, FieldRuleType::Line);
        InsertRuleExample(LineNo, Rule13, RuleDescription13, FieldRuleType::Line);
    end;

    procedure InsertRuleExample(var LineNo: Integer; Rule: Text[100]; Description: Text[250]; RuleType: Enum "PTE DC Field rule type")
    var
        FieldRuleExample: Record "PTE DC Field rule examples";
    begin
        LineNo += 10000;
        FieldRuleExample."Field rule Type" := RuleType;
        FieldRuleExample."Line No." := LineNo;
        FieldRuleExample.Rule := Rule;
        FieldRuleExample.Description := Description;
        FieldRuleExample."System rule" := CreateSystemRule;
        FieldRuleExample.Insert(true);
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetupSystemRule(var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetupSystemRule()
    begin
    end;

    var
        CreateSystemRule: Boolean;
        Rule1: Label 'P[0-9]{8}', MaxLength = 50, Locked = true;
        RuleDescription1: Label 'Feldwert muss mit "P" beginnen, gefolgt von 8 Ziffern von 0 bis 9.', MaxLength = 100;
        Rule2: Label '[FR]-[0-9]{3,}', MaxLength = 50, Locked = true;
        RuleDescription2: Label 'Feldwert muss entweder mit "F" oder "R" und "-" beginnen, gefolgt von mindestens 3 Ziffern (0-9).', MaxLength = 100;
        Rule3: Label '[FR]-[0-9]{3,5}', MaxLength = 50, Locked = true;
        RuleDescription3: Label 'Der Feldwert muss entweder mit "F" oder "R" und "-" beginnen, gefolgt von 3 bis 5 Stellen (0-9).', MaxLength = 100;
        Rule4: Label 'I[0-9]{8}', MaxLength = 50, Locked = true;
        RuleDescription4: Label 'Feldwert muss mit "I" beginnen, gefolgt von 8 Ziffern von 0 bis 9.', MaxLength = 100;
        Rule5: Label 'RG[0-9]{5}X[0-1]{1}', MaxLength = 50, Locked = true;
        RuleDescription5: Label 'Der Feldwert muss mit "RG" beginnen, gefolgt von 5 Stellen, dann "X" gefolgt von 1 Stelle.', MaxLength = 100;
        Rule6: Label '<>ABC&<>DEF', MaxLength = 50, Locked = true;
        RuleDescription6: Label 'Der Feldwert darft nicht "ABC" und nicht "DEF" sein.', MaxLength = 100;
        Rule7: Label 'Rechnung|Gutschrift', MaxLength = 50, Locked = true;
        RuleDescription7: Label 'Feldwert muss entweder “Rechnung” oder “Gutschrift” sein.', MaxLength = 100;
        Rule8: Label '*AG*', MaxLength = 50, Locked = true;
        RuleDescription8: Label 'Der Feldwert muss die Zeichen “AG” enthalten.', MaxLength = 100;
        Rule9: Label 'Invoice', MaxLength = 50, Locked = true;
        RuleDescription9: Label 'Erkennt nur Zeilen, in denen das Feld das Wort Rechnung enthält.', MaxLength = 100;
        Rule10: Label 'Rechnung|Gutschrift', MaxLength = 50, Locked = true;
        RuleDescription10: Label 'Erkennt Zeilen in denen das Feld entweder das Wort "Rechnung" oder das Wort „Gutschrift“ enthält.', MaxLength = 100;
        Rule11: Label '<>Zwischensumme', MaxLength = 50, Locked = true;
        RuleDescription11: Label 'Zeilen überspringen, die das Wort "Zwischensumme" enthalten.', MaxLength = 100;
        Rule12: Label '<>Größe*', MaxLength = 50, Locked = true;
        RuleDescription12: Label 'Zeilen überspringen, in denen das Feld mit dem Wort "Größe" beginnt.', MaxLength = 100;
        Rule13: Label 'POS[0-9]{3}', MaxLength = 50, Locked = true;
        RuleDescription13: Label 'Filtert Zeilen in denen das Feld mit POS anfängt, gefolgt von 3 Ziffern im Bereich von 0-9', MaxLength = 100;
}
