# frozen_string_literal: true

module Courier
  module Models
    class NotificationElementPutRequest < Courier::Internal::Type::BaseModel
      # @!attribute type
      #   Element type (text, meta, action, image, etc.).
      #
      #   @return [String]
      required :type, String

      # @!attribute channels
      #
      #   @return [Array<String>, nil]
      optional :channels, Courier::Internal::Type::ArrayOf[String]

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute if_
      #
      #   @return [String, nil]
      optional :if_, String, api_name: :if

      # @!attribute loop_
      #
      #   @return [String, nil]
      optional :loop_, String, api_name: :loop

      # @!attribute ref
      #
      #   @return [String, nil]
      optional :ref, String

      # @!attribute state
      #   Template state. Defaults to `DRAFT`.
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateState, nil]
      optional :state, enum: -> { Courier::NotificationTemplateState }

      # @!method initialize(type:, channels: nil, data: nil, if_: nil, loop_: nil, ref: nil, state: nil)
      #   Request body for updating a single element. Additional type-specific fields are
      #   allowed.
      #
      #   @param type [String] Element type (text, meta, action, image, etc.).
      #
      #   @param channels [Array<String>]
      #
      #   @param data [Hash{Symbol=>Object}]
      #
      #   @param if_ [String]
      #
      #   @param loop_ [String]
      #
      #   @param ref [String]
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateState] Template state. Defaults to `DRAFT`.
    end
  end
end
