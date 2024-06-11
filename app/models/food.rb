class Food < ApplicationRecord
    belongs_to :user
    
    mount_uploader :image, ImageUploader
    #tweetsテーブルから中間テーブルに対する関連付け
has_many :food_tag_relations, dependent: :destroy
#tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
has_many :tags, through: :food_tag_relations, dependent: :destroy
end
# app/models/post.rb
class Food < ApplicationRecord
    validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  end
  
