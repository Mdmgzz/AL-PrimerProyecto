report 60062 "MNB Bonus Printout"
{
    UsageCategory = None;
    Caption = 'Bonus Printout';

    dataset
    {
        dataitem("MNB Bonus Header"; "MNB Bonus Header")
        {
            RequestFilterFields = "No.", "Customer No.";
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Customer_No; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(Starting_Date; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Ending_Date; "Ending Date")
            {
                IncludeCaption = true;
            }
            dataitem("MNB Bonus Line"; "MNB Bonus Line")
            {
                column(Type; Type)
                {
                    IncludeCaption = true;
                }
                column(Item_No; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Bonus_Perc_; "Bonus Perc.")
                {
                    IncludeCaption = true;
                }

            }
        }
    }

}

