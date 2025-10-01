# typed: strong

module Courier
  module Models
    class SlackBaseProperties < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SlackBaseProperties, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :access_token

      sig { params(access_token: String).returns(T.attached_class) }
      def self.new(access_token:)
      end

      sig { override.returns({ access_token: String }) }
      def to_hash
      end
    end
  end
end
