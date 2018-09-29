require "rails_helper"
require 'test_helper'

RSpec.describe Player, :type => :model do  context "Total Wins/loses/draws" do 
  	it "No Wins" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 3, player:karl)
	
		expect(ben.total_wins).to eq(0)
    end

     it "Multiple Wins" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 1, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 1, player:karl)
	
		expect(ben.total_wins).to eq(2)
    end

    it "Multiple wins with draws" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 3, player:ben)
		s2= match.scores.create(goals: 2, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s1= match2.scores.create(goals: 3, player:ben)
		s2= match2.scores.create(goals: 3, player:karl)
	
		expect(ben.total_wins).to eq(1)
    end

    it "Multiple Loses" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 3, player:karl)
	
		expect(ben.total_loses).to eq(1)
    end

    it "Multiple Loses with draws" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 3, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s1= match2.scores.create(goals: 3, player:ben)
		s2= match2.scores.create(goals: 3, player:karl)
	
		expect(ben.total_loses).to eq(1)
    end

     it "No Loses" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 1, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 1, player:karl)
	
		expect(ben.total_loses).to eq(0)
    end

     it "Multiple Draws" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 2, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 2, player:karl)
	
		expect(ben.total_draws).to eq(2)
    end


    it "No Draws" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 3, player:ben)
		s2= match.scores.create(goals: 2, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 1, player:karl)
	
		expect(ben.total_draws).to eq(0)
    end

     it "No Games" do
      	match = Match.create!
		karl =  match.players.create(name:"Karl")
		s2= match.scores.create(goals: 1, player:karl)

		match2 = Match.create!
		match2.players << karl
		s4= match2.scores.create(goals: 1, player:karl)
		ben = Player.create(name:"Ben")
		expect(ben.total_games).to eq(0)
    end

     it "Total Games" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 1, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 1, player:karl)
	
		expect(ben.total_games).to eq(2)
    end
  end

  context "Wins/loses/draws" do 
  	it "Multiple Draws" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 2, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 2, player:karl)
	
		expect(ben.draws).to eq([match, match2])
    end

    it "Multiple Wins" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 1, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 1, player:karl)
	
		expect(ben.wins).to eq([match, match2])
    end

    it "Multiple Loses" do
      	match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 1, player:ben)
		s2= match.scores.create(goals: 2, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 3, player:karl)
	
		expect(ben.loses).to eq([match, match2])
    end
  end

  context "Percentage Wins" do
  	it "100 Percent" do 
  		match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 1, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 1, player:karl)
	
		expect(ben.percentage_wins).to eq(100)
  	end

  	it "50 Percent" do 
  		match = Match.create!
		ben = match.players.create(name: "Ben")
		karl =  match.players.create(name:"Karl")
		s1= match.scores.create(goals: 2, player:ben)
		s2= match.scores.create(goals: 1, player:karl)

		match2 = Match.create!
		match2.players << ben
		match2.players << karl
		s3= match2.scores.create(goals: 2, player:ben)
		s4= match2.scores.create(goals: 3, player:karl)
	
		expect(ben.percentage_wins).to eq(50)
  	end

  	it "No Games" do 
		ben = Player.create(name: "Ben")
		expect(ben.percentage_wins).to eq(0)
  	end
  end

  context "goal difference" do 
  end 
end

