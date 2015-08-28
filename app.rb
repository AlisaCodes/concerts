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

post('/bands') do
  location = params.fetch('location')
  Venue.create({:location => location})
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

post('/venues') do
  location = params.fetch('location')
  Venue.create({:location => location})
  @venues = Venue.all()
  redirect back
end

delete('/venues/delete/:id') do
  venue = Venue.find(params.fetch('id').to_i())
  venue.destroy
  redirect back
end

get('/venues') do
  @band = Band.find(params.fetch('id').to_i)
  @venues = Venue.all()
  erb(:band)
end

get('/bands/:id/edit') do
  @band = Band.find(params['id'])
  erb(:band_edit_form)
end

patch("/bands/:id/edit") do
  name = params.fetch("name")
  @band = Band.find(params.fetch("id").to_i())
  @band.update({:name => name})
  @bands = Band.all()
  redirect back
end

post("/bands/:id/venues/add") do
  venue_id = params.fetch("venue_id").to_i()
  venue = Venue.find(venue_id)
  band_id = params.fetch("id").to_i()
  band = Band.find(band_id)
  band.venues.push(venue)
  redirect back
end
