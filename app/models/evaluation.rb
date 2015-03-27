# == Schema Information
#
# Table name: evaluations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  status     :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_evaluations_on_comment_id  (comment_id)
#  index_evaluations_on_user_id     (user_id)
#

# status: { non:0(評価保留), good:1(いいね), bad:2(くそだね) }

class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
end
