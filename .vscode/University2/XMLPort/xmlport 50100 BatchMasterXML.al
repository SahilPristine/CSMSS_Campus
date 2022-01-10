xmlport 50100 BatchMasterXML
{
    Format = VariableText;
    TextEncoding = UTF8;
    UseRequestPage = true;
    TableSeparator = ' ';

    schema
    {
        textelement(Batch)
        {
            tableelement(BatchMaster; BatchMasterTable)
            {
                XmlName = 'BatchMaster';
                fieldattribute(Code; BatchMaster.CODE)
                {

                }
                fieldattribute(Description; BatchMaster.Description)
                {

                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    // field(Code; BatchMaster.CODE)
                    // {

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}