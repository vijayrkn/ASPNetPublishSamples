msbuild /t:Restore ASPNetCore\ASPNetCore.csproj 
msbuild /t:Restore ASPNetCoreFullFramework\ASPNetCoreFullFramework.csproj 
msbuild /t:Restore MvcApp\MvcApp.csproj 
msbuild /t:Restore Spa\Spa.csproj 
msbuild /t:Restore WebApiApp\WebApiApp.csproj 
msbuild /t:Restore WebFormsApp\WebFormsApp.csproj 
msbuild /t:Restore WebJobFullFramework\WebJobFullFramework.csproj

msbuild AspNetPublishSamples.sln
if errorlevel 1 GOTO ERROR

msbuild ASPNetCore\ASPNetCore.csproj /p:PublishUrl="PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild ASPNetCoreFullFramework\ASPNetCoreFullFramework.csproj /p:PublishUrl="PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild MvcApp\MvcApp.csproj /p:PublishUrl="PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild Spa\Spa.csproj /p:PublishUrl="PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebApiApp\WebApiApp.csproj /p:PublishUrl="PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebFormsApp\WebFormsApp.csproj /p:PublishUrl="PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

msbuild WebJobFullFramework\WebJobFullFramework.csproj /p:PublishUrl="PublishOutput" /p:DeployOnBuild=true /p:Configuration=Release /p:WebPublishMethod=FileSystem /p:DeployTarget=WebPublish /p:AutoParameterizationWebConfigConnectionStrings=false /p:SolutionDir="."
if errorlevel 1 GOTO ERROR

:ERROR
endlocal
exit /b 1
