require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('./**/*.rb')

get('/') do
  erb(:index)
end

get('/play') do
  Tamagotchi.clear()
  @name = params.fetch('name')
  @pet = Tamagotchi.new(@name)
  @pet.save()
  erb(:play)
end

get('/check') do
  @pet = Tamagotchi.find(1)
  @pet.time_passes()
  erb(:check)
end
