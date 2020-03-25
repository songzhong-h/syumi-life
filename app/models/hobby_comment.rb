class HobbyComment < ApplicationRecord
	belongs_to :user
    belongs_to :hobby_image
end
