require 'sinatra'
require 'pony'
raise "provide the password" if ARGV.length.zero?
get '/' do
#    Pony.mail :to => 'susana.rodriguez.leon@gmail.com',
#              :from => 'susana.rodriguez.leon@gmail.com',
#              :subject => 'Howdy, Partna!',
#              :body => 'Hello!'
    email = ARGV.shift
    pass = ARGV.shift
    Pony.mail({
      :to => email,
      :body => "Hello Casiano",
      :subject => 'Howdy, Partna!',
      :via => :smtp,
      :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => ARGV.shift,
          :password             => pass,
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
        }
    })
    "Check your email at #{email}"
end
