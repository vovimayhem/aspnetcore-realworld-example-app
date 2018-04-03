FROM microsoft/dotnet:sdk

ENV HOME=/app NUGET_PACKAGES=/usr/nuget/packages

WORKDIR /app

ADD ./Conduit.sln /app/
ADD ./src/Conduit/Conduit.csproj /app/src/Conduit/
ADD ./tests/Conduit.IntegrationTests/Conduit.IntegrationTests.csproj /app/tests/Conduit.IntegrationTests/

RUN dotnet restore
