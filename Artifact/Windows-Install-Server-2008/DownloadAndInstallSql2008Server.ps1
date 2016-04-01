 Param(

    #Url du fichier de configuration
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$True)]
    [string] $urlConfigurationPath,
    
    #Emplacement sur le disque apres téléchargement
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$True)]
    [string] $DownloadPath,

    #Emplacement sur le disque du binaire Windows server 2008
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$True)]
    [string] $BinaryPath



 )

#-------------------------------------------[Telechargement du fichier en ligne]------------------------------------------
#ensure the path is available 
New-Item -ItemType Directory -Force -Path (Split-Path -parent $DownloadPath)    
     
$client = new-object System.Net.WebClient 
$client.DownloadFile($urlConfigurationPath, $DownloadPath) 


#--------------------------------------------[Installation de Sql Server 2008 ]-------------------------------------------

# run the installer using the ini file
$cmd = "'$BinaryPath' /ConfigurationFile='$DownloadPath' /Q"
Invoke-Expression $cmd 