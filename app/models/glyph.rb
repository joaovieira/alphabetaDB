class Glyph < ActiveRecord::Base
  has_many :references

  validates :unicode, :presence => true
end
