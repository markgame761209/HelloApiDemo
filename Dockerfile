FROM microsoft/aspnetcore-build AS builder
WORKDIR /app

# copy csproj and restore as distinct layers
COPY HelloApiDemo/*.csproj ./HelloApiDemo/
WORKDIR /app/HelloApiDemo
RUN dotnet restore

# copy everything else and build
WORKDIR /app
COPY HelloApiDemo/ ./HelloApiDemo/

WORKDIR /app/HelloApiDemo
RUN dotnet publish --output /app/HelloApiDemo --configuration Release

WORKDIR /app/HelloApiDemo

# build runtime image
FROM microsoft/aspnetcore
COPY --from=builder /app/HelloApiDemo/ ./
ENTRYPOINT ["dotnet", "HelloApiDemo.dll"]
