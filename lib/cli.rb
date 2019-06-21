require 'rest-client'
require 'pry'
class CommandLineInterface

    def message
      puts "Welcome to Fun Times!"
      puts "Enter your name to get started:"
        name = STDIN.gets.chomp
        @@user_new = User.create(name: name)
      puts "Welcome #{name}!"
    end

    def the_purpose
      puts "Wanna do something fun right?"
      puts "Lets find it :D!"
    end

    def the_question
      puts "Which city are you in?"
        city_name = STDIN.gets.chomp.downcase
        if city_name == nil
          puts "Sorry not serving that city :C"
        else
      puts "Awesome ! #{city_name} is a great place! :)"
      puts "Here you go!"
        end
      url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&city=#{city_name}&apikey=l1YTnmKzLOimbir2sDgp9G42YeeGkyAj"

      info = RestClient.get(url)
      json = JSON.parse(info)
      event_res = json["_embedded"]
        event_info = event_res["events"][1]
        event_name = event_res["events"][0].values[0]
        event_date = event_info["dates"]["start"]["localDate"]
        event_city = event_info["_embedded"]["venues"][0].values[9]
        event_kind = event_info["_embedded"]["attractions"][0].values[7][0]["segment"]["name"]

      event_new = Event.create(name: event_name, location: event_city, date: event_date, kind: event_kind)

      puts "****************************************"
      puts "Event: #{event_name}"
      puts "Date: #{event_date}"
      puts "City: #{event_city}"
      puts "Kind: #{event_kind}"
    end

    def getting_experiences
      puts "Want to create an experience?!"
      answer = STDIN.gets.chomp.downcase
        if answer == "No"
          puts " Til next time!"
          else
            puts "|---___----___----___----|"
            puts "What was the event called?"
            new_event= gets.chomp

            puts "What city was #{new_event} in?"
            new_city = gets.chomp

            puts "When was #{new_event}?"
            new_date = gets.chomp

            puts "What kind of event was it?"
            new_kind = gets.chomp
            @@new_event = Event.create(name: new_event, location: new_city, date: new_date, kind: new_kind)

            puts "Now lets make a review!"
            puts "What did you like?"
            review = gets.chomp

            puts "From 0: 'Horrible maaaan' to 5: 'The best in the whole world!' what was the experience like?"
            rating = gets.chomp

            puts "True or False: Would you do it again?"
            doAgain = gets.chomp

            puts "Thanks friend! See you again!"
            puts "|---___----___----___----___|"
          end
          experience_new = Experience.create(event: @@new_event, user: @@user_new, review: review, rating: rating, doAgain: doAgain)
        end
      end
    def find_user
      puts "Want to find a user?"
          answer = STDIN.gets.chomp.downcase
        if answer == "no"
          puts "Til next time!"

      puts "Enter name:"
        name_of_user = gets.chomp
        found = User.find_by(name: name_of_user)
        puts "Here you go!"
        puts found
    end
    def find_user_experience
      puts "Want to find a past experence?"
        answer = STDIN.gets.chomp.downcase
      if answer == "no"
        puts "Til next time!"
      else
        puts "Enter name:"
        past_experience = gets.chomp
        found_the_past = User.find_by(name: past_experience)
        puts found_the_past
      end
    end
  end
