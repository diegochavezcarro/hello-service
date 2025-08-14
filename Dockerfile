FROM mcr.microsoft.com/dotnet/sdk:8.0

ENV ASPNETCORE_URLS=http://+:8080 \
    ASPNETCORE_ENVIRONMENT=Production \
    DOTNET_EnableDiagnostics=0

WORKDIR /app

COPY src/HelloService/HelloService.csproj ./src/HelloService/
RUN dotnet restore ./src/HelloService/HelloService.csproj

COPY src/HelloService/ ./src/HelloService/

RUN dotnet publish ./src/HelloService/HelloService.csproj -c Release -o /app/out

EXPOSE 8080
ENTRYPOINT ["dotnet", "/app/out/HelloService.dll"]
