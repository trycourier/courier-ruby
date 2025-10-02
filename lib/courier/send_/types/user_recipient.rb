# frozen_string_literal: true

module Courier
  module Send
    module Types
      class UserRecipient < Internal::Types::Model
        field :account_id, -> { String }, optional: true, nullable: false
        field :context, -> { Courier::Send::Types::MessageContext }, optional: true, nullable: false
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :locale, -> { String }, optional: true, nullable: false
        field :user_id, -> { String }, optional: true, nullable: false
        field :phone_number, -> { String }, optional: true, nullable: false
        field :preferences, -> { Courier::Send::Types::IProfilePreferences }, optional: true, nullable: false
        field :tenant_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
