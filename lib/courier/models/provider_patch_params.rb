# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Providers#patch
    class ProviderPatchParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute patch
      #   Operations to apply, in order. Paths address the provider as it is returned:
      #   `/title`, `/alias`, `/provider`, and `/settings/<key>` with the snake_case
      #   setting keys, including nested paths such as `/settings/rate_limit/rate`. If any
      #   operation fails, for example a `test`, nothing is saved and the request returns
      #   a 400. The result can't change `provider`, remove `title`, or add other
      #   top-level fields. Removing `/alias` clears it.
      #
      #   @return [Array<Courier::Models::ProviderPatchParams::Patch>]
      required :patch, -> { Courier::Internal::Type::ArrayOf[Courier::ProviderPatchParams::Patch] }

      # @!method initialize(id:, patch:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ProviderPatchParams} for more details.
      #
      #   @param id [String]
      #
      #   @param patch [Array<Courier::Models::ProviderPatchParams::Patch>] Operations to apply, in order. Paths address the provider as it is returned: `/t
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      class Patch < Courier::Internal::Type::BaseModel
        # @!attribute op
        #   The operation to perform.
        #
        #   @return [Symbol, Courier::Models::ProviderPatchParams::Patch::Op]
        required :op, enum: -> { Courier::ProviderPatchParams::Patch::Op }

        # @!attribute path
        #   JSON Pointer to the field to operate on, such as `/settings/api_key`.
        #
        #   @return [String]
        required :path, String

        # @!attribute from
        #   JSON Pointer to the source field for `move` and `copy`.
        #
        #   @return [String, nil]
        optional :from, String

        # @!attribute value
        #   The value for `add`, `replace` and `test`. Any JSON value.
        #
        #   @return [Object, nil]
        optional :value, Courier::Internal::Type::Unknown

        # @!method initialize(op:, path:, from: nil, value: nil)
        #   One JSON Patch (RFC 6902) operation.
        #
        #   @param op [Symbol, Courier::Models::ProviderPatchParams::Patch::Op] The operation to perform.
        #
        #   @param path [String] JSON Pointer to the field to operate on, such as `/settings/api_key`.
        #
        #   @param from [String] JSON Pointer to the source field for `move` and `copy`.
        #
        #   @param value [Object] The value for `add`, `replace` and `test`. Any JSON value.

        # The operation to perform.
        #
        # @see Courier::Models::ProviderPatchParams::Patch#op
        module Op
          extend Courier::Internal::Type::Enum

          ADD = :add
          REMOVE = :remove
          REPLACE = :replace
          MOVE = :move
          COPY = :copy
          TEST = :test

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
