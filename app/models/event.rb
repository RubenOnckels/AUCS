class Event < ActiveRecord::Base

	validates :title, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :venue, presence: true
	
end
