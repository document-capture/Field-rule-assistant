page 62000 "PTE DC Field rule examples"
{
    ApplicationArea = All;
    Caption = 'Field rule examples';
    PageType = List;
    SourceTable = "PTE DC Field rule examples";
    UsageCategory = Lists;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Field Rule Type"; Rec."Field Rule Type")
                {
                    Caption = 'Field type';
                    ToolTip = 'Specifies the field type, where this rule is usually used';
                    ApplicationArea = All;
                    Visible = true;
                }
                field("Line No."; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the line no. of the current rule';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Rule"; Rec."Rule")
                {
                    Caption = 'Rule';
                    ToolTip = 'Specifies the rule';
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    Caption = 'Rule description';
                    ToolTip = 'Describes the rule';
                    ApplicationArea = All;
                }
                field("System rule"; Rec."System rule")
                {
                    Caption = 'System rule ';
                    ToolTip = 'Specefies if the rule has been created by the system during setup';
                    ApplicationArea = All;
                }
            }
        }
    }
}
