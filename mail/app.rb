require 'sinatra'
require 'pony'
raise "Execute:\n\t#{$0} password email_to email_from" if ARGV.length.zero?
get '/' do
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
