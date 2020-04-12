codeunit 50200 "DrinkBeer"
{
    procedure DrinkBeers(NumberOfBeers: Integer)
    var
        CurrentBeer: Integer;
    begin
        for CurrentBeer := 1 to NumberOfBeers do begin
            drinkBeer();
        end;
    end;


    local procedure DrinkBeer()
    var
        AppInsightsMgt: Codeunit "Application Insights Mgt.";
    begin
        AppInsightsMgt.StartFunctionExecution('\DrinkBeer');

        TakeBottle();
        OpenBottle();
        TakeSip();
        ThrowBottle();
        Relax();

        AppInsightsMgt.InitKey(GetAppInsightsKey());
        AppInsightsMgt.AddProperty('beerName', 'Heineken');
        AppInsightsMgt.TrackExecutionTime('\DrinkBeer');

    end;

    local procedure TakeBottle()
    var
        AppInsightsMgt: Codeunit "Application Insights Mgt.";

    begin
        AppInsightsMgt.StartFunctionExecution('\TakeBottle');

        Sleep(2000);

        AppInsightsMgt.InitKey(GetAppInsightsKey());
        AppInsightsMgt.TrackExecutionTime('\TakeBottle');
    end;

    local procedure OpenBottle()
    var
        AppInsightsMgt: Codeunit "Application Insights Mgt.";

    begin
        AppInsightsMgt.StartFunctionExecution('\OpenBottle');

        Sleep(1000);

        AppInsightsMgt.InitKey(GetAppInsightsKey());
        AppInsightsMgt.TrackExecutionTime('\OpenBottle');

    end;

    local procedure TakeSip()
    var
        CurrentSip: Integer;
        AppInsightsMgt: Codeunit "Application Insights Mgt.";

    begin

        AppInsightsMgt.StartFunctionExecution('\TakeSip');

        For CurrentSip := 1 to 10 do begin
            Sleep(500);
        end;

        AppInsightsMgt.AddMetric('bottleSize', 0.5);
        AppInsightsMgt.InitKey(GetAppInsightsKey());
        AppInsightsMgt.TrackExecutionTime('\TakeSip');

    end;

    local procedure ThrowBottle()
    var
        AppInsightsMgt: Codeunit "Application Insights Mgt.";

    begin
        AppInsightsMgt.StartFunctionExecution('\ThrowBottle');

        Sleep(1000);

        AppInsightsMgt.InitKey(GetAppInsightsKey());
        AppInsightsMgt.TrackExecutionTime('\ThrowBottle');

    end;

    local procedure Relax()
    var
        AppInsightsMgt: Codeunit "Application Insights Mgt.";

    begin
        AppInsightsMgt.StartFunctionExecution('\Relax');

        Sleep(5000);

        AppInsightsMgt.InitKey(GetAppInsightsKey());
        AppInsightsMgt.TrackExecutionTime('\Relax');

    end;

    local procedure GetAppInsightsKey(): Text
    begin
        exit('c200d508-f4bb-4635-a612-58b675081331');
    end;

}