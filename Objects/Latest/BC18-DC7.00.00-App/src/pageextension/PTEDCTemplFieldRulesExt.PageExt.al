pageextension 62002 "PTE DC Templ. Field Rules Ext." extends "CDC Template Field Rules"
{
    actions
    {
        addlast(Processing)
        {
            action(ALRSelectFieldRuleExample)
            {
                ApplicationArea = All;
                Caption = 'Select rule example';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    SelectExampleRule();
                end;
            }
        }
    }

    local procedure SelectExampleRule()
    var
        FieldRuleExampleList: Page "PTE DC Field rule examples";
        RuleExample: Record "PTE DC Field rule examples";
        CDCFieldRule: Record "CDC Template Field Rule";
    begin
        FieldRuleExampleList.LookupMode := true;
        if FieldRuleExampleList.RunModal() = Action::LookupOK then begin
            FieldRuleExampleList.GetRecord(RuleExample);
            if (Rec."Entry No." <> 0) and (delchr(Rec.Rule, '=', ' ') = '') then begin
                CDCFieldRule.Get(Rec."Template No.", Rec.Type, Rec.Code, Rec."Entry No.");
            end else begin
                CDCFieldRule.Init();
                CDCFieldRule."Template No." := Rec."Template No.";
                CDCFieldRule.Type := Rec.Type;
                CDCFieldRule.Code := Rec.Code;
                CDCFieldRule."Entry No." := GetNextEntryNo();
                CDCFieldRule.Insert(true);
            end;

            CDCFieldRule.Rule := RuleExample.Rule;
            CDCFieldRule.Description := RuleExample.Description;
            CDCFieldRule.Modify(true);
            Rec := CDCFieldRule;
        end;
    end;

    local procedure GetNextEntryNo(): Integer
    var
        CDCFieldRule: Record "CDC Template Field Rule";
    begin
        CDCFieldRule.SetRange("Template No.", Rec."Template No.");
        CDCFieldRule.SetRange(Type, Rec.Type);
        CDCFieldRule.SetRange(Code, Rec.Code);
        if CDCFieldRule.IsEmpty() then
            exit(10000)
        else begin
            CDCFieldRule.FindLast();
            exit(CDCFieldRule."Entry No." + 10000);
        end;
    end;
}
