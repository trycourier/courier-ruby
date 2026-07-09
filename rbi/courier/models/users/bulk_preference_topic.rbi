# typed: strong

module Courier
  module Models
    module Users
      class BulkPreferenceTopic < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Users::BulkPreferenceTopic,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Courier::ChannelClassification::TaggedSymbol]) }
        attr_accessor :custom_routing

        sig { returns(T::Boolean) }
        attr_accessor :has_custom_routing

        # The applied subscription status. Echoes the requested value, so it is always
        # OPTED_IN or OPTED_OUT.
        sig do
          returns(Courier::Users::BulkPreferenceTopic::Status::TaggedSymbol)
        end
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :topic_id

        # A single topic override echoed in a bulk preference response.
        sig do
          params(
            custom_routing: T::Array[Courier::ChannelClassification::OrSymbol],
            has_custom_routing: T::Boolean,
            status: Courier::Users::BulkPreferenceTopic::Status::OrSymbol,
            topic_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          custom_routing:,
          has_custom_routing:,
          # The applied subscription status. Echoes the requested value, so it is always
          # OPTED_IN or OPTED_OUT.
          status:,
          topic_id:
        )
        end

        sig do
          override.returns(
            {
              custom_routing:
                T::Array[Courier::ChannelClassification::TaggedSymbol],
              has_custom_routing: T::Boolean,
              status: Courier::Users::BulkPreferenceTopic::Status::TaggedSymbol,
              topic_id: String
            }
          )
        end
        def to_hash
        end

        # The applied subscription status. Echoes the requested value, so it is always
        # OPTED_IN or OPTED_OUT.
        module Status
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::Users::BulkPreferenceTopic::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPTED_IN =
            T.let(
              :OPTED_IN,
              Courier::Users::BulkPreferenceTopic::Status::TaggedSymbol
            )
          OPTED_OUT =
            T.let(
              :OPTED_OUT,
              Courier::Users::BulkPreferenceTopic::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Users::BulkPreferenceTopic::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
