class MatchesController < ApplicationController
	def new 
		@match = Match.new
	end 

	def create 
		match = Match.create!
		player_one = Player.find(params[:match][:player_one_id])
		player_two = Player.find(params[:match][:player_two_id])
		if not player_one.eql?(player_two)
			match.players << player_one
			match.players << player_two
			s1= match.scores.create(goals: params[:match][:player_one_score], player:player_one)
			s2= match.scores.create(goals: params[:match][:player_two_score], player:player_two)
			match.save
		else 
			@match = Match.new
			@match.errors.add(:match, "Can't play yourself")
		end
	end 

	def show
		@matches = Match.all.reverse
	end

   def update
    @matches = Match.find(params[:id])
    if @matches.update(match_params)
      redirect_to edit_matches_path
    else
      render 'edit'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

	  def destroy
	    @match = Match.find(params[:id])
	    @match.destroy
	  end	

	private
	
	def match_params
	    params.require(:match).merge(player_one: params[:player_one_id], player_two: params[:player_two_id], player_one_score: params[:player_one_score], player_two_score: params[:player_two_score])
	end
end
