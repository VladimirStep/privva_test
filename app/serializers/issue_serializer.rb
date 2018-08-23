class IssueSerializer < ActiveModel::Serializer
  attributes :id, :status, :summary

  belongs_to :reporter
  belongs_to :assignee
end
