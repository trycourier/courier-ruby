# typed: strong

module Trycourier
  module Models
    class AirshipProfileAudience < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::AirshipProfileAudience,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :named_user

      sig { params(named_user: String).returns(T.attached_class) }
      def self.new(named_user:)
      end

      sig { override.returns({ named_user: String }) }
      def to_hash
      end
    end
  end
end
