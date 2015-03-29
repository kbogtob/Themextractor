require 'json'

class Application < Sinatra::Base
	post '/parse', :provides => :json do
		pass unless request.accept? 'application/json'

		
	end
end