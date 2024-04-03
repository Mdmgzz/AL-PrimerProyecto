page 60058 "MNB Bonus Subform"
{
    PageType = ListPart;
    SourceTable = "MNB Bonus Line";
    Caption = 'Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of the bonus assigned';

                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies item number for which the bonus is assigned';
                }
                field("Bonus Perc"; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus percentage';
                }
            }
        }
    }
}