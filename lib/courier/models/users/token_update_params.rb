# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tokens#update
      class TokenUpdateParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute patch
        #
        #   @return [Array<Courier::Models::Users::TokenUpdateParams::Patch>]
        required :patch, -> { Courier::Internal::Type::ArrayOf[Courier::Users::TokenUpdateParams::Patch] }

        # @!method initialize(user_id:, patch:, request_options: {})
        #   @param user_id [String]
        #   @param patch [Array<Courier::Models::Users::TokenUpdateParams::Patch>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

        class Patch < Courier::Internal::Type::BaseModel
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
