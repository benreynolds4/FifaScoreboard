class Score
  include Mongoid::Document
  belongs_to :player
  has_and_belongs_to_many :matches

  field :goals, type: Integer
end
