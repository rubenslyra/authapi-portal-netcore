@echo off

:: Criar Solução
dotnet new sln -n AuthAPI

:: Criar Projetos
dotnet new web -n Auth.Api -o AuthAPI/Auth.Api
dotnet new classlib -n Auth.Application -o AuthAPI/Auth.Application
dotnet new classlib -n Auth.Entities -o AuthAPI/Auth.Entities
dotnet new classlib -n Auth.Infrastructure -o AuthAPI/Auth.Infrastructure


:: Restaurar Pacotes
dotnet restore AuthAPI/Auth.Api

:: Adicionar Projetos à Solução
dotnet sln add AuthAPI/Auth.Api/Auth.Api.csproj
dotnet sln add AuthAPI/Auth.Application/Auth.Application.csproj
dotnet sln add AuthAPI/Auth.Entities/Auth.Entities.csproj
dotnet sln add AuthAPI/Auth.Infrastructure/Auth.Infrastructure.csproj


:: Conectar Projetos
cd AuthAPI/Auth.Api
dotnet add reference ./../Auth.Application/Auth.Application.csproj
dotnet add reference ./../Auth.Infrastructure/Auth.Infrastructure.csproj
cd ..

cd Auth.Application
dotnet add reference ./../Auth.Entities/Auth.Entities.csproj
dotnet add reference ./../Auth.Infrastructure/Auth.Infrastructure.csproj
cd ..

cd Auth.Infrastructure
dotnet add reference ./../Auth.Entities/Auth.Entities.csproj
cd ..

dotnet restore AuthAPI/Auth.Api

:: Finalização
echo Projeto AuthAPI criado com sucesso!
pause