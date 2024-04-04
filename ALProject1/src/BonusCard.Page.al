page 65401 "MNB Bonus Card"
{
    PageType = Document;
    SourceTable = "MNB Bonus Header";
    Caption = 'Bonus Card';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus number';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus customer number';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus starting date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus ending date';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus status';
                }
                field("Last Released Date"; Rec."Last Released Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus last released date';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus customer name';
                    DrillDown = false;
                }
            }
            part(Lines; "MNB Bonus Subform")
            {
                ApplicationArea = All;
                Caption = 'Bonus Lines';
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
    // los action son los botones que aparecen en la parte superior de la pagina
    // los actions se pueden agrupar en areas para tener una mejor organizacion
    // cada action tiene un caption que es el texto que aparece en el boton
    // cada action tiene un tooltip que es el texto que aparece al pasar el mouse sobre el boton
    // cada action tiene un image que es el icono que aparece en el boton
    // cada action tiene un runobject que es el objeto que se ejecuta al hacer click en el boton
    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                ToolTip = 'Open Customer Card for de bonus';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
            }
            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                Image = Entry;
                RunObject = page "MNB Bonus Entries";
                RunPageLink = "Document No." = field("No.");
                ToolTip = 'Open Bonus Entries';
            }
        }
        area(Reporting)
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = Print;
                RunObject = report "MNB Bonus Printout";
                Tooltip = 'Pints Bonus Card';
            }

        }

    }
}

