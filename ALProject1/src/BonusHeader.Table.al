table 60055 "MNB Bonus Header"
{
    Caption = 'Bonus';
    DataClassification = CustomerContent;
    DrillDownPageId = "MNB Bonus List";
    LookupPageId = "MNB Bonus List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';

        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = "Customer";
            trigger OnValidate()
            begin
                TestStatus();
                CalcFields("Customer Name")
            end;
        }



        field(3;
        "Starting Date";
        Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';
            trigger OnValidate()
            begin
                if ("Ending Date" < "Starting Date") then
                    "Ending Date" := "Starting Date";
            end;
        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';
            trigger OnValidate()
            begin
                if ("Ending Date" < "Starting Date") then
                    "Ending Date" := "Starting Date";
            end;
        }

        field(5; Status; Enum "MNB Bonus Header Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
        field(6; "Last Released Date"; DateTime)
        {
            DataClassification = SystemMetadata;
            Caption = 'Last Released Date';
            Editable = false;
        }
        field(7; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;

        }


    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


    trigger OnDelete()
    begin
        TestStatus();
    end;

    var
        StatusCannotBeReleasesErr: Label 'Status cannot be %1', Comment = '%1 status field value';

    local procedure TestStatus()
    begin
        if Status = Status::Released then
            Error(StatusCannotBeReleasesErr, Status);
    end;
    //nose porque da error en el datetime 
    local procedure TestOnRelease()
    begin
        if Status <> Status::Released then
            exit;
        TestField("Customer No.");
        "Last Released Date" := CurrentDateTime;
    end;
}

