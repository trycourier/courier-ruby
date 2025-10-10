# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Auth#issue_token
    class AuthIssueTokenParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute expires_in
      #
      #   @return [String]
      required :expires_in, String

      # @!attribute scope
      #
      #   @return [String]
      required :scope, String

      # @!method initialize(expires_in:, scope:, request_options: {})
      #   @param expires_in [String]
      #   @param scope [String]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
