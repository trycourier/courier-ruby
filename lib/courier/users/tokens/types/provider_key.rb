# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        module ProviderKey
          extend Courier::Internal::Types::Enum

          FIREBASE_FCM = "firebase-fcm"
          APN = "apn"
          EXPO = "expo"
          ONESIGNAL = "onesignal"
        end
      end
    end
  end
end
