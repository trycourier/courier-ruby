# typed: strong

module Courier
  module Models
    class Utm < Courier::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Courier::Utm, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_accessor :campaign

      sig { returns(T.nilable(String)) }
      attr_accessor :content

      sig { returns(T.nilable(String)) }
      attr_accessor :medium

      sig { returns(T.nilable(String)) }
      attr_accessor :source

      sig { returns(T.nilable(String)) }
      attr_accessor :term

      sig do
        params(
          campaign: T.nilable(String),
          content: T.nilable(String),
          medium: T.nilable(String),
          source: T.nilable(String),
          term: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        campaign: nil,
        content: nil,
        medium: nil,
        source: nil,
        term: nil
      )
      end

      sig do
        override.returns(
          {
            campaign: T.nilable(String),
            content: T.nilable(String),
            medium: T.nilable(String),
            source: T.nilable(String),
            term: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
