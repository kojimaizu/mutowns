class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :mutalks
    has_many :favorites
    has_many :likings, through: :favorites, source: :mutalk
    
    def favorite(user)
        self.favorites.find_or_create_by(mutalk_id: user.id)
    end
    
    def unfavorite(user)
        favorite = self.favorites.find_by(mutalk_id: user.id)
        favorite.destroy if favorite
    end
    
    def liking?(mutalk)
        self.likings.include?(mutalk)
    end
    #お気に入りしている投稿内容達を取得し、既に自分がお気に入りしていないか確認。
end
