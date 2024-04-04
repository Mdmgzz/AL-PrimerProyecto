report 60061 "MNB Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bonus Overview';
    DefaultLayout = Excel;
    ExcelLayout = './src/Bonus/BonusOverview.xlsx';

    dataset
    {
        dataitem("MNB Bonus Header"; "MNB Bonus Header")
        {
            RequestFilterFields = "No.", "Customer No.";
            Column(No_; "No.")
            {
                IncludeCaption = True;
            }
            Column(Customer_No_; "Customer No.")
            {
                IncludeCaption = True;
            }
            Column(Starting_Date; "Starting Date")
            {
                IncludeCaption = True;
            }
            Column(Ending_Date; "Ending Date")
            {
                IncludeCaption = True;
            }
            dataitem("MNB Bonus Entry"; "MNB Bonus Entry")
            {
                DataItemLink = "Bonus No." = field("No.");
                RequestFilterFields = "Posting Date";

                Column(Document_No_; "Document No.")
                {
                    IncludeCaption = True;
                }
                Column(Posting_Date; "Posting Date")
                {
                    IncludeCaption = True;
                }
                Column(Item_No_; "Item No.")
                {
                    IncludeCaption = True;
                }

                Column(Bonus_Amount; "Bonus Amount")
                {
                    IncludeCaption = True;
                }
            }
        }


    }
}
