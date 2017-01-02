class Stat < ApplicationRecord
  belongs_to :statable, polymorphic: true
end
