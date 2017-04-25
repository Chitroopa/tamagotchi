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
  # @pet.set_food_level(0)
  erb(:check)
end

get('/food') do
  @pet = Tamagotchi.find(1)
  @pet.feed_pet()
  erb(:food)
end

get('/activity') do
  @pet = Tamagotchi.find(1)
  @pet.play_with_pet()
  erb(:play)
end

get('/sleep') do
  @pet = Tamagotchi.find(1)
  @pet.put_to_sleep()
  erb(:sleep)
end
