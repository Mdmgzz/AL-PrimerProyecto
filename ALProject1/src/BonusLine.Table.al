table 60056 "MNB Bonus Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation = "MNB Bonus Header";
        }
        field(2; "Type"; Enum "MNB Bonus Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation = "MNB Bonus Header";
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            TableRelation = if (Type = filter(Item)) Item;
        }
        field(4; "Bonus Perc."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Perc.';
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        Key(PK; "Document No.", "Type", "Item No.")
        {
            Clustered = true;
        }
    }

}