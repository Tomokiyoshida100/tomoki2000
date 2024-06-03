class Food < ApplicationRecord
    mount_uploader :image, ImageUploader
#tweetsテーブルから中間テーブルに対する関連付け
has_many :food_tag_relations, dependent: :destroy
#tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
has_many :tags, through: :food_tag_relations, dependent: :destroy
end

