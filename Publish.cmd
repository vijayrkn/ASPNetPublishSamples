dotnet restore tools\NuGet\NuGet.csproj
if errorlevel 1 GOTO ERROR

%userprofile%\.nuget\packages\nuget.commandline\4.1.0\tools\nuget.exe restore

msbuild AspNetPublishSamples.sln
if errorlevel 1 GOTO ERROR

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

:ERROR
endlocal
exit /b 1
