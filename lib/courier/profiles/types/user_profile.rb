# frozen_string_literal: true

require_relative "address"
require_relative "airship_profile"
require_relative "discord"
require_relative "expo"
require_relative "user_profile_firebase_token"
require_relative "intercom"
require_relative "slack"
require_relative "ms_teams"
require "json"

module Courier
  class Profiles
    class UserProfile
      attr_reader :address, :birthdate, :email, :email_verified, :family_name, :gender, :given_name, :locale,
                  :middle_name, :name, :nickname, :phone_number, :phone_number_verified, :picture, :preferred_name, :profile, :sub, :updated_at, :website, :zoneinfo, :custom, :airship, :apn, :target_arn, :discord, :expo, :facebook_psid, :firebase_token, :intercom, :slack, :ms_teams, :additional_properties

      # @param address [Profiles::Address]
      # @param birthdate [String]
      # @param email [String]
      # @param email_verified [Boolean]
      # @param family_name [String]
      # @param gender [String]
      # @param given_name [String]
      # @param locale [String]
      # @param middle_name [String]
      # @param name [String]
      # @param nickname [String]
      # @param phone_number [String]
      # @param phone_number_verified [Boolean]
      # @param picture [String]
      # @param preferred_name [String]
      # @param profile [String]
      # @param sub [String]
      # @param updated_at [String]
      # @param website [String]
      # @param zoneinfo [String]
      # @param custom [Object] A free form object. Due to a limitation of the API Explorer, you can only enter string key/values below, but this API accepts more complex object structures.
      # @param airship [Profiles::AirshipProfile]
      # @param apn [String]
      # @param target_arn [String]
      # @param discord [Profiles::Discord]
      # @param expo [Profiles::Expo]
      # @param facebook_psid [String]
      # @param firebase_token [Profiles::UserProfileFirebaseToken]
      # @param intercom [Profiles::Intercom]
      # @param slack [Profiles::Slack]
      # @param ms_teams [Profiles::MsTeams]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::UserProfile]
      def initialize(address:, birthdate:, email:, email_verified:, family_name:, gender:, given_name:, locale:,
                     middle_name:, name:, nickname:, phone_number:, phone_number_verified:, picture:, preferred_name:, profile:, sub:, updated_at:, website:, zoneinfo:, custom:, airship:, apn:, target_arn:, discord:, expo:, facebook_psid:, firebase_token:, intercom:, slack:, ms_teams:, additional_properties: nil)
        # @type [Profiles::Address]
        @address = address
        # @type [String]
        @birthdate = birthdate
        # @type [String]
        @email = email
        # @type [Boolean]
        @email_verified = email_verified
        # @type [String]
        @family_name = family_name
        # @type [String]
        @gender = gender
        # @type [String]
        @given_name = given_name
        # @type [String]
        @locale = locale
        # @type [String]
        @middle_name = middle_name
        # @type [String]
        @name = name
        # @type [String]
        @nickname = nickname
        # @type [String]
        @phone_number = phone_number
        # @type [Boolean]
        @phone_number_verified = phone_number_verified
        # @type [String]
        @picture = picture
        # @type [String]
        @preferred_name = preferred_name
        # @type [String]
        @profile = profile
        # @type [String]
        @sub = sub
        # @type [String]
        @updated_at = updated_at
        # @type [String]
        @website = website
        # @type [String]
        @zoneinfo = zoneinfo
        # @type [Object] A free form object. Due to a limitation of the API Explorer, you can only enter string key/values below, but this API accepts more complex object structures.
        @custom = custom
        # @type [Profiles::AirshipProfile]
        @airship = airship
        # @type [String]
        @apn = apn
        # @type [String]
        @target_arn = target_arn
        # @type [Profiles::Discord]
        @discord = discord
        # @type [Profiles::Expo]
        @expo = expo
        # @type [String]
        @facebook_psid = facebook_psid
        # @type [Profiles::UserProfileFirebaseToken]
        @firebase_token = firebase_token
        # @type [Profiles::Intercom]
        @intercom = intercom
        # @type [Profiles::Slack]
        @slack = slack
        # @type [Profiles::MsTeams]
        @ms_teams = ms_teams
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of UserProfile
      #
      # @param json_object [JSON]
      # @return [Profiles::UserProfile]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["address"].nil?
          address = nil
        else
          address = parsed_json["address"].to_json
          address = Profiles::Address.from_json(json_object: address)
        end
        birthdate = struct.birthdate
        email = struct.email
        email_verified = struct.email_verified
        family_name = struct.family_name
        gender = struct.gender
        given_name = struct.given_name
        locale = struct.locale
        middle_name = struct.middle_name
        name = struct.name
        nickname = struct.nickname
        phone_number = struct.phone_number
        phone_number_verified = struct.phone_number_verified
        picture = struct.picture
        preferred_name = struct.preferred_name
        profile = struct.profile
        sub = struct.sub
        updated_at = struct.updated_at
        website = struct.website
        zoneinfo = struct.zoneinfo
        custom = struct.custom
        if parsed_json["airship"].nil?
          airship = nil
        else
          airship = parsed_json["airship"].to_json
          airship = Profiles::AirshipProfile.from_json(json_object: airship)
        end
        apn = struct.apn
        target_arn = struct.target_arn
        if parsed_json["discord"].nil?
          discord = nil
        else
          discord = parsed_json["discord"].to_json
          discord = Profiles::Discord.from_json(json_object: discord)
        end
        if parsed_json["expo"].nil?
          expo = nil
        else
          expo = parsed_json["expo"].to_json
          expo = Profiles::Expo.from_json(json_object: expo)
        end
        facebook_psid = struct.facebookPSID
        if parsed_json["firebaseToken"].nil?
          firebase_token = nil
        else
          firebase_token = parsed_json["firebaseToken"].to_json
          firebase_token = Profiles::UserProfileFirebaseToken.from_json(json_object: firebase_token)
        end
        if parsed_json["intercom"].nil?
          intercom = nil
        else
          intercom = parsed_json["intercom"].to_json
          intercom = Profiles::Intercom.from_json(json_object: intercom)
        end
        if parsed_json["slack"].nil?
          slack = nil
        else
          slack = parsed_json["slack"].to_json
          slack = Profiles::Slack.from_json(json_object: slack)
        end
        if parsed_json["ms_teams"].nil?
          ms_teams = nil
        else
          ms_teams = parsed_json["ms_teams"].to_json
          ms_teams = Profiles::MsTeams.from_json(json_object: ms_teams)
        end
        new(address: address, birthdate: birthdate, email: email, email_verified: email_verified,
            family_name: family_name, gender: gender, given_name: given_name, locale: locale, middle_name: middle_name, name: name, nickname: nickname, phone_number: phone_number, phone_number_verified: phone_number_verified, picture: picture, preferred_name: preferred_name, profile: profile, sub: sub, updated_at: updated_at, website: website, zoneinfo: zoneinfo, custom: custom, airship: airship, apn: apn, target_arn: target_arn, discord: discord, expo: expo, facebook_psid: facebook_psid, firebase_token: firebase_token, intercom: intercom, slack: slack, ms_teams: ms_teams, additional_properties: struct)
      end

      # Serialize an instance of UserProfile to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "address": @address,
          "birthdate": @birthdate,
          "email": @email,
          "email_verified": @email_verified,
          "family_name": @family_name,
          "gender": @gender,
          "given_name": @given_name,
          "locale": @locale,
          "middle_name": @middle_name,
          "name": @name,
          "nickname": @nickname,
          "phone_number": @phone_number,
          "phone_number_verified": @phone_number_verified,
          "picture": @picture,
          "preferred_name": @preferred_name,
          "profile": @profile,
          "sub": @sub,
          "updated_at": @updated_at,
          "website": @website,
          "zoneinfo": @zoneinfo,
          "custom": @custom,
          "airship": @airship,
          "apn": @apn,
          "target_arn": @target_arn,
          "discord": @discord,
          "expo": @expo,
          "facebookPSID": @facebook_psid,
          "firebaseToken": @firebase_token,
          "intercom": @intercom,
          "slack": @slack,
          "ms_teams": @ms_teams
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Profiles::Address.validate_raw(obj: obj.address)
        obj.birthdate.is_a?(String) != false || raise("Passed value for field obj.birthdate is not the expected type, validation failed.")
        obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.email_verified.is_a?(Boolean) != false || raise("Passed value for field obj.email_verified is not the expected type, validation failed.")
        obj.family_name.is_a?(String) != false || raise("Passed value for field obj.family_name is not the expected type, validation failed.")
        obj.gender.is_a?(String) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        obj.given_name.is_a?(String) != false || raise("Passed value for field obj.given_name is not the expected type, validation failed.")
        obj.locale.is_a?(String) != false || raise("Passed value for field obj.locale is not the expected type, validation failed.")
        obj.middle_name.is_a?(String) != false || raise("Passed value for field obj.middle_name is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.nickname.is_a?(String) != false || raise("Passed value for field obj.nickname is not the expected type, validation failed.")
        obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.phone_number_verified.is_a?(Boolean) != false || raise("Passed value for field obj.phone_number_verified is not the expected type, validation failed.")
        obj.picture.is_a?(String) != false || raise("Passed value for field obj.picture is not the expected type, validation failed.")
        obj.preferred_name.is_a?(String) != false || raise("Passed value for field obj.preferred_name is not the expected type, validation failed.")
        obj.profile.is_a?(String) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
        obj.sub.is_a?(String) != false || raise("Passed value for field obj.sub is not the expected type, validation failed.")
        obj.updated_at.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
        obj.website.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
        obj.zoneinfo.is_a?(String) != false || raise("Passed value for field obj.zoneinfo is not the expected type, validation failed.")
        obj.custom.is_a?(Object) != false || raise("Passed value for field obj.custom is not the expected type, validation failed.")
        Profiles::AirshipProfile.validate_raw(obj: obj.airship)
        obj.apn.is_a?(String) != false || raise("Passed value for field obj.apn is not the expected type, validation failed.")
        obj.target_arn.is_a?(String) != false || raise("Passed value for field obj.target_arn is not the expected type, validation failed.")
        Profiles::Discord.validate_raw(obj: obj.discord)
        Profiles::Expo.validate_raw(obj: obj.expo)
        obj.facebook_psid.is_a?(String) != false || raise("Passed value for field obj.facebook_psid is not the expected type, validation failed.")
        Profiles::UserProfileFirebaseToken.validate_raw(obj: obj.firebase_token)
        Profiles::Intercom.validate_raw(obj: obj.intercom)
        Profiles::Slack.validate_raw(obj: obj.slack)
        Profiles::MsTeams.validate_raw(obj: obj.ms_teams)
      end
    end
  end
end
