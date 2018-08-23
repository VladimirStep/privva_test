module Api
  module V1
    class IssuesController < ApplicationController
      def index
        issues = Issue.filter(params)
                      .paginate(page: params[:page],
                                per_page: params[:page_size])
        render json: issues
      end
    end
  end
end