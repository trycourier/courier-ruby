# typed: strong

module Courier
  module Models
    module Users
      TokenListResponse =
        T.let(
          Courier::Internal::Type::ArrayOf[Courier::Users::UserToken],
          Courier::Internal::Type::Converter
        )
    end
  end
end
