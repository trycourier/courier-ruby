# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @type [Trycourier::Internal::Type::Converter]
      TokenListResponse = Trycourier::Internal::Type::ArrayOf[-> { Trycourier::UserToken }]
    end
  end
end
