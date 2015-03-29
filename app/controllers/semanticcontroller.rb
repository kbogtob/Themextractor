require 'json'

class Application < Sinatra::Base
	post '/parse', :provides => :json do
		pass unless request.accept? 'application/json'

		JSON.generate({
			concepts:[
				{name:'a', score:1.2}, 
				{name:'b', score:2.4}
			]
		})
	end
end