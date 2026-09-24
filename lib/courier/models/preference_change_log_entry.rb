# frozen_string_literal: true

module Courier
  module Models
    class PreferenceChangeLogEntry < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for this change.
      #
      #   @return [String]
      required :id, String

      # @!attribute custom_routing
      #   The channels chosen for this topic, present only when has_custom_routing is
      #   true. Empty otherwise.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>]
      required :custom_routing, -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] }

      # @!attribute has_custom_routing
      #   Whether specific delivery channels were chosen for this topic rather than the
      #   topic's default routing.
      #
      #   @return [Boolean]
      required :has_custom_routing, Courier::Internal::Type::Boolean

      # @!attribute status
      #   The subscription status the change set.
      #
      #   @return [Symbol, Courier::Models::PreferenceStatus]
      required :status, enum: -> { Courier::PreferenceStatus }

      # @!attribute timestamp
      #   When the change was made, as an ISO-8601 date-time in UTC.
      #
      #   @return [String]
      required :timestamp, String

      # @!attribute topic_id
      #   The subscription topic the change applies to.
      #
      #   @return [String]
      required :topic_id, String

      # @!attribute topic_name
      #   The display name of that topic when the change was made.
      #
      #   @return [String]
      required :topic_name, String

      # @!attribute user_id
      #   The user whose preference changed.
      #
      #   @return [String]
      required :user_id, String

      # @!attribute previous
      #   The value before this change, where it was recorded.
      #
      #   @return [Courier::Models::PreferenceChangeLogValue, nil]
      optional :previous, -> { Courier::PreferenceChangeLogValue }

      # @!attribute tenant_id
      #   The tenant context the change was made in. Absent when the user set the
      #   preference outside any tenant.
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(id:, custom_routing:, has_custom_routing:, status:, timestamp:, topic_id:, topic_name:, user_id:, previous: nil, tenant_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::PreferenceChangeLogEntry} for more details.
      #
      #   @param id [String] Unique identifier for this change.
      #
      #   @param custom_routing [Array<Symbol, Courier::Models::ChannelClassification>] The channels chosen for this topic, present only when has_custom_routing is true
      #
      #   @param has_custom_routing [Boolean] Whether specific delivery channels were chosen for this topic rather than the to
      #
      #   @param status [Symbol, Courier::Models::PreferenceStatus] The subscription status the change set.
      #
      #   @param timestamp [String] When the change was made, as an ISO-8601 date-time in UTC.
      #
      #   @param topic_id [String] The subscription topic the change applies to.
      #
      #   @param topic_name [String] The display name of that topic when the change was made.
      #
      #   @param user_id [String] The user whose preference changed.
      #
      #   @param previous [Courier::Models::PreferenceChangeLogValue] The value before this change, where it was recorded.
      #
      #   @param tenant_id [String] The tenant context the change was made in. Absent when the user set the preferen
    end
  end
end
