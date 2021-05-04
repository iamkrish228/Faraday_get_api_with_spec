require_relative 'Faraday_Test_GET_API'
require 'JSON'


#global variable
$getURL = 'https://jsonplaceholder.typicode.com/posts'

testData2 = TestGetAPI.new

$resp = testData2.test_data_response($getURL)
$headers = testData2.test_data_headers($getURL)

$status = $resp.Call_api_get_response.status
$data = JSON.parse($resp.Call_api_get_response.body)

#Getting the data
$userid0 = $data[0]['userId']
$id0 = $data[0]['id']
$id1 = $data[1]['id']
$id3 = $data[1]['id']
$id99 = $data[99]['id'] 
$title0 = $data[0]['title']
$title1 = $data[1]['title']
$body0 =  $data[0]['body']
$body1 =  $data[1]['body']

$serverName = $resp.Call_api_get_response.headers['server']
$resDate = $resp.Call_api_get_response.headers['date']
$contentType = $resp.Call_api_get_response.headers['content-type']


RSpec.describe GetAPIDetails::GetAPIData do

  it 'checks a getapi data class' do
    
    getAPIclass = GetAPIData.new
    
    expect(getAPIclass).to be_kind_of(GetAPIDetails::GetAPIData)
    
  end

  it 'verify the positive scenarios' do
  	
  	expect($status).to eq(200)
  	
  	expect($status).not_to be(404)
  	
  	expect($serverName).to eq('cloudflare')
  	
  	expect($serverName).not_to be('server')
  	
  	expect($contentType).to eq('application/json; charset=utf-8')

  	expect($title0).to eq("sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
  	
  	expect($title0).not_to be("sunt aut facere repellat provident occaecati excepturi optio reprehenderit_009_added")
  	
  	expect($title0).not_to be($title1)
  	
  	expect($id99).to eq(100)
  	
  	expect($id0).not_to be($id1)

  end

  it 'verify the Negative scenarios' do
  	 
  	 expect($status).to eq(404)
  	 
  	 expect($title0).to eq("sunt aut facere repellat provident occaecati excepturi optio reprehenderit_added_to_check")
	 
	 expect($userid0).to eq(5)
	 
	 expect($id1).to eq($id3)
  
  end