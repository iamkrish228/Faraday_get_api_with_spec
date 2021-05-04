require_relative 'Faraday_Test_GET_API'
require 'JSON'

#global variable
$getURL = 'https://jsonplaceholder.typicode.com/posts'

class TestGetAPI
	
	def Call_api_get_response
		
		testData1 = GetAPIData.new

		resp = testData1.test_data_response($getURL)


	end

	def Call_api_get_resp_headers
		
		testData1 = GetAPIData.new

		headers = testData1.test_data_headers($getURL)

	end
end

resp = TestGetAPI.new
$status = resp.Call_api_get_response.status
$data = JSON.parse(resp.Call_api_get_response.body)

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

$serverName = resp.Call_api_get_response.headers['server']
$resDate = resp.Call_api_get_response.headers['date']
$contentType = resp.Call_api_get_response.headers['content-type']


def test_positive_scenarios

	assert_equal(200, $status,'Status code is not 200')

	assert_not_equal(404, $status,'Both are not equal')

	assert_not_nil($data,'Object not there')

	assert_equal("sunt aut facere repellat provident occaecati excepturi optio reprehenderit", $title0, 'Both the values not Equal')

	assert_not_equal("sunt aut facere repellat provident occaecati excepturi optio reprehenderit_009_added", $title0, 'Both the values are equal')

	assert_not_equal($title0,$title1,'Title from dataset1 is equal to dataset2')

	assert_equal(100,$id99,'Id is not equal')

	assert_same(1,$userid0,'User Id is not same')

	assert_not_same($id0, $id1, 'Id is same for both the values')

end

def test_negative_scenarios

	assert_equal(404, $status,'Both are not equal')

 	assert_equal("sunt aut facere repellat provident occaecati excepturi optio reprehenderit_added_to_check", $title0 , "Both the values not Equal")

 	assert_same(5,$userid0,'User Id is not same')

 	assert_not_same($id1, $id1, 'Id is same for both the values')

end

 
