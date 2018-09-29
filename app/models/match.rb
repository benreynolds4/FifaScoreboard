class Match
  include Mongoid::Document
  has_and_belongs_to_many :scores
  has_and_belongs_to_many :players

  field :date, type: DateTime

  def winner
  	init_score = -1
  	winner = []
  	self.scores.each do |score|
  		if score.goals > init_score
  			winner= [score.player]
  		elsif score.goals == init_score
  			winner.push(score.player)
  		end
  		init_score = score.goals
  	end
  	winner
  end

  def draw?
    if not self.scores.empty?
    	if self.scores[0].goals == self.scores[1].goals
    		return true
    	end
    	return false
    end
  end

  def loser 
  	if not self.draw?
  		self.players - self.winner
  	end
  end 

  def print_players 
    players = ""
    self.players.each do |player|
      players += player.name + " "
    end
    players
  end

end
