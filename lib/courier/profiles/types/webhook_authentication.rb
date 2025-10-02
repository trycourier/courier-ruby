# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class WebhookAuthentication < Internal::Types::Model
        field :mode, -> { Courier::Profiles::Types::WebhookAuthMode }, optional: false, nullable: false
        field :username, -> { String }, optional: true, nullable: false
        field :password, -> { String }, optional: true, nullable: false
        field :token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
