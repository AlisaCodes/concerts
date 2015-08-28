require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post('/bands') do
  name = params.fetch('name')
  Band.create({:name => name})
  redirect back
end

delete('/bands/delete/:id') do
  band = Band.find(params.fetch('id').to_i())
  band.destroy
  redirect back
end

get('/bands/:id') do
  @band = Band.find(params.fetch('id').to_i)
  @venues = Venue.all()
  erb(:band)
end

get('/venues') do
  @venues = Venue.all()
  erb(:band)
end

post('/venues') do
  location = params.fetch('location')
  Venue.create({:location => location})
  erb(:band)
end
