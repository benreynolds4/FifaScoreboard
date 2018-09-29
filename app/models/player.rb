class Player
  include Mongoid::Document
  field :name, type: String
   has_and_belongs_to_many :matches
   has_many :scores


  def wins
   	wins = []
   	self.matches.each do |match|
   		if match.winner.eql?([self])
   			wins << match
   		end
    end
    wins
  end

  def loses
  	loses = []
   	self.matches.each do |match|
   		if not match.winner.include?(self)
   			loses << match
   		end
    end
    loses
  end

  def draws
  	draws = []
   	self.matches.each do |match|
   		if match.winner.include?(self) and match.winner.count > 1
   			draws << match
   		end
    end
    draws
  end

  def total_wins
   	wins = 0
   	self.matches.each do |match|
   		if match.winner.eql?([self])
   			wins += 1
   		end
    end
    wins
  end

  def total_loses
  	loses = 0
   	self.matches.each do |match|
   		if not match.winner.include?(self)
   			loses += 1
   		end
    end
    loses
  end

  def total_draws
  	draws = 0
   	self.matches.each do |match|
   		if match.winner.include?(self) and match.winner.count > 1
   			draws += 1
   		end
    end
    draws
  end

  def goal_difference
    scores_for = Scores.where(player: self)
  end

  def total_games
  	self.matches.count
  end 

  def percentage_wins
    if self.total_games != 0
      (self.wins.count.to_f / self.total_games.to_f) * 100.0
    elsif self.total_games == 0
       0
    end
  end 

  def get_weighted_wins
    #(self.total_wins * self.average_wins_of_all_players) / (self.total_wins + self.total_loses + self.total_draws )
    ((4) * (self.total_wins) + (-1) * (self.total_loses) + (2) *(self.total_draws)) / self.total_games
  end 


  def average_wins_of_all_players
    players = Player.all
    total_percentage_wins = 0
    players.each do |player|
      total_percentage_wins += player.percentage_wins
    end
    total_percentage_wins / players.count
  end 
end
