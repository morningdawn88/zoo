# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first_name :text
#  last_name  :text
#  username   :text
#  division   :text
#  department :text
#  password   :text
#  enc_pass   :text
#  salt       :text
#

#app/models/user.rb
class User < ActiveRecord::Base
end
