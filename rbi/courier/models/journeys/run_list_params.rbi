# typed: strong

module Courier
  module Models
    module Journeys
      class RunListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Courier::Journeys::RunListParams, Courier::Internal::AnyHash)
          end

        # A cursor token for pagination. Use the `next_cursor` from the previous response
        # to fetch the next page of results. Treat it as opaque.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # An inclusive upper bound on `created_at`, in the same format as `start_date`.
        sig { returns(T.nilable(String)) }
        attr_reader :end_date

        sig { params(end_date: String).void }
        attr_writer :end_date

        # The number of runs to return per page, between `1` and `50`. Defaults to `20`.
        # Values outside the range are clamped, and a non-numeric value falls back to
        # `20`.
        sig { returns(T.nilable(String)) }
        attr_reader :limit

        sig { params(limit: String).void }
        attr_writer :limit

        # An inclusive lower bound on `created_at`, as an ISO 8601 date or timestamp (e.g.
        # `2026-08-18` or `2026-08-18T20:06:36.259Z`). Any other format returns `400`.
        sig { returns(T.nilable(String)) }
        attr_reader :start_date

        sig { params(start_date: String).void }
        attr_writer :start_date

        # A comma-separated list of run statuses to filter on, e.g. `PROCESSED,ERROR`.
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # A comma-separated list of Journey ids to filter on.
        sig { returns(T.nilable(String)) }
        attr_reader :template_id

        sig { params(template_id: String).void }
        attr_writer :template_id

        sig do
          params(
            cursor: String,
            end_date: String,
            limit: String,
            start_date: String,
            status: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A cursor token for pagination. Use the `next_cursor` from the previous response
          # to fetch the next page of results. Treat it as opaque.
          cursor: nil,
          # An inclusive upper bound on `created_at`, in the same format as `start_date`.
          end_date: nil,
          # The number of runs to return per page, between `1` and `50`. Defaults to `20`.
          # Values outside the range are clamped, and a non-numeric value falls back to
          # `20`.
          limit: nil,
          # An inclusive lower bound on `created_at`, as an ISO 8601 date or timestamp (e.g.
          # `2026-08-18` or `2026-08-18T20:06:36.259Z`). Any other format returns `400`.
          start_date: nil,
          # A comma-separated list of run statuses to filter on, e.g. `PROCESSED,ERROR`.
          status: nil,
          # A comma-separated list of Journey ids to filter on.
          template_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              end_date: String,
              limit: String,
              start_date: String,
              status: String,
              template_id: String,
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
