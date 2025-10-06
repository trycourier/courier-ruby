# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Profiles#update
    class ProfileUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute patch
      #   List of patch operations to apply to the profile.
      #
      #   @return [Array<Courier::Models::ProfileUpdateParams::Patch>]
      required :patch, -> { Courier::Internal::Type::ArrayOf[Courier::ProfileUpdateParams::Patch] }

      # @!method initialize(patch:, request_options: {})
      #   @param patch [Array<Courier::Models::ProfileUpdateParams::Patch>] List of patch operations to apply to the profile.
      #
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
        #   @return [String]
        required :value, String

        # @!method initialize(op:, path:, value:)
        #   @param op [String] The operation to perform.
        #
        #   @param path [String] The JSON path specifying the part of the profile to operate on.
        #
        #   @param value [String] The value for the operation.
      end
    end
  end
end
