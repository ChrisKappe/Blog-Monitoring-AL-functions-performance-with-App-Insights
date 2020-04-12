report 50200 "DrinkBeer"
{
    var
        DrinkBeer: Codeunit DrinkBeer;

    trigger OnPreReport()
    begin
        DrinkBeer.DrinkBeers(1);
    end;
}