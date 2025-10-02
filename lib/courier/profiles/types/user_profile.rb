# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class UserProfile < Internal::Types::Model
        field :address, -> { Courier::Profiles::Types::Address }, optional: false, nullable: false
        field :birthdate, -> { String }, optional: false, nullable: false
        field :email, -> { String }, optional: false, nullable: false
        field :email_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :family_name, -> { String }, optional: false, nullable: false
        field :gender, -> { String }, optional: false, nullable: false
        field :given_name, -> { String }, optional: false, nullable: false
        field :locale, -> { String }, optional: false, nullable: false
        field :middle_name, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :nickname, -> { String }, optional: false, nullable: false
        field :phone_number, -> { String }, optional: false, nullable: false
        field :phone_number_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :picture, -> { String }, optional: false, nullable: false
        field :preferred_name, -> { String }, optional: false, nullable: false
        field :profile, -> { String }, optional: false, nullable: false
        field :sub, -> { String }, optional: false, nullable: false
        field :updated_at, -> { String }, optional: false, nullable: false
        field :website, -> { String }, optional: false, nullable: false
        field :zoneinfo, -> { String }, optional: false, nullable: false
        field :custom, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        field :airship, -> { Courier::Profiles::Types::AirshipProfile }, optional: false, nullable: false
        field :apn, -> { String }, optional: false, nullable: false
        field :target_arn, -> { String }, optional: false, nullable: false
        field :discord, -> { Courier::Profiles::Types::Discord }, optional: false, nullable: false
        field :expo, -> { Courier::Profiles::Types::Expo }, optional: false, nullable: false
        field :facebook_psid, -> { String }, optional: false, nullable: false
        field :firebase_token, lambda {
          Courier::Profiles::Types::UserProfileFirebaseToken
        }, optional: false, nullable: false
        field :intercom, -> { Courier::Profiles::Types::Intercom }, optional: false, nullable: false
        field :slack, -> { Courier::Profiles::Types::Slack }, optional: false, nullable: false
        field :ms_teams, -> { Courier::Profiles::Types::MsTeams }, optional: false, nullable: false
      end
    end
  end
end
