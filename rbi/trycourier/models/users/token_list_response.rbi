# typed: strong

module Trycourier
  module Models
    module Users
      TokenListResponse =
        T.let(
          Trycourier::Internal::Type::ArrayOf[Trycourier::Users::UserToken],
          Trycourier::Internal::Type::Converter
        )
    end
  end
end
