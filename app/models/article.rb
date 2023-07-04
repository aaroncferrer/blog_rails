class Article < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :body, presence: true
    validates :preview, presence: true, uniqueness: true, length: { minimum: 10, maximum: 50 }  
    validates :img_name, presence: true, uniqueness: true, length: { maximum: 15 }  
end
