class Issue < ApplicationRecord
  belongs_to :reporter, class_name: 'User', foreign_key: :reporter_id
  belongs_to :assignee, class_name: 'User', foreign_key: :assignee_id

  enum status: %i[active archived]

  self.per_page = 10
end
