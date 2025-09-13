# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# Copy only project file first to leverage Docker cache
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and publish
COPY . ./
RUN dotnet publish -c Release -o out

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy only the published output
COPY --from=build-env /app/out .

ENV ASPNETCORE_URLS=http://+:80
ENTRYPOINT ["dotnet", "PlatformService.dll"]
