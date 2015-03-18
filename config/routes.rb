Rails.application.routes.draw do

get '/pirate/:address', to: 'pages#pirate'

end
