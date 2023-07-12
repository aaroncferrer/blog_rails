class Article < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :body, presence: true
    validates :preview, presence: true, uniqueness: true, length: { minimum: 10 }  
    validates :img_name, presence: true, uniqueness: true, length: { maximum: 15 }  

    before_save :generate_show

    def generate_show
        self.show = "#{self.name}: #{self.preview}"
        # self.save
    end
end
