# frozen_string_literal: true

module Courier
  module Users
    class Tokens
      # @type [PROVIDER_KEY]
      PROVIDER_KEY = { firebase_fcm: "firebase-fcm", apn: "apn", expo: "expo", onesignal: "onesignal" }.freeze
    end
  end
end
