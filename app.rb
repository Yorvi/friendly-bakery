require "sinatra"
require "sendgrid-ruby"
require "sinatra/reloader"

include SendGrid


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

get "/catalog" do
  erb :catalog
end

get "/thanks" do

  erb :thanks
end

get "/thanks2" do

  erb :thanks2
end

post "/catalog" do
@email = params[:to]
@name = params[:name]
  from = Email.new(email: ENV["PERSONAL_EMAIL"])
  to = Email.new(email: @email )
  subject = "You have been subscribed!"
  content = Content.new(
    type: "text/html",
    value: "<p>Congratulations, you have been subscribe into Mariia\'s Shop Catalog. We are so excited to have you join our catalog.</p>
    <br>
    Below is a list of what we have to offer:
    <br>
    <br>
    <ul><h3>Cakes:</h3>
        <li>Berry Mirror Cake ..... $99.99 whole / $9.99 slice</li>
        <li>Lemon Meringue Cake ..... $99.99 whole / $9.99 slice</li>
        <li>Neapolitan Ice Cream Cake ..... $99.99 whole / $9.99 slice</li>
        <li>Pomegranate Mousse Cake ..... $99.99 whole / $9.99 slice</li>
        <li>Red, White, & Blue Cake ..... $99.99 whole / $9.99 slice</li>
        <li>Vanilla White Cake ..... $99.99 whole / $9.99 slice</li>
    </ul>
    <br>
    <ul><h3>Muffins:</h3> 
        <li>Apple Pie Muffins ..... $34.99 by the dozen / $2.99 per muffin</li>
        <li>Blueberry Muffins ..... $34.99 by the dozen / $2.99 per muffin</li>
        <li>Carrot Cake Muffins ..... $34.99 by the dozen / $2.99 per muffin</li>
        <li>Cherry Creamcheese Muffins ..... $34.99 by the dozen / $2.99 per muffin</li>
        <li>Coconut Muffins ..... $34.99 by the dozen / $2.99 per muffin</li>
        <li>Coffee Cake Muffins ..... $34.99 by the dozen / $2.99 per muffin</li>
    </ul>
    <br>
    <ul><h3>Cookies:</h3> 
        <li>Brown Butter M&M Cookies ..... $14.99 pack of 12 / $1.50 per cookie</li>
        <li>Sugar Cookies ..... $14.99 pack of 12 / $1.50 per cookie</li>
        <li>Chocolate Cookies ..... $14.99 pack of 12 / $1.50 per cookie</li>
        <li>Chocolate Chip Cookies ..... $14.99 pack of 12 / $1.50 per cookie</li>
        <li>Fudge Chocolate Cookies ..... $14.99 pack of 12 / $1.50 per cookie</li>
        <li>Snickerdoodle Cookies ..... $14.99 pack of 12 / $1.50 per cookie</li>
    </ul>
    <br>
    <br>
    <br>
    <p>Thank you " + @name + ", here is your coupon code 'COOKIEMONSTA07' for 10,000 cookies for $10,000! (hurry while supplies last)</p>"
  )

# create mail object with from, subject, to and content
  mail = Mail.new(from, subject, to, content)

# sets up the api key
  sg = SendGrid::API.new(
    api_key: ENV["SENDGRID_API_KEY"]
  )
  response = sg.client.mail._("send").post(request_body: mail.to_json)

  redirect "/thanks"
end


post "/events" do
  @email = params[:from]
  @name = params[:name]
  @contentt = params[:content]
  @date = params[:date]
  
    from = Email.new(email: @email)
    to = Email.new(email: ENV["PERSONAL_EMAIL"] )
    subject = "UPCOMING EVENT: " + @date + " for " + @name
    content = Content.new(
      type: "text/plain",
      value: @content
    )

# create mail object with from, subject, to and content
  mail = Mail.new(from, subject, to, content)

# sets up the api key
  sg = SendGrid::API.new(
    api_key: ENV["SENDGRID_API_KEY"]
  )
  response = sg.client.mail._("send").post(request_body: mail.to_json)

  redirect "/thanks2"
end