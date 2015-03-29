class Application < Sinatra::Base
	get('/') { haml :index }
end
  