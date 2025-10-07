# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      class ElementalBaseNode < Courier::Internal::Type::BaseModel
        # @!attribute channels
        #
        #   @return [Array<String>, nil]
        optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute if_
        #
        #   @return [String, nil]
        optional :if_, String, api_name: :if, nil?: true

        # @!attribute loop_
        #
        #   @return [String, nil]
        optional :loop_, String, api_name: :loop, nil?: true

        # @!attribute ref
        #
        #   @return [String, nil]
        optional :ref, String, nil?: true

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
      end
    end
  end
end
