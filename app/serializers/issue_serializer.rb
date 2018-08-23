class IssueSerializer < ActiveModel::Serializer
  attributes :id, :status, :summary
end
