require "rails_helper"
require 'test_helper'



RSpec.describe Match, :type => :model do


  context "creates match" do
    it "with 2 scores and players" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 3, player:karl)
	
		expect(match.reload.scores).to eq([s1,s2])
        expect(match.reload.players).to eq([ben, karl])
    end
  end


  context "Winners" do
  	it "Karl as Winner" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 2, player:ben)
		match.scores.create(goals: 3, player:karl)
	
        expect(match.reload.winner).to eq([karl])
    end

    it "Winner of Draw Game" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 3, player:ben)
		match.scores.create(goals: 3, player:karl)
	
        expect(match.reload.winner).to eq([ben, karl])
    end

    it "Winner of Nil Nil Draw" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 0, player:ben)
		match.scores.create(goals: 0, player:karl)
	
        expect(match.reload.winner).to eq([ben, karl])
    end
  end



 context "Losers" do
  	it "Karl as loser" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 4, player:ben)
		match.scores.create(goals: 3, player:karl)
        expect(match.reload.loser).to eq([karl])
    end

    it "Loser of Draw Game" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 3, player:ben)
		match.scores.create(goals: 3, player:karl)
        expect(match.reload.loser).to be_nil
    end

    it "Loser of Nil Nil Draw" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 0, player:ben)
		match.scores.create(goals: 0, player:karl)
        expect(match.reload.loser).to be_nil
    end
  end

  context "Draw?" do 
    it "Draw Game" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 3, player:ben)
		match.scores.create(goals: 3, player:karl)
	
        expect(match.draw?).to be true
    end

    it "Not Draw Game" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		match.scores.create(goals: 1, player:ben)
		match.scores.create(goals: 3, player:karl)
	
        expect(match.draw?).to be false
    end
  end
  
end