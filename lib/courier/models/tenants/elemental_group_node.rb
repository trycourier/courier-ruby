# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      class ElementalGroupNode < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #   Sub elements to render.
        #
        #   @return [Array<Courier::Models::Tenants::ElementalNode>]
        required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::Tenants::ElementalNode] }

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

        # @!method initialize(elements:, channels: nil, if_: nil, loop_: nil, ref: nil)
        #   @param elements [Array<Courier::Models::Tenants::ElementalNode>] Sub elements to render.
        #
        #   @param channels [Array<String>, nil]
        #
        #   @param if_ [String, nil]
        #
        #   @param loop_ [String, nil]
        #
        #   @param ref [String, nil]
      end
    end
  end
end
