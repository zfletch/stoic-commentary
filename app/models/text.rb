class Text < ApplicationRecord
  has_many :editions
  has_many :references

  validates :urn, uniqueness: true
end
