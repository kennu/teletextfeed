class Page < ActiveRecord::Base
  has_many :subpages
  validates :number, :presence => true, :uniqueness => true
end
