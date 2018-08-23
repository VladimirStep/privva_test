module Api
  module V1
    class IssuesController < ApplicationController
      def index
        issues = Issue.all
        render json: issues
      end
    end
  end
end