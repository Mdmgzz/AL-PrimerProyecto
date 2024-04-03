// una codeunit es un objeto que contiene un conjunto de funciones y
// procedimientos que se pueden llamar desde otras partes del sistema
// el nombre de la codeunit debe ser único en el sistema

// vamos a crear una codeunit para calcular el bonus 
codeunit 60060 "MNB Bonus Calculation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure OnAfterSalesInvLineInsert(SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculatedBonus(SalesInvLine);
    end;

    local Procedure CalculatedBonus(var SalesInvLine: Record "Sales Invoice Line")

    var
        BonusHeader: Record "MNB Bonus Header";

    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;
        BonusHeader.SetRange("Customer No.", SalesInvLine."Bill-to Customer No.");
        BonusHeader.SetRange(Status, BonusHeader.Status::Released);
        BonusHeader.SetFilter("Starting Date", '..%1', SalesInvLine."Posting Date");
        BonusHeader.SetFilter("Ending Date", '%1..', SalesInvLine."Posting Date");
        if BonusHeader.FindSet() then
            repeat
                FindBonusForAllItems(BonusHeader, SalesInvLine);
                FindBonusForOneItem(BonusHeader, SalesInvLine);

            until BonusHeader.Next = 0;
    end;

    local procedure FindBonusForAllItems(var BonusHeader: Record "MNB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record "MNB Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::"All Items");
        if BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;

    local procedure FindBonusForOneItem(var BonusHeader: Record "MNB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record "MNB Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader."No.");
        BonusLine.SetRange(Type, BonusLine.Type::Item);
        BonusLine.SetRange("Item No.", SalesInvLine."No.");
        if BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;

    local procedure InsertBonusEntry(var BonusLine: Record "MNB Bonus Line"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusEntry: Record "MNB Bonus Entry";
    begin

        BonusEntry.Init();
        BonusEntry."Entry No." := 0;
        BonusEntry."Bonus No." := BonusLine."Document No.";
        BonusEntry."Document No." := SalesInvLine."Document No.";
        BonusEntry."Item No." := SalesInvLine."No.";
        BonusEntry."Posting Date" := SalesInvLine."Posting Date";
        BonusEntry."Bonus Amount" := SalesInvLine."Line Amount" * BonusLine."Bonus Perc." / 100;
        OneBeforeInsertBonusEntry(BonusLine, SalesInvLine);
        BonusEntry.Insert();
        OnAfterInsertBonusEntry(BonusLine, SalesInvLine);
    end;

    [IntegrationEvent(false, false)]
    local procedure OneBeforeInsertBonusEntry(var BonusLine: Record "MNB Bonus Line";
    var SalesInvLine: Record "Sales Invoice Line")
    begin
        // do something before insert
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertBonusEntry(var BonusLine: Record "MNB Bonus Line";
    var SalesInvLine: Record "Sales Invoice Line")
    begin
        // do something after insert
    end;

}