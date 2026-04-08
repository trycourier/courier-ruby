# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#put_locale
    class NotificationPutLocaleParams < Courier::Models::NotificationLocalePutRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute locale_id
      #
      #   @return [String]
      required :locale_id, String

      # @!method initialize(id:, locale_id:, request_options: {})
      #   @param id [String]
      #   @param locale_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
