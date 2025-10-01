# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @type [Courier::Internal::Type::Converter]
      TokenListResponse = Courier::Internal::Type::ArrayOf[-> { Courier::Users::UserToken }]
    end
  end
end
