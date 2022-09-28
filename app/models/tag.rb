class Tag < ApplicationRecord
  validates :name, presence:true

  has_many :tags_articles, dependent: :destroy #親であるarticleが削除されたとき、それと紐づくtags_articlesも削除できるように追加
  has_many :articles, through: :tags_articles
end
