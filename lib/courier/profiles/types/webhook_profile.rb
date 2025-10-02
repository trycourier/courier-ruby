# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class WebhookProfile < Internal::Types::Model
        field :url, -> { String }, optional: false, nullable: false
        field :method_, -> { Courier::Profiles::Types::WebhookMethod }, optional: true, nullable: false
        field :headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
        field :authentication, -> { Courier::Profiles::Types::WebhookAuthentication }, optional: true, nullable: false
        field :profile, -> { Courier::Profiles::Types::WebhookProfileType }, optional: true, nullable: false
      end
    end
  end
end
