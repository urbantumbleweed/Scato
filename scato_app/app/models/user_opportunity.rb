class UserOpportunity < ActiveRecord::Base
	belongs_to :user
	belongs_to :opportunity
end