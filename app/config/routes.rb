class Application < Sinatra::Base
  # Assets
  get("/favicon.ico") { send_file "#{settings.public_folder}/favicon.ico" }
  get("/js/:file.js") { params[:file].to_sym }
  get("/css/:file.css") { sass params[:file].to_sym }
  get("/img/wait.gif") { "#{settings.public_folder}/img/wait.gif"}
end
