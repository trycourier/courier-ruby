# typed: strong

module Trycourier
  module Models
    class BrandSettingsInApp < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandSettingsInApp, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::BrandColors) }
      attr_reader :colors

      sig { params(colors: Trycourier::BrandColors::OrHash).void }
      attr_writer :colors

      sig { returns(Trycourier::Icons) }
      attr_reader :icons

      sig { params(icons: Trycourier::Icons::OrHash).void }
      attr_writer :icons

      sig { returns(Trycourier::WidgetBackground) }
      attr_reader :widget_background

      sig do
        params(widget_background: Trycourier::WidgetBackground::OrHash).void
      end
      attr_writer :widget_background

      sig { returns(T.nilable(String)) }
      attr_accessor :border_radius

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :disable_message_icon

      sig { returns(T.nilable(String)) }
      attr_accessor :font_family

      sig do
        returns(T.nilable(Trycourier::BrandSettingsInApp::Placement::OrSymbol))
      end
      attr_accessor :placement

      sig do
        params(
          colors: Trycourier::BrandColors::OrHash,
          icons: Trycourier::Icons::OrHash,
          widget_background: Trycourier::WidgetBackground::OrHash,
          border_radius: T.nilable(String),
          disable_message_icon: T.nilable(T::Boolean),
          font_family: T.nilable(String),
          placement:
            T.nilable(Trycourier::BrandSettingsInApp::Placement::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        colors:,
        icons:,
        widget_background:,
        border_radius: nil,
        disable_message_icon: nil,
        font_family: nil,
        placement: nil
      )
      end

      sig do
        override.returns(
          {
            colors: Trycourier::BrandColors,
            icons: Trycourier::Icons,
            widget_background: Trycourier::WidgetBackground,
            border_radius: T.nilable(String),
            disable_message_icon: T.nilable(T::Boolean),
            font_family: T.nilable(String),
            placement:
              T.nilable(Trycourier::BrandSettingsInApp::Placement::OrSymbol)
          }
        )
      end
      def to_hash
      end

      module Placement
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::BrandSettingsInApp::Placement)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOP =
          T.let(:top, Trycourier::BrandSettingsInApp::Placement::TaggedSymbol)
        BOTTOM =
          T.let(
            :bottom,
            Trycourier::BrandSettingsInApp::Placement::TaggedSymbol
          )
        LEFT =
          T.let(:left, Trycourier::BrandSettingsInApp::Placement::TaggedSymbol)
        RIGHT =
          T.let(:right, Trycourier::BrandSettingsInApp::Placement::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::BrandSettingsInApp::Placement::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
