# typed: strong

module Courier
  module Models
    # `202 Accepted` body for `POST /journeys/cancel`, returning the submitted
    # identifier. When called with `cancelation_token`, returns
    # `{ cancelation_token }`; when called with `run_id`, returns
    # `{ run_id, status }`.
    module CancelJourneyResponse
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::CancelJourneyResponse::TokenBranch,
            Courier::CancelJourneyResponse::RunIDBranch
          )
        end

      class TokenBranch < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::CancelJourneyResponse::TokenBranch,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :cancelation_token

        sig { params(cancelation_token: String).returns(T.attached_class) }
        def self.new(cancelation_token:)
        end

        sig { override.returns({ cancelation_token: String }) }
        def to_hash
        end
      end

      class RunIDBranch < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::CancelJourneyResponse::RunIDBranch,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :run_id

        # The run's resulting status. `CANCELED` when the run was active and has been
        # canceled; `PROCESSED` or `ERROR` when the run had already finished and was left
        # unchanged; `CANCELED` for an already-canceled run.
        sig { returns(String) }
        attr_accessor :status

        sig { params(run_id: String, status: String).returns(T.attached_class) }
        def self.new(
          run_id:,
          # The run's resulting status. `CANCELED` when the run was active and has been
          # canceled; `PROCESSED` or `ERROR` when the run had already finished and was left
          # unchanged; `CANCELED` for an already-canceled run.
          status:
        )
        end

        sig { override.returns({ run_id: String, status: String }) }
        def to_hash
        end
      end

      sig do
        override.returns(T::Array[Courier::CancelJourneyResponse::Variants])
      end
      def self.variants
      end
    end
  end
end
