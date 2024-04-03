tableextension 60055 "MNB Customer" extends Customer
{
    fields
    {
        field(60055; "MNB Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("MNB Bonus Header" where("Customer No." = field("No.")));
            Editable = false;
        }
    }
    trigger OnbeforeDelete()
    begin
        testIfBonusExist();
    end;

    var
        AtleastOneBonusForCustomerExistsErr: Label 'At least one bonus for customer %1 exists.', comment = '%1 - customer name';

    local procedure testIfBonusExist()
    var
        BonusHeader: Record "MNB Bonus Header";

    begin
        if not BonusHeader.IsEmpty then
            Error(AtleastOneBonusForCustomerExistsErr, Rec.Name);
    end;
}




