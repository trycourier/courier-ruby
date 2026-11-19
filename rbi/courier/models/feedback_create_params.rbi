# typed: strong

module Courier
  module Models
    class FeedbackCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::FeedbackCreateParams, Courier::Internal::AnyHash)
        end

      # What kind of report this is: `possible_bug` for behavior that looks wrong,
      # `confusing_behavior` for behavior that works but was hard to understand,
      # `feature_request` for something Courier does not do yet, and `other`.
      sig { returns(Courier::FeedbackCreateParams::Category::OrSymbol) }
      attr_accessor :category

      # What happened, in enough detail for someone at Courier to follow it.
      sig { returns(String) }
      attr_accessor :description

      # Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server,
      # the Courier app `ui`, the `docs`, or `other`.
      sig { returns(Courier::FeedbackCreateParams::Surface::OrSymbol) }
      attr_accessor :surface

      # A one-line summary of the report.
      sig { returns(String) }
      attr_accessor :title

      # What you expected to happen instead.
      sig { returns(T.nilable(String)) }
      attr_reader :expected_behavior

      sig { params(expected_behavior: String).void }
      attr_writer :expected_behavior

      # The agent or tool that submitted the report, such as `Claude Code`.
      sig { returns(T.nilable(String)) }
      attr_reader :harness

      sig { params(harness: String).void }
      attr_writer :harness

      # Where it happened, such as an endpoint (`POST /send`), an SDK method, an MCP
      # tool name or a docs URL.
      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      # The AI model that submitted the report, such as `claude-opus-5-5`.
      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      # The request ID of an API call that shows the problem, if there is one.
      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      sig do
        params(
          category: Courier::FeedbackCreateParams::Category::OrSymbol,
          description: String,
          surface: Courier::FeedbackCreateParams::Surface::OrSymbol,
          title: String,
          expected_behavior: String,
          harness: String,
          location: String,
          model: String,
          request_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # What kind of report this is: `possible_bug` for behavior that looks wrong,
        # `confusing_behavior` for behavior that works but was hard to understand,
        # `feature_request` for something Courier does not do yet, and `other`.
        category:,
        # What happened, in enough detail for someone at Courier to follow it.
        description:,
        # Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server,
        # the Courier app `ui`, the `docs`, or `other`.
        surface:,
        # A one-line summary of the report.
        title:,
        # What you expected to happen instead.
        expected_behavior: nil,
        # The agent or tool that submitted the report, such as `Claude Code`.
        harness: nil,
        # Where it happened, such as an endpoint (`POST /send`), an SDK method, an MCP
        # tool name or a docs URL.
        location: nil,
        # The AI model that submitted the report, such as `claude-opus-5-5`.
        model: nil,
        # The request ID of an API call that shows the problem, if there is one.
        request_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: Courier::FeedbackCreateParams::Category::OrSymbol,
            description: String,
            surface: Courier::FeedbackCreateParams::Surface::OrSymbol,
            title: String,
            expected_behavior: String,
            harness: String,
            location: String,
            model: String,
            request_id: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      # What kind of report this is: `possible_bug` for behavior that looks wrong,
      # `confusing_behavior` for behavior that works but was hard to understand,
      # `feature_request` for something Courier does not do yet, and `other`.
      module Category
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::FeedbackCreateParams::Category)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POSSIBLE_BUG =
          T.let(
            :possible_bug,
            Courier::FeedbackCreateParams::Category::TaggedSymbol
          )
        CONFUSING_BEHAVIOR =
          T.let(
            :confusing_behavior,
            Courier::FeedbackCreateParams::Category::TaggedSymbol
          )
        FEATURE_REQUEST =
          T.let(
            :feature_request,
            Courier::FeedbackCreateParams::Category::TaggedSymbol
          )
        OTHER =
          T.let(:other, Courier::FeedbackCreateParams::Category::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::FeedbackCreateParams::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server,
      # the Courier app `ui`, the `docs`, or `other`.
      module Surface
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::FeedbackCreateParams::Surface) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        API = T.let(:api, Courier::FeedbackCreateParams::Surface::TaggedSymbol)
        SDK = T.let(:sdk, Courier::FeedbackCreateParams::Surface::TaggedSymbol)
        MCP = T.let(:mcp, Courier::FeedbackCreateParams::Surface::TaggedSymbol)
        UI = T.let(:ui, Courier::FeedbackCreateParams::Surface::TaggedSymbol)
        DOCS =
          T.let(:docs, Courier::FeedbackCreateParams::Surface::TaggedSymbol)
        OTHER =
          T.let(:other, Courier::FeedbackCreateParams::Surface::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::FeedbackCreateParams::Surface::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
