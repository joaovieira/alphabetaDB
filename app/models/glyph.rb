class Glyph < ActiveRecord::Base
  belongs_to :char
  has_many :references
end
