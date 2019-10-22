class Task < ApplicationRecord
    belongs_to :user
    validates :title, :content, presence:true
    validates :content, presence:true 
    validates :start_date, presence:true
    validates :end_date, presence:true
    enum priority: [:low,:medium,:high]
    paginates_per 10
    
end
