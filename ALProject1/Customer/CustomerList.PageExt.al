pageextension 60255 "MNB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("MNB No. of Bonuses"; Rec."MNB Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies  the number of bonuses asigned to the customer.';
            }

        }
    }
    actions
    {
        addlast(navigation)
        {
            action(MNBBonuses)
            {
                ApplicationArea = All;
                Caption = 'Bonuses';
                ToolTip = 'Open de list of bonues asigned to the customer.';
                Image = Discount;
                Promoted = true;
                RunObject = Page "MNB Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}
