class TagsArticle < ApplicationRecord
  belongs_to :tag
  belongs_to :article
end
