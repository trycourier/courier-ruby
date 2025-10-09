# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Profiles#update
    class ProfileUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute patch
      #   List of patch operations to apply to the profile.
      #
      #   @return [Array<Trycourier::Models::ProfileUpdateParams::Patch>]
      required :patch, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::ProfileUpdateParams::Patch] }

      # @!method initialize(patch:, request_options: {})
      #   @param patch [Array<Trycourier::Models::ProfileUpdateParams::Patch>] List of patch operations to apply to the profile.
      #
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
