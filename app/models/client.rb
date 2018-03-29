# == Schema Information
#
# Table name: clients
#
#  id         :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base
  # making id column act as primary key
  self.primary_key = :id

  has_many :tokens
end
