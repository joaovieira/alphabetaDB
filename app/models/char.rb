class Char < ActiveRecord::Base
  has_many :glyphs
  has_one :sound
  has_many :references
  belongs_to :script
end
