require "sinatra"
require "sendgrid-ruby"
require "sinatra/reloader"

include SendGrid

# @email = params[:to]
# @name = params[:name]

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

get "/newsletter" do
  erb :newsletter
end

# post "/newsletter" do
#   from = Email.new(email: ENV["PERSONAL_EMAIL"])
#   to = Email.new(email: @email )
#   subject = "You have been subscribed!"
#   content = Content.new(
#     type: "text/plain",
#     value: "Congratulations, you have been subscribe into Mariia\'s Shop Newsletter. We are so excited to have you join our catalog. Each month we will mail you a variety of great web articles about diabetes and obesity. Thank you" + @name + ", here is your coupon for 10,000 cookies for $10,000! (hurry while supplies last)"
#   )

# # create mail object with from, subject, to and content
#   mail = Mail.new(from, subject, to, name, content)

# # sets up the api key
#   sg = SendGrid::API.new(
#     api_key: ENV["SENDGRID_API_KEY"]
#   )
#   response = sg.client.mail._("send").post(request_body: mail.to_json)

#   redirect "/thanks"
# end
