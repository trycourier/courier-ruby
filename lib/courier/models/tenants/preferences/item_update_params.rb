# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      module Preferences
        # @see Courier::Resources::Tenants::Preferences::Items#update
        class ItemUpdateParams < Courier::Models::SubscriptionTopicNew
          extend Courier::Internal::Type::RequestParameters::Converter
          include Courier::Internal::Type::RequestParameters

          # @!attribute tenant_id
          #
          #   @return [String]
          required :tenant_id, String

          # @!attribute topic_id
          #
          #   @return [String]
          required :topic_id, String

          # @!method initialize(tenant_id:, topic_id:, request_options: {})
          #   @param tenant_id [String]
          #   @param topic_id [String]
          #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
