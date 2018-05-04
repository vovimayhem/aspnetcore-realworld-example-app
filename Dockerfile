# Stage I: Builder
FROM microsoft/dotnet:sdk AS builder

ENV HOME=/app NUGET_PACKAGES=/usr/nuget/packages

WORKDIR /app

ADD ./Conduit.sln /app/
ADD ./src/Conduit/Conduit.csproj /app/src/Conduit/
ADD ./tests/Conduit.IntegrationTests/Conduit.IntegrationTests.csproj /app/tests/Conduit.IntegrationTests/

RUN dotnet restore

# Build the app:
COPY . /app
RUN cd /app/src/Conduit && dotnet publish --configuration Release

WORKDIR /app/src/Conduit/bin/Release/netcoreapp2.0/publish

# Expose the port 5000:
EXPOSE 5000

ENTRYPOINT ["dotnet", "Conduit.dll"]
