#
module V1
  #
  module Defaults
    extend ActiveSupport::Concern

    included do
      helpers do
        def permitted_params
          @permitted_params ||= declared(params,
                                         include_missing: false)
        end

        def logger
          Rails.logger
        end
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: e.message, status: 404)
      end

      rescue_from Trailblazer::Operation::InvalidContract do |e|
        error_response(message: e.message, status: 422)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error_response(message: e.message, status: 422)
      end
    end
  end
end
