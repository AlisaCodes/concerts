require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  "GET WITH IT!"
  erb(:index)
end
