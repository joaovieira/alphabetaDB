class Script < ActiveRecord::Base
  has_many :chars
  has_many :references

  validates :name, :presence => true
end
