class Application < Sinatra::Base
  configure do
    set :views, sass: "public/css", coffee: "public/js", haml: "views", default: "views"
    set :partial_template_engine, :haml
    set :haml, format: :html5, layout: :"layouts/default", escape_attrs: false
    set :textrazor_api_key, "<put the api key here>"
  end

  configure :production do
    set :haml, format: :html5, layout: :"layouts/default", escape_attrs: false, ugly: true
  end
end
