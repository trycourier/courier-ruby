# typed: strong

module Courier
  module Models
    class AutomationRunListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AutomationRunListResponse, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::AutomationRunListItem]) }
      attr_accessor :runs

      # Pass back as `cursor` to fetch the next page. Absent on the last page.
      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      # A page of Automation runs.
      sig do
        params(
          runs: T::Array[Courier::AutomationRunListItem::OrHash],
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        runs:,
        # Pass back as `cursor` to fetch the next page. Absent on the last page.
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            runs: T::Array[Courier::AutomationRunListItem],
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
