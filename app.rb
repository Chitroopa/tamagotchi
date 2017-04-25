require('sinatra')
require('sinatra/reloader')
require('.lib/tamagotchi')
also_reload('./**/*.rb')

get('/') do
  erb(:index)
end
