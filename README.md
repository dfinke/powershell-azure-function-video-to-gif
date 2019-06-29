# Powershell Azure Function Converts Video To Gif

1. Clone this repo
1. Use the `Deploy to Azure` button to provision the cloud resources needed.
[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdfinke%2Fpowershell-azure-function-video-to-gif%2Fmaster%2Fdeploy.json)

1. Use the `func cli` to deploy the PowerShell Azure Function `func azure functionapp publish video-gif`.
1. Create the blob storage container using the Azure portal, named `samples-workitems`.
1. Grab the `Connection String` from the `Access keys` on the storage account in your new resource group.
1. Configure a new `cnnstring` with the above `Connection String` in the Azure Function `Application Settings`.

You should be ready to go, upload an `mp4` file to the blob storage and that should trigger the PowerShell `run.ps1` to convert the `mp4` into gif and store the gif in `D:\home\site\videos`.

# Resources
https://github.com/krishnaji/durable-function-video-to-gif