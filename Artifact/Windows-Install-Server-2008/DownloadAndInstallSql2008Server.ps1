 Param(

    #Url du fichier de configuration
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$True)]
    [string] $urlConfigurationPath,
    
    #Emplacement sur le disque apres tÃ©lÃ©chargement
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$True)]
    [string] $DownloadPath,

    #Emplacement sur le disque du binaire Windows server 2008
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$True)]
    [string] $BinaryPath



 )


   #-------------------------------------------[Telechargement du fichier en ligne]------------------------------------------ 
    $client = new-object System.Net.WebClient 
    $client.DownloadFile($urlConfigurationPath, $DownloadPath) 

    #--------------------------------------------[Installation de Sql Server 2008 ]-------------------------------------------
    $cmd = "'$BinaryPath' /ConfigurationFile='$DownloadPath' /Q"
    Invoke-Expression $cmd | Out-File "C:\Deploiement\LogSQL2008.txt"
