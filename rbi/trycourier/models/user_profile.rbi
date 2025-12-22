# typed: strong

module Trycourier
  module Models
    class UserProfile < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::UserProfile, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(Trycourier::UserProfile::Address)) }
      attr_reader :address

      sig do
        params(
          address: T.nilable(Trycourier::UserProfile::Address::OrHash)
        ).void
      end
      attr_writer :address

      sig { returns(T.nilable(Trycourier::AirshipProfile)) }
      attr_reader :airship

      sig do
        params(airship: T.nilable(Trycourier::AirshipProfile::OrHash)).void
      end
      attr_writer :airship

      sig { returns(T.nilable(String)) }
      attr_accessor :apn

      sig { returns(T.nilable(String)) }
      attr_accessor :birthdate

      # A free form object. Due to a limitation of the API Explorer, you can only enter
      # string key/values below, but this API accepts more complex object structures.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :custom

      sig do
        returns(
          T.nilable(
            T.any(Trycourier::SendToChannel, Trycourier::SendDirectMessage)
          )
        )
      end
      attr_accessor :discord

      sig { returns(T.nilable(String)) }
      attr_accessor :email

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :email_verified

      sig do
        returns(T.nilable(T.any(Trycourier::Token, Trycourier::MultipleTokens)))
      end
      attr_accessor :expo

      sig { returns(T.nilable(String)) }
      attr_accessor :facebook_psid

      sig { returns(T.nilable(String)) }
      attr_accessor :family_name

      sig { returns(T.nilable(Trycourier::UserProfileFirebaseToken::Variants)) }
      attr_accessor :firebase_token

      sig { returns(T.nilable(String)) }
      attr_accessor :gender

      sig { returns(T.nilable(String)) }
      attr_accessor :given_name

      sig { returns(T.nilable(Trycourier::Intercom)) }
      attr_reader :intercom

      sig { params(intercom: T.nilable(Trycourier::Intercom::OrHash)).void }
      attr_writer :intercom

      sig { returns(T.nilable(String)) }
      attr_accessor :locale

      sig { returns(T.nilable(String)) }
      attr_accessor :middle_name

      sig do
        returns(
          T.nilable(
            T.any(
              Trycourier::SendToMsTeamsUserID,
              Trycourier::SendToMsTeamsEmail,
              Trycourier::SendToMsTeamsChannelID,
              Trycourier::SendToMsTeamsConversationID,
              Trycourier::SendToMsTeamsChannelName
            )
          )
        )
      end
      attr_accessor :ms_teams

      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_accessor :nickname

      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :phone_number_verified

      sig { returns(T.nilable(String)) }
      attr_accessor :picture

      sig { returns(T.nilable(String)) }
      attr_accessor :preferred_name

      sig { returns(T.nilable(String)) }
      attr_accessor :profile

      sig do
        returns(
          T.nilable(
            T.any(
              Trycourier::SendToSlackChannel,
              Trycourier::SendToSlackEmail,
              Trycourier::SendToSlackUserID
            )
          )
        )
      end
      attr_accessor :slack

      sig { returns(T.nilable(String)) }
      attr_accessor :sub

      sig { returns(T.nilable(String)) }
      attr_accessor :target_arn

      sig { returns(T.nilable(String)) }
      attr_accessor :updated_at

      sig { returns(T.nilable(String)) }
      attr_accessor :website

      sig { returns(T.nilable(String)) }
      attr_accessor :zoneinfo

      sig do
        params(
          address: T.nilable(Trycourier::UserProfile::Address::OrHash),
          airship: T.nilable(Trycourier::AirshipProfile::OrHash),
          apn: T.nilable(String),
          birthdate: T.nilable(String),
          custom: T.nilable(T::Hash[Symbol, T.anything]),
          discord:
            T.nilable(
              T.any(
                Trycourier::SendToChannel::OrHash,
                Trycourier::SendDirectMessage::OrHash
              )
            ),
          email: T.nilable(String),
          email_verified: T.nilable(T::Boolean),
          expo:
            T.nilable(
              T.any(
                Trycourier::Token::OrHash,
                Trycourier::MultipleTokens::OrHash
              )
            ),
          facebook_psid: T.nilable(String),
          family_name: T.nilable(String),
          firebase_token:
            T.nilable(Trycourier::UserProfileFirebaseToken::Variants),
          gender: T.nilable(String),
          given_name: T.nilable(String),
          intercom: T.nilable(Trycourier::Intercom::OrHash),
          locale: T.nilable(String),
          middle_name: T.nilable(String),
          ms_teams:
            T.nilable(
              T.any(
                Trycourier::SendToMsTeamsUserID::OrHash,
                Trycourier::SendToMsTeamsEmail::OrHash,
                Trycourier::SendToMsTeamsChannelID::OrHash,
                Trycourier::SendToMsTeamsConversationID::OrHash,
                Trycourier::SendToMsTeamsChannelName::OrHash
              )
            ),
          name: T.nilable(String),
          nickname: T.nilable(String),
          phone_number: T.nilable(String),
          phone_number_verified: T.nilable(T::Boolean),
          picture: T.nilable(String),
          preferred_name: T.nilable(String),
          profile: T.nilable(String),
          slack:
            T.nilable(
              T.any(
                Trycourier::SendToSlackChannel::OrHash,
                Trycourier::SendToSlackEmail::OrHash,
                Trycourier::SendToSlackUserID::OrHash
              )
            ),
          sub: T.nilable(String),
          target_arn: T.nilable(String),
          updated_at: T.nilable(String),
          website: T.nilable(String),
          zoneinfo: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        address: nil,
        airship: nil,
        apn: nil,
        birthdate: nil,
        # A free form object. Due to a limitation of the API Explorer, you can only enter
        # string key/values below, but this API accepts more complex object structures.
        custom: nil,
        discord: nil,
        email: nil,
        email_verified: nil,
        expo: nil,
        facebook_psid: nil,
        family_name: nil,
        firebase_token: nil,
        gender: nil,
        given_name: nil,
        intercom: nil,
        locale: nil,
        middle_name: nil,
        ms_teams: nil,
        name: nil,
        nickname: nil,
        phone_number: nil,
        phone_number_verified: nil,
        picture: nil,
        preferred_name: nil,
        profile: nil,
        slack: nil,
        sub: nil,
        target_arn: nil,
        updated_at: nil,
        website: nil,
        zoneinfo: nil
      )
      end

      sig do
        override.returns(
          {
            address: T.nilable(Trycourier::UserProfile::Address),
            airship: T.nilable(Trycourier::AirshipProfile),
            apn: T.nilable(String),
            birthdate: T.nilable(String),
            custom: T.nilable(T::Hash[Symbol, T.anything]),
            discord:
              T.nilable(
                T.any(Trycourier::SendToChannel, Trycourier::SendDirectMessage)
              ),
            email: T.nilable(String),
            email_verified: T.nilable(T::Boolean),
            expo:
              T.nilable(T.any(Trycourier::Token, Trycourier::MultipleTokens)),
            facebook_psid: T.nilable(String),
            family_name: T.nilable(String),
            firebase_token:
              T.nilable(Trycourier::UserProfileFirebaseToken::Variants),
            gender: T.nilable(String),
            given_name: T.nilable(String),
            intercom: T.nilable(Trycourier::Intercom),
            locale: T.nilable(String),
            middle_name: T.nilable(String),
            ms_teams:
              T.nilable(
                T.any(
                  Trycourier::SendToMsTeamsUserID,
                  Trycourier::SendToMsTeamsEmail,
                  Trycourier::SendToMsTeamsChannelID,
                  Trycourier::SendToMsTeamsConversationID,
                  Trycourier::SendToMsTeamsChannelName
                )
              ),
            name: T.nilable(String),
            nickname: T.nilable(String),
            phone_number: T.nilable(String),
            phone_number_verified: T.nilable(T::Boolean),
            picture: T.nilable(String),
            preferred_name: T.nilable(String),
            profile: T.nilable(String),
            slack:
              T.nilable(
                T.any(
                  Trycourier::SendToSlackChannel,
                  Trycourier::SendToSlackEmail,
                  Trycourier::SendToSlackUserID
                )
              ),
            sub: T.nilable(String),
            target_arn: T.nilable(String),
            updated_at: T.nilable(String),
            website: T.nilable(String),
            zoneinfo: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Address < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::UserProfile::Address,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :country

        sig { returns(String) }
        attr_accessor :formatted

        sig { returns(String) }
        attr_accessor :locality

        sig { returns(String) }
        attr_accessor :postal_code

        sig { returns(String) }
        attr_accessor :region

        sig { returns(String) }
        attr_accessor :street_address

        sig do
          params(
            country: String,
            formatted: String,
            locality: String,
            postal_code: String,
            region: String,
            street_address: String
          ).returns(T.attached_class)
        end
        def self.new(
          country:,
          formatted:,
          locality:,
          postal_code:,
          region:,
          street_address:
        )
        end

        sig do
          override.returns(
            {
              country: String,
              formatted: String,
              locality: String,
              postal_code: String,
              region: String,
              street_address: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
