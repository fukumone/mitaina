# == Schema Information
#
# Table name: evaluations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_evaluations_on_comment_id  (comment_id)
#  index_evaluations_on_user_id     (user_id)
#

class Evaluation < ActiveRecord::Base
  # ステータス: good (いいね), bad (くそだね)
  # enum status: { good: 0, bad: 1 }
end
