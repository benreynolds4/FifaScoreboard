class TableController < ApplicationController
	def index
		@players = Player.all
		@players = @players.sort_by {|player| [player.get_weighted_wins, player.wins]}.reverse
		@matches = Match.all.reverse
		@match = Match.new
	end
end
