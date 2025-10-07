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

      # A single filter to use for filtering
      sig { returns(Courier::Filter) }
      attr_reader :filter

      sig { params(filter: Courier::Filter::OrHash).void }
      attr_writer :filter

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
          filter: Courier::Filter::OrHash,
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
        # A single filter to use for filtering
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
            filter: Courier::Filter,
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
