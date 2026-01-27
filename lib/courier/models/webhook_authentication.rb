# frozen_string_literal: true

module Courier
  module Models
    class WebhookAuthentication < Courier::Internal::Type::BaseModel
      # @!attribute mode
      #   The authentication mode to use. Defaults to 'none' if not specified.
      #
      #   @return [Symbol, Courier::Models::WebhookAuthMode]
      required :mode, enum: -> { Courier::WebhookAuthMode }

      # @!attribute token
      #   Token for bearer authentication.
      #
      #   @return [String, nil]
      optional :token, String, nil?: true

      # @!attribute password
      #   Password for basic authentication.
      #
      #   @return [String, nil]
      optional :password, String, nil?: true

      # @!attribute username
      #   Username for basic authentication.
      #
      #   @return [String, nil]
      optional :username, String, nil?: true

      # @!method initialize(mode:, token: nil, password: nil, username: nil)
      #   @param mode [Symbol, Courier::Models::WebhookAuthMode] The authentication mode to use. Defaults to 'none' if not specified.
      #
      #   @param token [String, nil] Token for bearer authentication.
      #
      #   @param password [String, nil] Password for basic authentication.
      #
      #   @param username [String, nil] Username for basic authentication.
    end
  end
end
