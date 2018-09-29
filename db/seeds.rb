# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


match = Match.create!
ben = match.players.create(name: "Tim")
karl =  match.players.create(name:"Brian")
s1= match.scores.create(goals: 2, player:ben)
s2= match.scores.create(goals: 3, player:karl)

match2 = Match.create!
match2.players << ben
match2.players << karl
s3= match2.scores.create(goals: 4, player:ben)
s4= match2.scores.create(goals: 5, player:karl)

match2 = Match.create!
match2.players << ben
match2.players << karl
s3= match2.scores.create(goals: 2, player:ben)
s4= match2.scores.create(goals: 4, player:karl)

match2 = Match.create!
match2.players << ben
match2.players << karl
s3= match2.scores.create(goals: 2, player:ben)
s4= match2.scores.create(goals: 3, player:karl)



