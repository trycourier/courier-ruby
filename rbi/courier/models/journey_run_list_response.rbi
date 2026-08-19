# typed: strong

module Courier
  module Models
    class JourneyRunListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyRunListResponse, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::JourneyRunListItem]) }
      attr_accessor :runs

      # Pass back as `cursor` to fetch the next page. Absent on the last page.
      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      # Pass back as `cursor` to fetch the previous page. Absent on the first page.
      sig { returns(T.nilable(String)) }
      attr_reader :prev_cursor

      sig { params(prev_cursor: String).void }
      attr_writer :prev_cursor

      # A page of Journey runs.
      sig do
        params(
          runs: T::Array[Courier::JourneyRunListItem::OrHash],
          next_cursor: String,
          prev_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        runs:,
        # Pass back as `cursor` to fetch the next page. Absent on the last page.
        next_cursor: nil,
        # Pass back as `cursor` to fetch the previous page. Absent on the first page.
        prev_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            runs: T::Array[Courier::JourneyRunListItem],
            next_cursor: String,
            prev_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
