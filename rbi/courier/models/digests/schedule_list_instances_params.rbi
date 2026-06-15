# typed: strong

module Courier
  module Models
    module Digests
      class ScheduleListInstancesParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Digests::ScheduleListInstancesParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :schedule_id

        # A cursor token from a previous response, used to fetch the next page of results.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # The maximum number of digest instances to return. Defaults to 20, with a maximum
        # of 100.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            schedule_id: String,
            cursor: String,
            limit: Integer,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          schedule_id:,
          # A cursor token from a previous response, used to fetch the next page of results.
          cursor: nil,
          # The maximum number of digest instances to return. Defaults to 20, with a maximum
          # of 100.
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              schedule_id: String,
              cursor: String,
              limit: Integer,
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
