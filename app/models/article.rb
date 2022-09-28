class Article < ApplicationRecord
  validates :title, presence:true
  validates :content, presence:true
  belongs_to :user

  has_many :tags_articles, dependent: :destroy  #親であるarticleが削除されたとき、それと紐づくtags_articlesも削除できるように追加
  has_many :tags, through: :tags_articles
end
