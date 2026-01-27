# typed: strong

module Courier
  module Models
    class BulkRetrieveJobResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::BulkRetrieveJobResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::Models::BulkRetrieveJobResponse::Job) }
      attr_reader :job

      sig do
        params(job: Courier::Models::BulkRetrieveJobResponse::Job::OrHash).void
      end
      attr_writer :job

      sig do
        params(
          job: Courier::Models::BulkRetrieveJobResponse::Job::OrHash
        ).returns(T.attached_class)
      end
      def self.new(job:)
      end

      sig do
        override.returns({ job: Courier::Models::BulkRetrieveJobResponse::Job })
      end
      def to_hash
      end

      class Job < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::BulkRetrieveJobResponse::Job,
              Courier::Internal::AnyHash
            )
          end

        # Bulk message definition. Supports two formats:
        #
        # - V1 format: Requires `event` field (event ID or notification ID)
        # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
        #   content) in addition to `event`
        sig { returns(Courier::InboundBulkMessage) }
        attr_reader :definition

        sig { params(definition: Courier::InboundBulkMessage::OrHash).void }
        attr_writer :definition

        sig { returns(Integer) }
        attr_accessor :enqueued

        sig { returns(Integer) }
        attr_accessor :failures

        sig { returns(Integer) }
        attr_accessor :received

        sig do
          returns(
            Courier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            definition: Courier::InboundBulkMessage::OrHash,
            enqueued: Integer,
            failures: Integer,
            received: Integer,
            status:
              Courier::Models::BulkRetrieveJobResponse::Job::Status::OrSymbol
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
              definition: Courier::InboundBulkMessage,
              enqueued: Integer,
              failures: Integer,
              received: Integer,
              status:
                Courier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Status
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::Models::BulkRetrieveJobResponse::Job::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATED =
            T.let(
              :CREATED,
              Courier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )
          PROCESSING =
            T.let(
              :PROCESSING,
              Courier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :COMPLETED,
              Courier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )
          ERROR =
            T.let(
              :ERROR,
              Courier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Models::BulkRetrieveJobResponse::Job::Status::TaggedSymbol
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
