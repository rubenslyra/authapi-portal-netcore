var builder = WebApplication.CreateBuilder(args);



if (builder.Environment.IsDevelopment())
{
    builder.Logging.AddJsonConsole();
    // builder.Services.AddLogging(config =>
    // {
    //     config.AddConsole();
    //     config.AddDebug();
    // });
}

var app = builder.Build();

app.MapGet("/", () => "AuthAPI - Portal de Autenticação [http://localhost:5000]");

app.Run();
