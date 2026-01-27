# typed: strong

module Courier
  module Models
    class AirshipProfileAudience < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AirshipProfileAudience, Courier::Internal::AnyHash)
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
