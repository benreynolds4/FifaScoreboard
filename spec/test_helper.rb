def create_match
	match = Match.create!
	ben = match.players.create(name: "Ben")
	karl =  match.players.create(name:"Karl")
	match.scores.create(goals: 2, player:ben)
	match.scores.create(goals: 3, player:karl)

	match.save

	match
end