# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::PreferenceSections#create
    class PreferenceSectionCreateParams < Courier::Models::PreferenceSectionCreateRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
