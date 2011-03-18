# == Schema Information
#
# Table name: suggestions
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  memo       :text
#  created_at :datetime
#  updated_at :datetime
#

#app/models/suggestions
class Suggestions < ActiveRecord::Base
end
