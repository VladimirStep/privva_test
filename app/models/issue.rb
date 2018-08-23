class Issue < ApplicationRecord
  belongs_to :reporter, class_name: 'User', foreign_key: :reporter_id
  belongs_to :assignee, class_name: 'User', foreign_key: :assignee_id

  scope :filter, ->(params) {
    relation = left_outer_joins(:reporter, :assignee).where nil
    relation = relation.order(created_at: params[:sort_order].to_sym) if %i[asc desc].include?(params[:sort_order].to_sym)
    relation
  }

  enum status: %i[active archived]

  self.per_page = 10
end
