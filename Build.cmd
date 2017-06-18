dotnet restore tools\NuGet\NuGet.csproj
if errorlevel 1 GOTO ERROR

%userprofile%\.nuget\packages\nuget.commandline\4.1.0\tools\nuget.exe restore

msbuild AspNetPublishSamples.sln