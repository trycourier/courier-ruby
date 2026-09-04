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

        # @!attribute token
        #
        #   @return [String]
        required :token, String

        # @!attribute patch
        #
        #   @return [Array<Courier::Models::Users::TokenUpdateParams::Patch>]
        required :patch, -> { Courier::Internal::Type::ArrayOf[Courier::Users::TokenUpdateParams::Patch] }

        # @!method initialize(user_id:, token:, patch:, request_options: {})
        #   @param user_id [String]
        #   @param token [String]
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
          #   The value for the operation. A string for most fields; boolean `false` when
          #   disabling token expiration via `expiry_date`, which cannot be expressed as a
          #   string.
          #
          #   @return [String, Boolean, Hash{Symbol=>Object}, nil]
          optional :value, union: -> { Courier::Users::TokenUpdateParams::Patch::Value }, nil?: true

          # @!method initialize(op:, path:, value: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Users::TokenUpdateParams::Patch} for more details.
          #
          #   @param op [String] The operation to perform.
          #
          #   @param path [String] The JSON path specifying the part of the profile to operate on.
          #
          #   @param value [String, Boolean, Hash{Symbol=>Object}, nil] The value for the operation. A string for most fields; boolean `false` when disa

          # The value for the operation. A string for most fields; boolean `false` when
          # disabling token expiration via `expiry_date`, which cannot be expressed as a
          # string.
          #
          # @see Courier::Models::Users::TokenUpdateParams::Patch#value
          module Value
            extend Courier::Internal::Type::Union

            variant String

            variant Courier::Internal::Type::Boolean

            variant -> { Courier::Models::Users::TokenUpdateParams::Patch::Value::UnionMember2Map }

            # @!method self.variants
            #   @return [Array(String, Boolean, Hash{Symbol=>Object})]

            # @type [Courier::Internal::Type::Converter]
            UnionMember2Map = Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]
          end
        end
      end
    end
  end
end
