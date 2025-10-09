# frozen_string_literal: true

module Trycourier
  module Resources
    class Translations
      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::TranslationRetrieveParams} for more details.
      #
      # Get translations by locale
      #
      # @overload retrieve(locale, domain:, request_options: {})
      #
      # @param locale [String] The locale you want to retrieve the translations for
      #
      # @param domain [String] The domain you want to retrieve translations for. Only `default` is supported at
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see Trycourier::Models::TranslationRetrieveParams
      def retrieve(locale, params)
        parsed, options = Trycourier::TranslationRetrieveParams.dump_request(params)
        domain =
          parsed.delete(:domain) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["translations/%1$s/%2$s", domain, locale],
          model: String,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::TranslationUpdateParams} for more details.
      #
      # Update a translation
      #
      # @overload update(locale, domain:, body:, request_options: {})
      #
      # @param locale [String] Path param: The locale you want to retrieve the translations for
      #
      # @param domain [String] Path param: The domain you want to retrieve translations for. Only `default` is
      #
      # @param body [String] Body param:
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::TranslationUpdateParams
      def update(locale, params)
        parsed, options = Trycourier::TranslationUpdateParams.dump_request(params)
        domain =
          parsed.delete(:domain) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :put,
          path: ["translations/%1$s/%2$s", domain, locale],
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
