require "sinatra"
require "sinatra/activerecord"
require "pry"

set :views, File.join(File.dirname(__FILE__), "app/views")
require_relative "app/models/television_show"

def check_for_errors(params)
  error_message = []

  if params[:title] == "" && params[:network] == "" && params [:starting_year] == ""
    error_message << "Please fill out Title, Network and Starting Year"
  end
  if params[:synopsis].size > 5000
    error_message << "The synopsis exceeds 5000 characters"
  end

  if params[:starting_year].to_i < 1900 || (params[:ending_year].to_i < 1900 && !params[:ending_year].empty?)
    error_message << "The starting year and ending year must be greater than 1900."
  end

  error_message
end

get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  shows = TelevisionShow.all
  erb :index, locals: { shows: shows }
end

get "/television_shows/new" do
  show = TelevisionShow.new
  erb :new, locals: { show: show, errors: [] }
end

get "/television_shows/:id" do
  show = TelevisionShow.find(params[:id])
  erb :show, locals: { show: show }
end

post "/television_shows" do
  errors = check_for_errors(params[:television_show])
  show = TelevisionShow.new(params[:television_show])

  if show.save
    redirect "/television_shows"
  else
    erb :new, locals: { show: show, errors: errors }
  end
end
