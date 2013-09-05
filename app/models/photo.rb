class Photo < ActiveRecord::Base
validates :name, presence: true
validates :url, presence: true, uniqueness: true
has_many :comments 

def vote_up
  self.update_column(:votes, self.votes+=1)
end

def vote_down
  self.update_column(:votes, self.votes-=1)
end

end
