# typed: strong

module Courier
  module Models
    module Users
      class PreferenceBulkUpdateResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Users::PreferenceBulkUpdateResponse,
              Courier::Internal::AnyHash
            )
          end

        # The topics that could not be applied, each with a reason.
        sig do
          returns(
            T::Array[
              Courier::Models::Users::PreferenceBulkUpdateResponse::Error
            ]
          )
        end
        attr_accessor :errors

        # The topics that were successfully created or updated.
        sig { returns(T::Array[Courier::Users::BulkPreferenceTopic]) }
        attr_accessor :items

        sig do
          params(
            errors:
              T::Array[
                Courier::Models::Users::PreferenceBulkUpdateResponse::Error::OrHash
              ],
            items: T::Array[Courier::Users::BulkPreferenceTopic::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The topics that could not be applied, each with a reason.
          errors:,
          # The topics that were successfully created or updated.
          items:
        )
        end

        sig do
          override.returns(
            {
              errors:
                T::Array[
                  Courier::Models::Users::PreferenceBulkUpdateResponse::Error
                ],
              items: T::Array[Courier::Users::BulkPreferenceTopic]
            }
          )
        end
        def to_hash
        end

        class Error < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Models::Users::PreferenceBulkUpdateResponse::Error,
                Courier::Internal::AnyHash
              )
            end

          # A human-readable explanation of why the topic could not be applied.
          sig { returns(String) }
          attr_accessor :reason

          sig { returns(String) }
          attr_accessor :topic_id

          # A single topic that could not be applied in a bulk preference request.
          sig do
            params(reason: String, topic_id: String).returns(T.attached_class)
          end
          def self.new(
            # A human-readable explanation of why the topic could not be applied.
            reason:,
            topic_id:
          )
          end

          sig { override.returns({ reason: String, topic_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
