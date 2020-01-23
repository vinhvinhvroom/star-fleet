require 'sinatra'
require_relative 'config/application'
require_relative 'app/models/starship'
require_relative 'app/models/crewmember'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/starships'
end

get '/starships' do
  # Use a custom Starship class that inherits from ActiveRecord to retrieve your database objects
  # You should be using ActiveRecord CRUD methods to aid you.
  # E.g. Planet.where(planet_type: "gas giant"), etc.
  @starships = Starship.all
  erb :'starships/index'
end

get '/crew-members' do
  @crew_members = CrewMember.order(:last_name)
  erb :'crew-members/index'
end

get '/starships/new' do
  erb :'/starships/new'
end

post '/starships/:id/crew-members/new' do
  @ship = Starship.find(params["id"])
  @crew_members = CrewMember.order(:last_name)

  @new_crew_member = CrewMember.create(first_name: params['first_name'], last_name: params["last_name"], speciality_division: params["speciality_division"], starship: @ship)

  if @new_crew_member.valid? && @new_crew_member.persisted?
    @success_message = "Your Crew Member has been successfully added to #{@ship.name}"
    erb :"/crew-members/index"
  else
    return erb :'starships/show'
  end


end

get '/starships/:id' do
  @ship = Starship.find(params["id"])
  erb :'/starships/show'
end

post '/starships/new' do
  @new_ship = Starship.create(name: params["name"], ship_class: params["ship_class"], location: params["location"])


  if @new_ship.persisted? && @new_ship.valid?
    @success = "Your ship has been successfully created!"
    @ship = Starship.last
    return erb :"/starships/show"
  else
    return erb :"/starships/new"
  end

end
