# frozen_string_literal: true

module Trycourier
  module Models
    class Pagerduty < Trycourier::Internal::Type::BaseModel
      # @!attribute event_action
      #
      #   @return [String, nil]
      optional :event_action, String, nil?: true

      # @!attribute routing_key
      #
      #   @return [String, nil]
      optional :routing_key, String, nil?: true

      # @!attribute severity
      #
      #   @return [String, nil]
      optional :severity, String, nil?: true

      # @!attribute source
      #
      #   @return [String, nil]
      optional :source, String, nil?: true

      # @!method initialize(event_action: nil, routing_key: nil, severity: nil, source: nil)
      #   @param event_action [String, nil]
      #   @param routing_key [String, nil]
      #   @param severity [String, nil]
      #   @param source [String, nil]
    end
  end
end
