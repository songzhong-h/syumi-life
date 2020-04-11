class HobbyImage < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :hobby_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    validates :name, presence: true
    validates :image, presence: true
    def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end

    has_many :tags, dependent: :destroy
end