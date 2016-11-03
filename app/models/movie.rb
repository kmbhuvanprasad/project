class Movie < ActiveRecord::Base
	has_many :users

	validates :title,presence: true,length: {minimum: 3}
	validates :year,presence: true
	validates :rating,presence: true,format: {with: /( (?=.*\d)) /x}
	validates :actors,presence: true
	validates :director,presence: true
	validates :producer,presence: true
	validates :language,presence: true
end
