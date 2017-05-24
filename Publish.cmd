dotnet restore tools\NuGet\NuGet.csproj
if errorlevel 1 GOTO ERROR

%userprofile%\.nuget\packages\nuget.commandline\4.1.0\tools\nuget.exe restore

REM Build

msbuild AspNetPublishSamples.sln
if errorlevel 1 GOTO ERROR

REM File System Publish (Used by Kudu)
msbuild ASPNetCore\ASPNetCore.csproj /p:PublishUrl="..\PublishOutput\ASPNetCore" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild ASPNetCoreFullFramework\ASPNetCoreFullFramework.csproj /p:PublishUrl="..\PublishOutput\ASPNetCoreFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild MvcApp\MvcApp.csproj /p:PublishUrl="..\PublishOutput\MvcApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild Spa\Spa.csproj /p:PublishUrl="..\PublishOutput\Spa" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebApiApp\WebApiApp.csproj /p:PublishUrl="..\PublishOutput\WebApiApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebFormsApp\WebFormsApp.csproj /p:PublishUrl="..\PublishOutput\WebFormsApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebJobFullFramework\WebJobFullFramework.csproj /p:PublishUrl="..\PublishOutput\WebJobFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild FunctionApp\FunctionApp.csproj /p:PublishUrl="..\PublishOutput\FunctionApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild AspNetRazor3WebSite\website.publishproj /p:PublishUrl="..\PublishOutput\AspNetRazor3WebSite" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

REM MSDeploy Package Publish(Used by TeamBuild)
msbuild ASPNetCore\ASPNetCore.csproj /p:PackageLocation="..\PublishOutput\ZipASPNetCore" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild ASPNetCoreFullFramework\ASPNetCoreFullFramework.csproj /p:PackageLocation="..\PublishOutput\ZipASPNetCoreFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild MvcApp\MvcApp.csproj /p:PackageLocation="..\PublishOutput\ZipMvcApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild Spa\Spa.csproj /p:PackageLocation="..\PublishOutput\ZipSpa" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebApiApp\WebApiApp.csproj /p:PackageLocation="..\PublishOutput\ZipWebApiApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebFormsApp\WebFormsApp.csproj /p:PackageLocation="..\PublishOutput\ZipWebFormsApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebJobFullFramework\WebJobFullFramework.csproj /p:PackageLocation="..\PublishOutput\ZipWebJobFullFramework" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild FunctionApp\FunctionApp.csproj /p:PackageLocation="..\PublishOutput\ZipFunctionApp" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild AspNetRazor3WebSite\website.publishproj /p:PackageLocation="..\PublishOutput\ZipAspNetRazor3WebSite" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=Package /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:PackageAsSingleFile=true /p:DeployIisAppPath="Default Web Site" /p:SolutionDir="."
if errorlevel 1 GOTO ERROR


:ERROR
endlocal
exit /b 1
