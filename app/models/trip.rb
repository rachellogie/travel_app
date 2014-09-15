class Trip < ActiveRecord::Base

  belongs_to :country
  belongs_to :user

  has_many :photos

end