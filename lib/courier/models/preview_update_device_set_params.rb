# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Previews#update_device_set
    class PreviewUpdateDeviceSetParams < Courier::Models::CreateDeviceSetRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute device_set_id
      #
      #   @return [String]
      required :device_set_id, String

      # @!method initialize(device_set_id:, request_options: {})
      #   @param device_set_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
