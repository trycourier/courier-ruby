# typed: strong

module Courier
  module Models
    class TopicDigestCategory < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TopicDigestCategory, Courier::Internal::AnyHash)
        end

      # The key that identifies the category within the digest.
      sig { returns(String) }
      attr_accessor :category_key

      # How many collected events are carried into the rendered digest. Defaults to 10.
      #
      # Events beyond the limit are discarded, not held back for the next digest: the
      # release consumes everything collected so far and only `limit` of them appear.
      # `retain` decides which ones those are.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Which collected events survive the `limit`. `FIRST` and `LOWEST` keep the
      # earliest or smallest; `LAST` and `HIGHEST` keep the latest or largest. Accepted
      # case-insensitively, returned uppercase.
      sig { returns(T.nilable(Courier::TopicDigestCategory::Retain::OrSymbol)) }
      attr_reader :retain

      sig do
        params(retain: Courier::TopicDigestCategory::Retain::OrSymbol).void
      end
      attr_writer :retain

      # The data key used to rank events. Required when `retain` is `HIGHEST` or
      # `LOWEST`.
      sig { returns(T.nilable(String)) }
      attr_reader :sort_key

      sig { params(sort_key: String).void }
      attr_writer :sort_key

      # How events collected under a category key are retained when a digest holds more
      # than it will render.
      sig do
        params(
          category_key: String,
          limit: Integer,
          retain: Courier::TopicDigestCategory::Retain::OrSymbol,
          sort_key: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The key that identifies the category within the digest.
        category_key:,
        # How many collected events are carried into the rendered digest. Defaults to 10.
        #
        # Events beyond the limit are discarded, not held back for the next digest: the
        # release consumes everything collected so far and only `limit` of them appear.
        # `retain` decides which ones those are.
        limit: nil,
        # Which collected events survive the `limit`. `FIRST` and `LOWEST` keep the
        # earliest or smallest; `LAST` and `HIGHEST` keep the latest or largest. Accepted
        # case-insensitively, returned uppercase.
        retain: nil,
        # The data key used to rank events. Required when `retain` is `HIGHEST` or
        # `LOWEST`.
        sort_key: nil
      )
      end

      sig do
        override.returns(
          {
            category_key: String,
            limit: Integer,
            retain: Courier::TopicDigestCategory::Retain::OrSymbol,
            sort_key: String
          }
        )
      end
      def to_hash
      end

      # Which collected events survive the `limit`. `FIRST` and `LOWEST` keep the
      # earliest or smallest; `LAST` and `HIGHEST` keep the latest or largest. Accepted
      # case-insensitively, returned uppercase.
      module Retain
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::TopicDigestCategory::Retain) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FIRST =
          T.let(:FIRST, Courier::TopicDigestCategory::Retain::TaggedSymbol)
        LAST = T.let(:LAST, Courier::TopicDigestCategory::Retain::TaggedSymbol)
        HIGHEST =
          T.let(:HIGHEST, Courier::TopicDigestCategory::Retain::TaggedSymbol)
        LOWEST =
          T.let(:LOWEST, Courier::TopicDigestCategory::Retain::TaggedSymbol)
        NONE = T.let(:NONE, Courier::TopicDigestCategory::Retain::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::TopicDigestCategory::Retain::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
