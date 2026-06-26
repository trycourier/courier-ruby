# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::WorkspacePreferences#create
    class WorkspacePreferenceCreateParams < Courier::Models::WorkspacePreferenceCreateRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
