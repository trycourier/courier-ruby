# frozen_string_literal: true

module Courier
  module Resources
    class Journeys
      class Templates
        # Create a notification template scoped to this journey. The template is created
        # in DRAFT state.
        #
        # @overload create(template_id, channel:, notification:, provider_key: nil, state: nil, request_options: {})
        #
        # @param template_id [String] Journey id
        #
        # @param channel [String]
        #
        # @param notification [Courier::Models::JourneyTemplateCreateRequest::Notification]
        #
        # @param provider_key [String]
        #
        # @param state [String]
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateGetResponse]
        #
        # @see Courier::Models::Journeys::TemplateCreateParams
        def create(template_id, params)
          parsed, options = Courier::Journeys::TemplateCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["journeys/%1$s/templates", template_id],
            body: parsed,
            model: Courier::JourneyTemplateGetResponse,
            options: options
          )
        end

        # Fetch a journey-scoped notification template by id. Pass `?version=draft`
        # (default `published`) to retrieve the working draft, or `?version=vN` for a
        # historical version.
        #
        # @overload retrieve(notification_id, template_id:, request_options: {})
        #
        # @param notification_id [String] Journey template id
        #
        # @param template_id [String] Journey id
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateGetResponse]
        #
        # @see Courier::Models::Journeys::TemplateRetrieveParams
        def retrieve(notification_id, params)
          parsed, options = Courier::Journeys::TemplateRetrieveParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["journeys/%1$s/templates/%2$s", template_id, notification_id],
            model: Courier::JourneyTemplateGetResponse,
            options: options
          )
        end

        # List notification templates scoped to this journey. Templates scoped to a
        # journey can only be referenced from `send` nodes of the same journey.
        #
        # @overload list(template_id, cursor: nil, limit: nil, request_options: {})
        #
        # @param template_id [String] Journey id
        #
        # @param cursor [String]
        #
        # @param limit [Integer]
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateListResponse]
        #
        # @see Courier::Models::Journeys::TemplateListParams
        def list(template_id, params = {})
          parsed, options = Courier::Journeys::TemplateListParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["journeys/%1$s/templates", template_id],
            query: query,
            model: Courier::JourneyTemplateListResponse,
            options: options
          )
        end

        # Archive a journey-scoped notification template. Archived templates cannot be
        # sent.
        #
        # @overload archive(notification_id, template_id:, request_options: {})
        #
        # @param notification_id [String] Journey template id
        #
        # @param template_id [String] Journey id
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Journeys::TemplateArchiveParams
        def archive(notification_id, params)
          parsed, options = Courier::Journeys::TemplateArchiveParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["journeys/%1$s/templates/%2$s", template_id, notification_id],
            model: NilClass,
            options: options
          )
        end

        # List published versions of a journey-scoped notification template, ordered most
        # recent first.
        #
        # @overload list_versions(notification_id, template_id:, request_options: {})
        #
        # @param notification_id [String] Journey template id
        #
        # @param template_id [String] Journey id
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::NotificationTemplateVersionListResponse]
        #
        # @see Courier::Models::Journeys::TemplateListVersionsParams
        def list_versions(notification_id, params)
          parsed, options = Courier::Journeys::TemplateListVersionsParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["journeys/%1$s/templates/%2$s/versions", template_id, notification_id],
            model: Courier::NotificationTemplateVersionListResponse,
            options: options
          )
        end

        # Publish the current draft of a journey-scoped notification template.
        #
        # @overload publish(notification_id, template_id:, version: nil, request_options: {})
        #
        # @param notification_id [String] Path param: Journey template id
        #
        # @param template_id [String] Path param: Journey id
        #
        # @param version [String] Body param
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Journeys::TemplatePublishParams
        def publish(notification_id, params)
          parsed, options = Courier::Journeys::TemplatePublishParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["journeys/%1$s/templates/%2$s/publish", template_id, notification_id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Replace a journey-scoped notification template draft.
        #
        # @overload replace(notification_id, template_id:, notification:, state: nil, request_options: {})
        #
        # @param notification_id [String] Path param: Journey template id
        #
        # @param template_id [String] Path param: Journey id
        #
        # @param notification [Courier::Models::JourneyTemplateReplaceRequest::Notification] Body param
        #
        # @param state [String] Body param
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyTemplateGetResponse]
        #
        # @see Courier::Models::Journeys::TemplateReplaceParams
        def replace(notification_id, params)
          parsed, options = Courier::Journeys::TemplateReplaceParams.dump_request(params)
          template_id =
            parsed.delete(:template_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["journeys/%1$s/templates/%2$s", template_id, notification_id],
            body: parsed,
            model: Courier::JourneyTemplateGetResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
