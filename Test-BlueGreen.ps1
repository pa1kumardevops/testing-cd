# Test direct services
Write-Host "Testing Blue Service..." -ForegroundColor Blue
$blueResponse = kubectl run -i --rm --restart=Never curl-test --image=curlimages/curl -n blue-green-demo -- curl -s app-blue-svc
Write-Host "Blue response: $blueResponse"

Write-Host "Testing Green Service..." -ForegroundColor Green
$greenResponse = kubectl run -i --rm --restart=Never curl-test --image=curlimages/curl -n blue-green-demo -- curl -s app-green-svc
Write-Host "Green response: $greenResponse"

# Test production service
Write-Host "Testing Production Service..." -ForegroundColor Yellow
$prodResponse = kubectl run -i --rm --restart=Never curl-test --image=curlimages/curl -n blue-green-demo -- curl -s app-production
Write-Host "Production response: $prodResponse"

# Determine which version is active in production
if ($prodResponse -like "*BLUE*") {
    Write-Host "Production is currently serving BLUE version" -ForegroundColor Blue
}
elseif ($prodResponse -like "*GREEN*") {
    Write-Host "Production is currently serving GREEN version" -ForegroundColor Green
}
else {
    Write-Host "Could not determine active version" -ForegroundColor Red
}
