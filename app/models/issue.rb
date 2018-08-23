class Issue < ApplicationRecord
  belongs_to :reporter, class_name: 'User', foreign_key: :reporter_id
  belongs_to :assignee, class_name: 'User', foreign_key: :assignee_id

  scope :filter, ->(params) {
    relation = where nil
    relation = relation.joins('INNER JOIN "users" "reporters" ON "reporters"."id" = "issues"."reporter_id"').where(reporters: { name: params[:reporter_name] }) if params[:reporter_name].present?
    relation = relation.joins('INNER JOIN "users" "assignees" ON "assignees"."id" = "issues"."assignee_id"').where(assignees: { name: params[:assignee_name] }) if params[:assignee_name].present?
    relation = relation.order(created_at: params[:sort_order].to_sym) if %i[asc desc].include?(params[:sort_order].to_sym)
    relation
  }

  enum status: %i[active archived]

  self.per_page = 10
end
