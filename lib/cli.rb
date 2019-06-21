require 'rest-client'
require 'pry'
class CommandLineInterface

    def message
      puts "Welcome to Fun Times!"
      puts "Enter your name to get started:"
        @@name = gets.chomp
        @@user_new = User.create(name: @@name)
      puts "Welcome #{@@name}!"
    end

    def the_purpose
      puts "Wanna do something fun right?"
      puts "Lets find it :D!"
    end

    def the_questions
      puts "Which city are you in?"
        city_name = STDIN.gets.chomp.downcase
        case city_name
        when  nil
          puts "Sorry not serving that city :C"
        else
          puts "Awesome ! #{city_name} is a great place! :)"
          puts "Here you go!"

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
      puts "****************************************"
    end

    def getting_experiences
      puts "|---___----___----___----|"
      puts "Lets create an experience!"
      puts "What was the event called?"
      new_event_name = gets.chomp

      puts "What city was #{new_event_name} in?"
      new_city = gets.chomp

      puts "When was #{new_event_name}?"
      new_date = gets.chomp

      puts "What kind of event was it?"
      new_kind = gets.chomp

      @@create_event = Event.create(name: new_event_name, location: new_city, date: new_date, kind: new_kind)

    def review
      puts "Now lets make a review!"
      puts "What did you like?"
      review = gets.chomp

      puts "From 0: 'Horrible maaaan' to 5: 'The best in the whole world!' what was the experience like?"
      rating = gets.chomp

      puts "True or False: Would you do it again?"
      doAgain = gets.chomp
      puts "Thanks friend!!"
      puts "|---___----___----___----___|"
      experience_new = Experience.create(event: @@create_event, user: @@user_new, review: review, rating: rating, doAgain: doAgain)
      end
    end

    def find_user
      # puts "Want to find a user?"
      #     answer = STDIN.gets.chomp.downcase
      #       if answer == "no"
      #       return "Til next time!"
      #   else
      puts "***************************"
      puts "Find user! Enter name:"
      name_of_user = gets.chomp
      found = User.find_by(name: name_of_user)
      puts  "Here you go!"
      puts found
    end


    def find_event
      puts "***************************"
      puts "Lets find a past event"
      puts "Enter name of experence:"
      @@past_event = gets.chomp
      found_the_past = Event.includes(name: @@past_event)
      # puts "#{found_the_past.kind}"
      # puts "#{found_the_past.location}"
      # puts "#{found_the_past.date}"
      puts "#{found_the_past}"
    end

    def delete_user
      puts "**************************"
      puts "Need to delete a user? :("
      puts "Enter name:"
      user_delete = gets.chomp

      bye_user = User.find_by(name: user_delete)
      puts "#{bye_user.destroy}"
      end

    def update_user
      puts "**************************"
      puts "Lets update your name!"
      puts "What is your nic-name"

      nic_name = gets.chomp
      update_name = User.find_by(name: @@name)
      puts update_name.update(name: nic_name)
      puts "See you next time!"
    end
  end
end
