require "sinatra"


get "/" do

  erb :index
end

get "/shop" do

  erb :shop
end

get "/about" do

  erb :about
end

get "/events" do

  erb :events
end

get "/newsletter" do

  erb :newsletter
end

get "/cakes" do

  erb :cakes
end

get "/cookies" do

  erb :cookies
end

get "/muffins" do

  erb :muffins
end

get "/faq" do

  erb :faq
end

get "/terms" do

  erb :terms
end