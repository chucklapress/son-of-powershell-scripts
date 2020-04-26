#Powershell script to capture phrases or sentence do an accurate word and character count

Write-Host "`nTo use enter your phrase or sentence"

$file = Read-Host 'type away' | Out-File -Append 'text-capture.txt'
Write-Host 'Would you like to add more?'
$input = read-host "Enter yes or no"
if ($input -eq 'yes') {
  $file = Read-Host 'Go ahead, add some more' | Out-File -Append 'text-capture.txt'
  Write-Host "`nHere is the results`n"
  $words = Get-Content 'text-capture.txt'
  $words = $words.ToLower() -replace "[.,!?)(]",""
  $words = $words -replace "([^a-z])'([^a-z])","`${1}`${2}"
  $words = $words -replace "'","''"
  $words | Measure-Object -Character -Line -Word
} else {
 $words = Get-Content 'text-capture.txt'
 $words = $words.ToLower() -replace "[.,!?)(]",""
 $words = $words -replace "([^a-z])'([^a-z])","`${1}`${2}"
 $words = $words -replace "'","''"
 $words | Measure-Object -Character -Line -Word
}
