dotnet restore tools\NuGet\NuGet.csproj
if errorlevel 1 GOTO ERROR

%userprofile%\.nuget\packages\nuget.commandline\4.1.0\tools\nuget.exe restore

REM Build

msbuild AspNetPublishSamples.sln
if errorlevel 1 GOTO ERROR

REM File System Publish (Used by Kudu)

REM Syntax: 
:: msbuild projectname.csproj 
:: /p:PublishUrl="<destination path>" 
:: /p:DeployOnBuild=true 
:: /p:Configuration=Release 
:: /p:WebPublishMethod=FileSystem 
:: /p:DeployTarget=WebPublish 
:: /p:AutoParameterizationWebConfigConnectionStrings=false 
:: /p:SolutionDir="."

REM Testing the commandline for all Project types.

REM ASP.NET Core on Core
msbuild ASPNetCore\ASPNetCore.csproj /p:PublishUrl="..\PublishOutput\ASPNetCore" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM ASP.NET Core on NetFx
msbuild ASPNetCoreFullFramework\ASPNetCoreFullFramework.csproj /p:PublishUrl="..\PublishOutput\ASPNetCoreFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Classic MVC5
msbuild MvcApp\MvcApp.csproj /p:PublishUrl="..\PublishOutput\MvcApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Classic Single Page Application
msbuild Spa\Spa.csproj /p:PublishUrl="..\PublishOutput\Spa" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Classic Web API
msbuild WebApiApp\WebApiApp.csproj /p:PublishUrl="..\PublishOutput\WebApiApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Classic Web Forms
msbuild WebFormsApp\WebFormsApp.csproj /p:PublishUrl="..\PublishOutput\WebFormsApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM WebJobs On Net Fx.
msbuild WebJobFullFramework\WebJobFullFramework.csproj /p:PublishUrl="..\PublishOutput\WebJobFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Function Apps.
msbuild FunctionApp\FunctionApp.csproj /p:PublishUrl="..\PublishOutput\FunctionApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM ASP.NET Razor 3 Web Site.
msbuild AspNetRazor3WebSite\website.publishproj /p:PublishUrl="..\PublishOutput\AspNetRazor3WebSite" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM MSDeploy Package Publish(Used by TeamBuild)

REM Syntax: 
:: msbuild projectname.csproj 
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

set "RootPath=%~dp0"
REM ASP.NET Core on Core
msbuild ASPNetCore\ASPNetCore.csproj /p:PackageLocation="..\PublishOutput\ZipASPNetCore" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="." /p:DesktopBuildPackageLocation="%RootPath%PublishOutput\ZipASPNetCore\ASPNetCore.zip"
if errorlevel 1 GOTO ERROR

REM ASP.NET Core on NetFx
msbuild ASPNetCoreFullFramework\ASPNetCoreFullFramework.csproj /p:PackageLocation="..\PublishOutput\ZipASPNetCoreFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="." /p:DesktopBuildPackageLocation="%RootPath%PublishOutput\ZipASPNetCoreFullFramework\ASPNetCoreFullFramework.zip"
if errorlevel 1 GOTO ERROR

REM Classic MVC5
msbuild MvcApp\MvcApp.csproj /p:PackageLocation="..\PublishOutput\ZipMvcApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Classic Single Page Application
msbuild Spa\Spa.csproj /p:PackageLocation="..\PublishOutput\ZipSpa" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Classic Web API
msbuild WebApiApp\WebApiApp.csproj /p:PackageLocation="..\PublishOutput\ZipWebApiApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Classic Web Forms
msbuild WebFormsApp\WebFormsApp.csproj /p:PackageLocation="..\PublishOutput\ZipWebFormsApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM WebJobs On Net Fx.
msbuild WebJobFullFramework\WebJobFullFramework.csproj /p:PackageLocation="..\PublishOutput\ZipWebJobFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM Function Apps.
msbuild FunctionApp\FunctionApp.csproj /p:PackageLocation="..\PublishOutput\ZipFunctionApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="." /p:DesktopBuildPackageLocation="%RootPath%PublishOutput\ZipFunctionApp\FunctionApp.zip"
if errorlevel 1 GOTO ERROR

REM ASP.NET Razor 3 Web Site.
msbuild AspNetRazor3WebSite\website.publishproj /p:PackageLocation="..\PublishOutput\ZipAspNetRazor3WebSite" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR


:ERROR
endlocal
exit /b 1
