# frozen_string_literal: true

module Trycourier
  module Models
    class UserProfile < Trycourier::Internal::Type::BaseModel
      # @!attribute address
      #
      #   @return [Trycourier::Models::UserProfile::Address, nil]
      optional :address, -> { Trycourier::UserProfile::Address }, nil?: true

      # @!attribute airship
      #
      #   @return [Trycourier::Models::AirshipProfile, nil]
      optional :airship, -> { Trycourier::AirshipProfile }, nil?: true

      # @!attribute apn
      #
      #   @return [String, nil]
      optional :apn, String, nil?: true

      # @!attribute birthdate
      #
      #   @return [String, nil]
      optional :birthdate, String, nil?: true

      # @!attribute custom
      #   A free form object. Due to a limitation of the API Explorer, you can only enter
      #   string key/values below, but this API accepts more complex object structures.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :custom, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

      # @!attribute discord
      #
      #   @return [Trycourier::Models::SendToChannel, Trycourier::Models::SendDirectMessage, nil]
      optional :discord, union: -> { Trycourier::Discord }, nil?: true

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute email_verified
      #
      #   @return [Boolean, nil]
      optional :email_verified, Trycourier::Internal::Type::Boolean, nil?: true

      # @!attribute expo
      #
      #   @return [Trycourier::Models::Token, Trycourier::Models::MultipleTokens, nil]
      optional :expo, union: -> { Trycourier::Expo }, nil?: true

      # @!attribute facebook_psid
      #
      #   @return [String, nil]
      optional :facebook_psid, String, api_name: :facebookPSID, nil?: true

      # @!attribute family_name
      #
      #   @return [String, nil]
      optional :family_name, String, nil?: true

      # @!attribute firebase_token
      #
      #   @return [String, Array<String>, nil]
      optional :firebase_token,
               union: -> { Trycourier::UserProfileFirebaseToken },
               api_name: :firebaseToken,
               nil?: true

      # @!attribute gender
      #
      #   @return [String, nil]
      optional :gender, String, nil?: true

      # @!attribute given_name
      #
      #   @return [String, nil]
      optional :given_name, String, nil?: true

      # @!attribute intercom
      #
      #   @return [Trycourier::Models::Intercom, nil]
      optional :intercom, -> { Trycourier::Intercom }, nil?: true

      # @!attribute locale
      #
      #   @return [String, nil]
      optional :locale, String, nil?: true

      # @!attribute middle_name
      #
      #   @return [String, nil]
      optional :middle_name, String, nil?: true

      # @!attribute ms_teams
      #
      #   @return [Trycourier::Models::SendToMsTeamsUserID, Trycourier::Models::SendToMsTeamsEmail, Trycourier::Models::SendToMsTeamsChannelID, Trycourier::Models::SendToMsTeamsConversationID, Trycourier::Models::SendToMsTeamsChannelName, nil]
      optional :ms_teams, union: -> { Trycourier::MsTeams }, nil?: true

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute nickname
      #
      #   @return [String, nil]
      optional :nickname, String, nil?: true

      # @!attribute phone_number
      #
      #   @return [String, nil]
      optional :phone_number, String, nil?: true

      # @!attribute phone_number_verified
      #
      #   @return [Boolean, nil]
      optional :phone_number_verified, Trycourier::Internal::Type::Boolean, nil?: true

      # @!attribute picture
      #
      #   @return [String, nil]
      optional :picture, String, nil?: true

      # @!attribute preferred_name
      #
      #   @return [String, nil]
      optional :preferred_name, String, nil?: true

      # @!attribute profile
      #
      #   @return [String, nil]
      optional :profile, String, nil?: true

      # @!attribute slack
      #
      #   @return [Trycourier::Models::SendToSlackChannel, Trycourier::Models::SendToSlackEmail, Trycourier::Models::SendToSlackUserID, nil]
      optional :slack, union: -> { Trycourier::Slack }, nil?: true

      # @!attribute sub
      #
      #   @return [String, nil]
      optional :sub, String, nil?: true

      # @!attribute target_arn
      #
      #   @return [String, nil]
      optional :target_arn, String, nil?: true

      # @!attribute updated_at
      #
      #   @return [String, nil]
      optional :updated_at, String, nil?: true

      # @!attribute website
      #
      #   @return [String, nil]
      optional :website, String, nil?: true

      # @!attribute zoneinfo
      #
      #   @return [String, nil]
      optional :zoneinfo, String, nil?: true

      # @!method initialize(address: nil, airship: nil, apn: nil, birthdate: nil, custom: nil, discord: nil, email: nil, email_verified: nil, expo: nil, facebook_psid: nil, family_name: nil, firebase_token: nil, gender: nil, given_name: nil, intercom: nil, locale: nil, middle_name: nil, ms_teams: nil, name: nil, nickname: nil, phone_number: nil, phone_number_verified: nil, picture: nil, preferred_name: nil, profile: nil, slack: nil, sub: nil, target_arn: nil, updated_at: nil, website: nil, zoneinfo: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::UserProfile} for more details.
      #
      #   @param address [Trycourier::Models::UserProfile::Address, nil]
      #
      #   @param airship [Trycourier::Models::AirshipProfile, nil]
      #
      #   @param apn [String, nil]
      #
      #   @param birthdate [String, nil]
      #
      #   @param custom [Hash{Symbol=>Object}, nil] A free form object. Due to a limitation of the API Explorer, you can only enter
      #
      #   @param discord [Trycourier::Models::SendToChannel, Trycourier::Models::SendDirectMessage, nil]
      #
      #   @param email [String, nil]
      #
      #   @param email_verified [Boolean, nil]
      #
      #   @param expo [Trycourier::Models::Token, Trycourier::Models::MultipleTokens, nil]
      #
      #   @param facebook_psid [String, nil]
      #
      #   @param family_name [String, nil]
      #
      #   @param firebase_token [String, Array<String>, nil]
      #
      #   @param gender [String, nil]
      #
      #   @param given_name [String, nil]
      #
      #   @param intercom [Trycourier::Models::Intercom, nil]
      #
      #   @param locale [String, nil]
      #
      #   @param middle_name [String, nil]
      #
      #   @param ms_teams [Trycourier::Models::SendToMsTeamsUserID, Trycourier::Models::SendToMsTeamsEmail, Trycourier::Models::SendToMsTeamsChannelID, Trycourier::Models::SendToMsTeamsConversationID, Trycourier::Models::SendToMsTeamsChannelName, nil]
      #
      #   @param name [String, nil]
      #
      #   @param nickname [String, nil]
      #
      #   @param phone_number [String, nil]
      #
      #   @param phone_number_verified [Boolean, nil]
      #
      #   @param picture [String, nil]
      #
      #   @param preferred_name [String, nil]
      #
      #   @param profile [String, nil]
      #
      #   @param slack [Trycourier::Models::SendToSlackChannel, Trycourier::Models::SendToSlackEmail, Trycourier::Models::SendToSlackUserID, nil]
      #
      #   @param sub [String, nil]
      #
      #   @param target_arn [String, nil]
      #
      #   @param updated_at [String, nil]
      #
      #   @param website [String, nil]
      #
      #   @param zoneinfo [String, nil]

      # @see Trycourier::Models::UserProfile#address
      class Address < Trycourier::Internal::Type::BaseModel
        # @!attribute country
        #
        #   @return [String]
        required :country, String

        # @!attribute formatted
        #
        #   @return [String]
        required :formatted, String

        # @!attribute locality
        #
        #   @return [String]
        required :locality, String

        # @!attribute postal_code
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute region
        #
        #   @return [String]
        required :region, String

        # @!attribute street_address
        #
        #   @return [String]
        required :street_address, String

        # @!method initialize(country:, formatted:, locality:, postal_code:, region:, street_address:)
        #   @param country [String]
        #   @param formatted [String]
        #   @param locality [String]
        #   @param postal_code [String]
        #   @param region [String]
        #   @param street_address [String]
      end
    end
  end
end
