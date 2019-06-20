require 'rest-client'

class CommandLineInterface
  def message
    puts "Welcome to Fun Times!"
    puts "Whats your name?"
    name = gets.chomp

    puts "Welcome #{name}!"
  end

  def the_purpose
    puts "Wanna do something fun right?"
    puts "Lets do it :D!"
  end

  def the_question
    puts "Which city are you in?"
    city_name = gets.chomp
    puts "Awesome! #{city_name} is a great place! :)"

    url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&city=#{city_name.downcase}&apikey=l1YTnmKzLOimbir2sDgp9G42YeeGkyAjj"

    info = RestClient.get(url)
    json = JSON.parse(info)

    event_info = json['items']
    event_info.each do |event|
    end
      puts "**************************************"
      puts event['events']['name']
      puts event['events']['venues']
      puts event['events']['classifications']['segment']['name']
      puts event['events']['dates']['start']['localDate']
  end
end
