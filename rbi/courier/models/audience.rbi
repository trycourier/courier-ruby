# typed: strong

module Courier
  module Models
    class Audience < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Audience, Courier::Internal::AnyHash) }

      # A unique identifier representing the audience_id
      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :created_at

      # A description of the audience
      sig { returns(String) }
      attr_accessor :description

      # The operator to use for filtering
      sig { returns(Courier::Filter::Variants) }
      attr_accessor :filter

      # The name of the audience
      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :updated_at

      sig do
        params(
          id: String,
          created_at: String,
          description: String,
          filter:
            T.any(
              Courier::Filter::UnionMember0::OrHash,
              Courier::NestedFilterConfig::OrHash
            ),
          name: String,
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier representing the audience_id
        id:,
        created_at:,
        # A description of the audience
        description:,
        # The operator to use for filtering
        filter:,
        # The name of the audience
        name:,
        updated_at:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: String,
            description: String,
            filter: Courier::Filter::Variants,
            name: String,
            updated_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
