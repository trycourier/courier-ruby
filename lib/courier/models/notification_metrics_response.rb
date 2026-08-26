# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#get_metrics
    class NotificationMetricsResponse < Courier::Internal::Type::BaseModel
      # @!attribute end_
      #   End of the window actually queried, ceiled onto the granularity grid.
      #   Second-precision UTC.
      #
      #   @return [Time]
      required :end_, Time, api_name: :end

      # @!attribute granularity
      #   Bucket size the series was built at.
      #
      #   @return [Symbol, Courier::Models::NotificationMetricsResponse::Granularity]
      required :granularity, enum: -> { Courier::NotificationMetricsResponse::Granularity }

      # @!attribute notification_id
      #   The template the series describes, echoed from the request.
      #
      #   @return [String]
      required :notification_id, String, api_name: :notificationId

      # @!attribute series
      #   One entry per bucket between `start` and `end`, oldest first, including buckets
      #   with no activity.
      #
      #   @return [Array<Courier::Models::NotificationMetricsResponse::Series>]
      required :series, -> { Courier::Internal::Type::ArrayOf[Courier::NotificationMetricsResponse::Series] }

      # @!attribute start
      #   Inclusive start of the window actually queried, floored onto the granularity
      #   grid. Second-precision UTC.
      #
      #   @return [Time]
      required :start, Time

      # @!method initialize(end_:, granularity:, notification_id:, series:, start:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationMetricsResponse} for more details.
      #
      #   @param end_ [Time] End of the window actually queried, ceiled onto the granularity grid. Second-pre
      #
      #   @param granularity [Symbol, Courier::Models::NotificationMetricsResponse::Granularity] Bucket size the series was built at.
      #
      #   @param notification_id [String] The template the series describes, echoed from the request.
      #
      #   @param series [Array<Courier::Models::NotificationMetricsResponse::Series>] One entry per bucket between `start` and `end`, oldest first, including buckets
      #
      #   @param start [Time] Inclusive start of the window actually queried, floored onto the granularity gri

      # Bucket size the series was built at.
      #
      # @see Courier::Models::NotificationMetricsResponse#granularity
      module Granularity
        extend Courier::Internal::Type::Enum

        HOUR = :HOUR
        DAY = :DAY
        WEEK = :WEEK
        MONTH = :MONTH

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Series < Courier::Internal::Type::BaseModel
        # @!attribute data
        #   One entry per provider and channel that handled a message in this bucket. Empty
        #   when nothing was sent.
        #
        #   @return [Array<Courier::Models::NotificationMetricsResponse::Series::Data>]
        required :data,
                 -> { Courier::Internal::Type::ArrayOf[Courier::NotificationMetricsResponse::Series::Data] }

        # @!attribute period
        #   Start of the bucket, second-precision UTC.
        #
        #   @return [Time]
        required :period, Time

        # @!method initialize(data:, period:)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::NotificationMetricsResponse::Series} for more details.
        #
        #   @param data [Array<Courier::Models::NotificationMetricsResponse::Series::Data>] One entry per provider and channel that handled a message in this bucket. Empty
        #
        #   @param period [Time] Start of the bucket, second-precision UTC.

        class Data < Courier::Internal::Type::BaseModel
          # @!attribute channel
          #   Channel the provider delivered on, e.g. `email`.
          #
          #   @return [String]
          required :channel, String

          # @!attribute clicked
          #   Messages with at least one tracked link click.
          #
          #   @return [Integer]
          required :clicked, Integer

          # @!attribute delivered
          #   Messages the provider confirmed as delivered.
          #
          #   @return [Integer]
          required :delivered, Integer

          # @!attribute errors
          #   Messages the provider rejected or failed on, including ones a later provider
          #   then delivered.
          #
          #   @return [Integer]
          required :errors, Integer

          # @!attribute opened
          #   Messages opened at least once. Always `0` on channels with no open tracking.
          #
          #   @return [Integer]
          required :opened, Integer

          # @!attribute provider
          #   Provider that handled the messages, e.g. `sendgrid`.
          #
          #   @return [String]
          required :provider, String

          # @!attribute sent
          #   Messages handed to the provider.
          #
          #   @return [Integer]
          required :sent, Integer

          # @!attribute undeliverable
          #   Messages Courier could not deliver on any provider for the channel.
          #
          #   @return [Integer]
          required :undeliverable, Integer

          # @!method initialize(channel:, clicked:, delivered:, errors:, opened:, provider:, sent:, undeliverable:)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::NotificationMetricsResponse::Series::Data} for more details.
          #
          #   @param channel [String] Channel the provider delivered on, e.g. `email`.
          #
          #   @param clicked [Integer] Messages with at least one tracked link click.
          #
          #   @param delivered [Integer] Messages the provider confirmed as delivered.
          #
          #   @param errors [Integer] Messages the provider rejected or failed on, including ones a later provider the
          #
          #   @param opened [Integer] Messages opened at least once. Always `0` on channels with no open tracking.
          #
          #   @param provider [String] Provider that handled the messages, e.g. `sendgrid`.
          #
          #   @param sent [Integer] Messages handed to the provider.
          #
          #   @param undeliverable [Integer] Messages Courier could not deliver on any provider for the channel.
        end
      end
    end
  end
end
