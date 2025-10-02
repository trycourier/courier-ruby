# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BrandSettingsSocialPresence < Internal::Types::Model
        field :inherit_default, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :facebook, -> { Courier::Send::Types::BaseSocialPresence }, optional: true, nullable: false
        field :instagram, -> { Courier::Send::Types::BaseSocialPresence }, optional: true, nullable: false
        field :linkedin, -> { Courier::Send::Types::BaseSocialPresence }, optional: true, nullable: false
        field :medium, -> { Courier::Send::Types::BaseSocialPresence }, optional: true, nullable: false
        field :twitter, -> { Courier::Send::Types::BaseSocialPresence }, optional: true, nullable: false
      end
    end
  end
end
