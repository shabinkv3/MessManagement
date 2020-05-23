class TestingController < ApplicationController
	def testing
		@students=Testing.all
	end
end
