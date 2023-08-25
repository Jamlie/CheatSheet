$languages="golang", "c", "cpp", "rust", "nodejs", "java", "typescript"
$core_utils = "xargs", "find", "mv", "sed", "awk"

# $language = $languages | Out-GridView -Title "Select a language" -PassThru
$languages = $languages -join "`n"
$core_utils = $core_utils -join "`n"

$combined = "$languages`n$core_utils"
$selected = $combined | fzf
$query = Read-Host "query"

if ($languages -split "`n" -contains $selected) {
    $encodedQuery = $query -replace ' ', '+'
    curl cht.sh/$selected/$encodedQuery
} else {
    curl cht.sh/$selected~$query
}

# $language = Read-Host -Prompt "Select a language" -AsSecureString | ConvertFrom-SecureString
# $language = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($language))

