class Task < ApplicationRecord
    belongs_to :user
    validates :title, :content, presence:true
    validates :content, presence:true 
    validates :start_date, presence:true
    validates :end_date, presence:true
    enum priority: [:low,:medium,:high]
    paginates_per 10
    has_many :tasks_labels, dependent: :destroy
    has_many :labels, :through => :tasks_labels, dependent: :destroy
    accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
    a['label_id'].blank? }
    accepts_nested_attributes_for :labels  
    def self.search(search)
        Task.joins(:labels).where("labels.title LIKE ?", "%#{search}%")
    end 
end
