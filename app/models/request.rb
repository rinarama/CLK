class Request < ApplicationRecord
  belongs_to :user
  belongs_to :requester, class_name: "User", foreign_key: "user_id"
end
