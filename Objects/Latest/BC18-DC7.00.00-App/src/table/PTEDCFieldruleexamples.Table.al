table 62000 "DCADV Field rule examples"
{
    Caption = 'Field rule examples';
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Field Rule Type"; Enum "DCADV Field rule type")
        {
            Caption = 'Field rule type';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; Rule; Text[100])
        {
            Caption = 'Rule';
            DataClassification = ToBeClassified;
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
        }
    }
    keys
    {
        key(PK; "Field Rule Type", "Line No.")
        {
            Clustered = true;
        }
        key(SK; Rule)
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
}