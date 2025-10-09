# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Tokens#update
      class TokenUpdateParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute patch
        #
        #   @return [Array<Trycourier::Models::Users::TokenUpdateParams::Patch>]
        required :patch, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Users::TokenUpdateParams::Patch] }

        # @!method initialize(user_id:, patch:, request_options: {})
        #   @param user_id [String]
        #   @param patch [Array<Trycourier::Models::Users::TokenUpdateParams::Patch>]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]

        class Patch < Trycourier::Internal::Type::BaseModel
          # @!attribute op
          #   The operation to perform.
          #
          #   @return [String]
          required :op, String

          # @!attribute path
          #   The JSON path specifying the part of the profile to operate on.
          #
          #   @return [String]
          required :path, String

          # @!attribute value
          #   The value for the operation.
          #
          #   @return [String, nil]
          optional :value, String, nil?: true

          # @!method initialize(op:, path:, value: nil)
          #   @param op [String] The operation to perform.
          #
          #   @param path [String] The JSON path specifying the part of the profile to operate on.
          #
          #   @param value [String, nil] The value for the operation.
        end
      end
    end
  end
end
