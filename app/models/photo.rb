class Photo < ActiveRecord::Base
validates :name, presence: true
validates :url, presence: true, uniqueness: true

end