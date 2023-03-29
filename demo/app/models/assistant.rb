class Assistant < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
