# typed: strong

module Courier
  module Resources
    class Digests
      class Schedules
        # List the digest instances for a schedule. Each instance represents the events
        # accumulated for a single user against the schedule, and can be used to monitor
        # digest accumulation before the digest is released.
        sig do
          params(
            schedule_id: String,
            cursor: String,
            limit: Integer,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::DigestInstanceListResponse)
        end
        def list_instances(
          # The ID of the digest schedule, in the form `sch/{uuid}`. The value must be
          # URL-encoded (e.g. `sch%2F00000000-0000-0000-0000-000000000000`).
          schedule_id,
          # A cursor token from a previous response, used to fetch the next page of results.
          cursor: nil,
          # The maximum number of digest instances to return. Defaults to 20, with a maximum
          # of 100.
          limit: nil,
          request_options: {}
        )
        end

        # Send a digest now instead of waiting for its scheduled time, so your users get
        # what they have collected so far right away.
        sig do
          params(
            schedule_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def release(
          # The ID of the digest schedule to release, in the form `sch/{uuid}`. The value
          # must be URL-encoded (e.g. `sch%2F00000000-0000-0000-0000-000000000000`).
          schedule_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
