#!/usr/bin/ruby

require 'faraday'
require 'json'
require "test/unit/assertions"
include Test::Unit::Assertions

module GetAPIDetails

	def getData(string)

		res = Faraday.get(string)
	end
end

class GetAPIData
	include GetAPIDetails

	# Method to get the API response
	def test_data_response(string)

		res = getData(string)
	
	end

	# Method to get the API response headers
	def test_data_headers(string)

		headers = test_data_response(string).headers

	end
end