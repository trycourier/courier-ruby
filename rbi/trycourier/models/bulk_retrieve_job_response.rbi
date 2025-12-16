# typed: strong

module Trycourier
  module Models
    class BulkRetrieveJobResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::BulkRetrieveJobResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(Trycourier::Models::BulkRetrieveJobResponse::Job) }
      attr_reader :job

      sig do
        params(
          job: Trycourier::Models::BulkRetrieveJobResponse::Job::OrHash
        ).void
      end
      attr_writer :job

      sig do
        params(
          job: Trycourier::Models::BulkRetrieveJobResponse::Job::OrHash
        ).returns(T.attached_class)
      end
      def self.new(job:)
      end

      sig do
        override.returns(
          { job: Trycourier::Models::BulkRetrieveJobResponse::Job }
        )
      end
      def to_hash
      end

      class Job < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::BulkRetrieveJobResponse::Job,
              Trycourier::Internal::AnyHash
            )
          end

        # Bulk message definition. Supports two formats:
        #
        # - V1 format: Requires `event` field (event ID or notification ID)
        # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
        #   content) in addition to `event`
        sig { returns(Trycourier::InboundBulkMessage) }
        attr_reader :definition

        sig { params(definition: Trycourier::InboundBulkMessage::OrHash).void }
        attr_writer :definition

        sig { returns(Integer) }
        attr_accessor :enqueued

        sig { returns(Integer) }
        attr_accessor :failures

        sig { returns(Integer) }
        attr_accessor :received

        sig do
          returns(
            Trycourier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            definition: Trycourier::InboundBulkMessage::OrHash,
            enqueued: Integer,
            failures: Integer,
            received: Integer,
            status:
              Trycourier::Models::BulkRetrieveJobResponse::Job::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Bulk message definition. Supports two formats:
          #
          # - V1 format: Requires `event` field (event ID or notification ID)
          # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
          #   content) in addition to `event`
          definition:,
          enqueued:,
          failures:,
          received:,
          status:
        )
        end

        sig do
          override.returns(
            {
              definition: Trycourier::InboundBulkMessage,
              enqueued: Integer,
              failures: Integer,
              received: Integer,
              status:
                Trycourier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Status
          extend Trycourier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Trycourier::Models::BulkRetrieveJobResponse::Job::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATED =
            T.let(
              :CREATED,
              Trycourier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )
          PROCESSING =
            T.let(
              :PROCESSING,
              Trycourier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :COMPLETED,
              Trycourier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )
          ERROR =
            T.let(
              :ERROR,
              Trycourier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Trycourier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
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
