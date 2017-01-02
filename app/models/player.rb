class Player < ApplicationRecord
  has_one :stat, as: :statable
  belongs_to :team
  belongs_to :intervalable, polymorphic: true
end
