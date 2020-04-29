class HeadshotCoordinate < ApplicationRecord
  belongs_to :user, :foreign_key => "user_headshot_id"
end
