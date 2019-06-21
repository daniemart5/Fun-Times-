bob = User.create(name: "Bob")
noelle = User.create(name: "noelle")
nick = User.create(name: "Nick")
danie = User.create(name: "Danie")

mariners_game = Event.create(name: "Mariners Game", location: "Seattle", date: "june 5th", kind: "sports")
jet_city_improv = Event.create(name: "Jet City Improv", location: "Seattle", date: "every friday and saturday night", kind: "comedy")
beyonce = Event.create(name: "Beyonce Homecoming Tour", location: "Houston", date: "november 15th", kind: "concert")
wicked = Event.create(name: "Wicked", location: "New York", date: "january 20th", kind: "theatre")

experience1 = Experience.create(user: bob, event: mariners_game, review: "It was awesome!", rating: "Super Awesome Parrot", doAgain: "True")
