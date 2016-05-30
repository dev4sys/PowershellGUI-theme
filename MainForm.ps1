#########################################################################
#                        Add shared_assemblies                          #
#########################################################################

# Mahapps Library
[System.Reflection.Assembly]::LoadFrom('Assembly\MahApps.Metro.dll')       | out-null
[System.Reflection.Assembly]::LoadFrom('Assembly\System.Windows.Interactivity.dll') | out-null

#########################################################################
#                        Load Main Panel                                #
#########################################################################

# return the directory of source files
$Script:pathPanel= split-path -parent $MyInvocation.MyCommand.Definition

# function to load the xaml
function LoadXaml ($filename){
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}


#$XamlMainWindow = LoadXaml($pathPanel+"\window.metro.xaml")  #MahApps
$XamlMainWindow = LoadXaml($pathPanel+"\window.xaml") #Theme
$reader = (New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form = [Windows.Markup.XamlReader]::Load($reader)

#########################################################################
#                        Show Dialog                                    #
#########################################################################

$Form.ShowDialog() | Out-Null