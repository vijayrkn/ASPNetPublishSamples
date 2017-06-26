dotnet restore tools\NuGet\NuGet.csproj
if errorlevel 1 GOTO ERROR

%userprofile%\.nuget\packages\nuget.commandline\4.1.0\tools\nuget.exe restore

REM Build

msbuild AspNetPublishSamples.sln
if errorlevel 1 GOTO ERROR

REM File System Publish (Used by Kudu)

REM Syntax: 
:: msbuild solutionName.sln 
:: /p:PublishUrl="<destination path>" 
:: /p:DeployOnBuild=true 
:: /p:Configuration=Release 
:: /p:WebPublishMethod=FileSystem 
:: /p:DeployTarget=WebPublish 
:: /p:AutoParameterizationWebConfigConnectionStrings=false 
:: /p:SolutionDir="."

:: Only for WebJobs on DotNet Core Project System
:: /p:IsWebJobProject=true
:: /p:WebJobName=<WebJobName>
:: /p:WebJobType==<Continuous|Triggered>

:: =========== Solution ===============

msbuild ASPNetPublishSamples.sln /p:PublishUrl="bin\Release\PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

:: =========== WebSite ===============

REM ASP.NET Razor 3 Web Site.
msbuild AspNetRazor3WebSite\website.publishproj /p:PublishUrl="bin\Release\PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR


REM MSDeploy Package Publish(Used by TeamBuild)

REM Syntax: 
:: msbuild SolutionName.sln 
:: /p:PackageLocation="<destination path>"  
:: /p:DeployOnBuild=true 
:: /p:Configuration=Release 
:: /p:WebPublishMethod=Package 
:: /p:DeployTarget=WebPublish 
:: /p:PackageAsSingleFile=true 
:: /p:AutoParameterizationWebConfigConnectionStrings=false 
:: /p:SolutionDir="."

:: /p:DesktopBuildPackageLocation=<destination file with extension> (Only needed for ASP.NET Core projects using cli < 2.0. This is due to a bug which has been fixed in 2.0 cli)
:: /p:DeployIisAppPath=<Web site name> (Only needed for ASP.NET Core projects using cli < 2.0. This is due to a bug which has been fixed in 2.0 cli)

:: Only for WebJobs on DotNet Core Project System
:: /p:IsWebJobProject=true
:: /p:WebJobName=<WebJobName>
:: /p:WebJobType==<Continuous|Triggered>

:: =========== Solution ===============

msbuild ASPNetPublishSamples.sln /p:PackageLocation="bin\Release\PublishOutputZip" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="." /p:DesktopBuildPackageLocation="PublishOutputZip\MsDeployPackage.zip"
if errorlevel 1 GOTO ERROR

:: =========== WebSite ===============

REM ASP.NET Razor 3 Web Site.
msbuild AspNetRazor3WebSite\website.publishproj /p:PackageLocation="bin\Release\PublishOutputZip" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

:ERROR
endlocal
exit /b 1
