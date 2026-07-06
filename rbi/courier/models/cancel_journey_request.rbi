# typed: strong

module Courier
  module Models
    # Request body for `POST /journeys/cancel`. Provide EXACTLY ONE of
    # `cancelation_token` (cancels every run associated with the token) or `run_id`
    # (cancels a single tenant-scoped run).
    module CancelJourneyRequest
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::CancelJourneyRequest::ByCancelationToken,
            Courier::CancelJourneyRequest::ByRunID
          )
        end

      class ByCancelationToken < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::CancelJourneyRequest::ByCancelationToken,
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

      class ByRunID < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::CancelJourneyRequest::ByRunID,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :run_id

        sig { params(run_id: String).returns(T.attached_class) }
        def self.new(run_id:)
        end

        sig { override.returns({ run_id: String }) }
        def to_hash
        end
      end

      sig do
        override.returns(T::Array[Courier::CancelJourneyRequest::Variants])
      end
      def self.variants
      end
    end
  end
end
