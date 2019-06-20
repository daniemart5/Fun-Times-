bob = User.create(name: "Bob")
noelle = User.create(name: "noelle")

mariners_game = Event.create(name: "Mariners Game", location: "Seattle", date: "june 5th", price: 50, kind: "sports")
jet_city-improv = Event.create(name: "Jet City Improv", location: "Seattle", date: "every friday and saturday night", price: 20, kind: "comedy")
beyonce = Event.create(name: "Beyonce Homecoming Tour", location: "Houston", date: "november 15th", price: 450, kind: "concert")
wicked = Event.create(name: "Wicked", location: "New York", date: "january 20th", price: 250, kind: "theatre")

experience1 = Experience.create(user: bob, event: mariners_game, review: "It was awesome!", rating: "Super Awesome Parrot")
