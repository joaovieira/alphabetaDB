class Sound < ActiveRecord::Base
  has_and_belongs_to_many :chars
  has_many :references

  validates :name, :symbol, :presence => true
end
