Write-Host "File name: $fileName"
# Load the necessary assembly
Add-Type -AssemblyName System.Windows.Forms

# Create an OpenFileDialog object
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog

# Set properties (optional)
$FileBrowser.InitialDirectory = [Environment]::GetFolderPath('Desktop')
$FileBrowser.Filter = "All files (*.*)|*.*"
$FileBrowser.Title = "Select a file"

# Show the dialog and get the result
$null = $FileBrowser.ShowDialog()

# Get the selected file path
$SelectedFilePath = $FileBrowser.FileName

#set file name
$fullPath = $SelectedFilePath
$fileName = (Get-Item $fullPath).Name + ".bak"
# Define the destination path and new file name
$DestinationPath = "C:\Users\Sandr\OneDrive\Skrivbord\backup\$fileName"

# Copy and rename the file
Copy-Item -Path $SelectedFilePath -Destination $DestinationPath

# Output the new file path
Write-Output "File copied and renamed to: $DestinationPath"
Pause