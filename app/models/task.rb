class Task < ApplicationRecord
    validates :title, :content, presence:true
    validates :content, presence:true 
    validates :start_date, presence:true
    validates :end_date, presence:true
end
