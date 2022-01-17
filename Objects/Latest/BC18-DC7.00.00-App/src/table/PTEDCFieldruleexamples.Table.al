table 62000 "PTE DC Field rule examples"
{
    Caption = 'Field rule examples';
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Field Rule Type"; Enum "PTE DC Field rule type")
        {
            Caption = 'Field rule type';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TestField(Rec."System rule", false);
            end;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TestField(Rec."System rule", false);
            end;
        }
        field(3; Rule; Text[100])
        {
            Caption = 'Rule';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TestField(Rec."System rule", false);
            end;
        }
        field(4; Description; Text[200])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(5; "System rule"; Boolean)
        {
            Caption = 'System rule';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Field Rule Type", "Line No.")
        {
            Clustered = true;
        }
        key(SK; "Field Rule Type", Rule)
        {
            Clustered = false;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Field rule Type", Rule, Description)
        {

        }
    }

    trigger OnDelete()
    begin
        TestField(Rec."System rule", false);
    end;

    trigger OnRename()
    begin
        TestField(Rec."System rule", false);
    end;
}