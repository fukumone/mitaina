# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nickname   :string(255)      not null
#  suspended  :boolean          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :comments
end
