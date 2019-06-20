require 'rest-client'
require 'pry'
class CommandLineInterface
#   def message
#     puts "Welcome to Fun Times!"
#     puts "Whats your name?"
#     name = gets.chomp
#
#     puts "Welcome #{name}!"
#   end
#
#   def the_purpose
#     puts "Wanna do something fun right?"
#     puts "Lets do it :D!"
#   end

  def the_question
    puts "Which city are you in?"
    city_name = gets.chomp.downcase
    # puts "Awesome! #{city_name} is a great place! :)"
    # puts "Here you go!"


    url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&city=#{city_name}&apikey=l1YTnmKzLOimbir2sDgp9G42YeeGkyAj"

    info = RestClient.get(url)
    json = JSON.parse(info)

    binding.pry
    # event_info = json['events']
    # binding.pry
    #   event_info.each do |event|
    #   puts "**************************************"
    #   puts event['name']
    #   puts event['venues']
    #   puts event['dates']['start']['localDate']
    #   puts event['classifications']['segment']['name']
    # end
    #
    # def fun_times
    #   puts "Have fun!! :D"
    # end
   end
end
