# typed: strong

module Courier
  module Models
    class EmailFooter < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::EmailFooter, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_default

      # The footer body, as markdown. This is the field the API returns and accepts; it
      # is omitted entirely when no footer body is set. Sending null is accepted and
      # treated as no footer body.
      sig { returns(T.nilable(String)) }
      attr_accessor :markdown

      # Social links rendered in the email footer.
      sig { returns(T.nilable(Courier::EmailFooter::Social)) }
      attr_reader :social

      sig do
        params(social: T.nilable(Courier::EmailFooter::Social::OrHash)).void
      end
      attr_writer :social

      sig do
        params(
          inherit_default: T.nilable(T::Boolean),
          markdown: T.nilable(String),
          social: T.nilable(Courier::EmailFooter::Social::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        inherit_default: nil,
        # The footer body, as markdown. This is the field the API returns and accepts; it
        # is omitted entirely when no footer body is set. Sending null is accepted and
        # treated as no footer body.
        markdown: nil,
        # Social links rendered in the email footer.
        social: nil
      )
      end

      sig do
        override.returns(
          {
            inherit_default: T.nilable(T::Boolean),
            markdown: T.nilable(String),
            social: T.nilable(Courier::EmailFooter::Social)
          }
        )
      end
      def to_hash
      end

      class Social < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::EmailFooter::Social, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(Courier::EmailFooter::Social::Facebook)) }
        attr_reader :facebook

        sig do
          params(
            facebook: T.nilable(Courier::EmailFooter::Social::Facebook::OrHash)
          ).void
        end
        attr_writer :facebook

        sig { returns(T.nilable(Courier::EmailFooter::Social::Instagram)) }
        attr_reader :instagram

        sig do
          params(
            instagram:
              T.nilable(Courier::EmailFooter::Social::Instagram::OrHash)
          ).void
        end
        attr_writer :instagram

        sig { returns(T.nilable(Courier::EmailFooter::Social::Linkedin)) }
        attr_reader :linkedin

        sig do
          params(
            linkedin: T.nilable(Courier::EmailFooter::Social::Linkedin::OrHash)
          ).void
        end
        attr_writer :linkedin

        sig { returns(T.nilable(Courier::EmailFooter::Social::Medium)) }
        attr_reader :medium

        sig do
          params(
            medium: T.nilable(Courier::EmailFooter::Social::Medium::OrHash)
          ).void
        end
        attr_writer :medium

        sig { returns(T.nilable(Courier::EmailFooter::Social::Twitter)) }
        attr_reader :twitter

        sig do
          params(
            twitter: T.nilable(Courier::EmailFooter::Social::Twitter::OrHash)
          ).void
        end
        attr_writer :twitter

        # Social links rendered in the email footer.
        sig do
          params(
            facebook: T.nilable(Courier::EmailFooter::Social::Facebook::OrHash),
            instagram:
              T.nilable(Courier::EmailFooter::Social::Instagram::OrHash),
            linkedin: T.nilable(Courier::EmailFooter::Social::Linkedin::OrHash),
            medium: T.nilable(Courier::EmailFooter::Social::Medium::OrHash),
            twitter: T.nilable(Courier::EmailFooter::Social::Twitter::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          facebook: nil,
          instagram: nil,
          linkedin: nil,
          medium: nil,
          twitter: nil
        )
        end

        sig do
          override.returns(
            {
              facebook: T.nilable(Courier::EmailFooter::Social::Facebook),
              instagram: T.nilable(Courier::EmailFooter::Social::Instagram),
              linkedin: T.nilable(Courier::EmailFooter::Social::Linkedin),
              medium: T.nilable(Courier::EmailFooter::Social::Medium),
              twitter: T.nilable(Courier::EmailFooter::Social::Twitter)
            }
          )
        end
        def to_hash
        end

        class Facebook < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::EmailFooter::Social::Facebook,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :url

          sig { params(url: T.nilable(String)).returns(T.attached_class) }
          def self.new(url: nil)
          end

          sig { override.returns({ url: T.nilable(String) }) }
          def to_hash
          end
        end

        class Instagram < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::EmailFooter::Social::Instagram,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :url

          sig { params(url: T.nilable(String)).returns(T.attached_class) }
          def self.new(url: nil)
          end

          sig { override.returns({ url: T.nilable(String) }) }
          def to_hash
          end
        end

        class Linkedin < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::EmailFooter::Social::Linkedin,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :url

          sig { params(url: T.nilable(String)).returns(T.attached_class) }
          def self.new(url: nil)
          end

          sig { override.returns({ url: T.nilable(String) }) }
          def to_hash
          end
        end

        class Medium < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::EmailFooter::Social::Medium,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :url

          sig { params(url: T.nilable(String)).returns(T.attached_class) }
          def self.new(url: nil)
          end

          sig { override.returns({ url: T.nilable(String) }) }
          def to_hash
          end
        end

        class Twitter < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::EmailFooter::Social::Twitter,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :url

          sig { params(url: T.nilable(String)).returns(T.attached_class) }
          def self.new(url: nil)
          end

          sig { override.returns({ url: T.nilable(String) }) }
          def to_hash
          end
        end
      end
    end
  end
end
