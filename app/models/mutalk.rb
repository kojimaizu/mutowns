class Mutalk < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: {minimum: 1, maximum: 20}
  validates :content, presence: true, length: {minimum: 1, maximum: 1000}
  
  has_many :mutalks
  has_many :favorites #自分がお気に入りしている投稿内容への参照
  has_many :likings, through: :favorites, source: :mutalk #自分がお気にいりしている投稿内容を取得
  
end
