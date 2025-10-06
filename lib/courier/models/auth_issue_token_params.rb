# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Auth#issue_token
    class AuthIssueTokenParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

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
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
