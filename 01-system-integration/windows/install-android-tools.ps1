dir ${env:ProgramFiles(x86)}
dir ${env:UserProfile}

cd "${env:UserProfile}\AppData\Local\Android\android-sdk\tools\"

android list sdk  --all
