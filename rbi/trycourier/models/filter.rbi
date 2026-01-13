# typed: strong

module Trycourier
  module Models
    class Filter < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::Filter, Trycourier::Internal::AnyHash)
        end

      sig do
        returns(
          T::Array[
            T.any(
              Trycourier::SingleFilterConfig,
              Trycourier::NestedFilterConfig
            )
          ]
        )
      end
      attr_accessor :filters

      # Filter that contains an array of FilterConfig items
      sig do
        params(
          filters:
            T::Array[
              T.any(
                Trycourier::SingleFilterConfig::OrHash,
                Trycourier::NestedFilterConfig
              )
            ]
        ).returns(T.attached_class)
      end
      def self.new(filters:)
      end

      sig do
        override.returns(
          {
            filters:
              T::Array[
                T.any(
                  Trycourier::SingleFilterConfig,
                  Trycourier::NestedFilterConfig
                )
              ]
          }
        )
      end
      def to_hash
      end
    end
  end
end
