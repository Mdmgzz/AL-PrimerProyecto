page 60057 "MNB Bonus List"
{
    PageType = List;
    Caption = 'Bonuses';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "MNB Bonus Header";
    Editable = false;
    CardPageId = "MNB Bonus Card";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus number.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the starting date of the bonus.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ending date of the bonus.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the bonus.';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                ToolTip = 'Open the Customer Card for de bonus.';
                Image = Customer;
                RunObject = Page "Customer Card";
                RunPageLink = "No." = field("Customer No.");

            }
        }
    }
}