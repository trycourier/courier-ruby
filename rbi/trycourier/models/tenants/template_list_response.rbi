# typed: strong

module Trycourier
  module Models
    module Tenants
      class TemplateListResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Tenants::TemplateListResponse,
              Trycourier::Internal::AnyHash
            )
          end

        # Set to true when there are more pages that can be retrieved.
        sig { returns(T::Boolean) }
        attr_accessor :has_more

        # Always set to `list`. Represents the type of this object.
        sig do
          returns(
            Trycourier::Models::Tenants::TemplateListResponse::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A url that may be used to generate these results.
        sig { returns(String) }
        attr_accessor :url

        # A pointer to the next page of results. Defined only when `has_more` is set to
        # true
        sig { returns(T.nilable(String)) }
        attr_accessor :cursor

        sig do
          returns(
            T.nilable(
              T::Array[Trycourier::Models::Tenants::TemplateListResponse::Item]
            )
          )
        end
        attr_accessor :items

        # A url that may be used to generate fetch the next set of results. Defined only
        # when `has_more` is set to true
        sig { returns(T.nilable(String)) }
        attr_accessor :next_url

        sig do
          params(
            has_more: T::Boolean,
            type:
              Trycourier::Models::Tenants::TemplateListResponse::Type::OrSymbol,
            url: String,
            cursor: T.nilable(String),
            items:
              T.nilable(
                T::Array[
                  Trycourier::Models::Tenants::TemplateListResponse::Item::OrHash
                ]
              ),
            next_url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Set to true when there are more pages that can be retrieved.
          has_more:,
          # Always set to `list`. Represents the type of this object.
          type:,
          # A url that may be used to generate these results.
          url:,
          # A pointer to the next page of results. Defined only when `has_more` is set to
          # true
          cursor: nil,
          items: nil,
          # A url that may be used to generate fetch the next set of results. Defined only
          # when `has_more` is set to true
          next_url: nil
        )
        end

        sig do
          override.returns(
            {
              has_more: T::Boolean,
              type:
                Trycourier::Models::Tenants::TemplateListResponse::Type::TaggedSymbol,
              url: String,
              cursor: T.nilable(String),
              items:
                T.nilable(
                  T::Array[
                    Trycourier::Models::Tenants::TemplateListResponse::Item
                  ]
                ),
              next_url: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Always set to `list`. Represents the type of this object.
        module Type
          extend Trycourier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Trycourier::Models::Tenants::TemplateListResponse::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LIST =
            T.let(
              :list,
              Trycourier::Models::Tenants::TemplateListResponse::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Trycourier::Models::Tenants::TemplateListResponse::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Item < Trycourier::Models::BaseTemplateTenantAssociation
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Models::Tenants::TemplateListResponse::Item,
                Trycourier::Internal::AnyHash
              )
            end

          # The template's data containing it's routing configs
          sig do
            returns(
              Trycourier::Models::Tenants::TemplateListResponse::Item::Data
            )
          end
          attr_reader :data

          sig do
            params(
              data:
                Trycourier::Models::Tenants::TemplateListResponse::Item::Data::OrHash
            ).void
          end
          attr_writer :data

          sig do
            params(
              data:
                Trycourier::Models::Tenants::TemplateListResponse::Item::Data::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The template's data containing it's routing configs
            data:
          )
          end

          sig do
            override.returns(
              {
                data:
                  Trycourier::Models::Tenants::TemplateListResponse::Item::Data
              }
            )
          end
          def to_hash
          end

          class Data < Trycourier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Trycourier::Models::Tenants::TemplateListResponse::Item::Data,
                  Trycourier::Internal::AnyHash
                )
              end

            sig { returns(Trycourier::MessageRouting) }
            attr_reader :routing

            sig { params(routing: Trycourier::MessageRouting::OrHash).void }
            attr_writer :routing

            # The template's data containing it's routing configs
            sig do
              params(routing: Trycourier::MessageRouting::OrHash).returns(
                T.attached_class
              )
            end
            def self.new(routing:)
            end

            sig { override.returns({ routing: Trycourier::MessageRouting }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
