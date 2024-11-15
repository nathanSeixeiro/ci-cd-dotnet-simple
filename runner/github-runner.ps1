mkdir actions-runner; cd actions-runner

Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.320.0/actions-runner-win-x64-2.320.0.zip -OutFile actions-runner-win-x64-2.320.0.zip

if((Get-FileHash -Path actions-runner-win-x64-2.320.0.zip -Algorithm SHA256).Hash.ToUpper() -ne '9eb133e8cb25e8319f1cbef3578c9ec5428a7af7c6ec0202ba6f9a9fddf663c0'.ToUpper()){ throw 'Computed checksum did not match' }

Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.320.0.zip", "$PWD")

./config.cmd --url https://github.com/Seixeiroo --token AZ5YNJNBYSIFZH2EQB4CW7LHG7CPQ

./run.cmd
