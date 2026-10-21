# typed: strong

module Courier
  module Models
    class NotificationTemplateEmail < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::NotificationTemplateEmail, Courier::Internal::AnyHash)
        end

      # BCC addresses.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :bcc

      sig { params(bcc: T::Array[String]).void }
      attr_writer :bcc

      # CC addresses.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :cc

      sig { params(cc: T::Array[String]).void }
      attr_writer :cc

      # The From address.
      sig { returns(T.nilable(String)) }
      attr_reader :from

      sig { params(from: String).void }
      attr_writer :from

      # The Reply-to address.
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to

      sig { params(reply_to: String).void }
      attr_writer :reply_to

      # Email header fields for the template's email channel: the From, Reply-to, CC and
      # BCC values set in the Studio email channel settings. Each value may use template
      # variables, such as `{{data.cc}}`, which are resolved at send time. Reads omit
      # `email` when no header is set, and omit each unset field. Writes treat it as
      # optional, with three meanings. Omit it to keep the stored headers. Send null to
      # clear all four. Send an object to replace all four: a field the object leaves
      # out is cleared. Other email channel settings, such as the subject, are kept
      # either way. Headers only apply while `content` has an email channel; with no
      # email channel they are not stored.
      sig do
        params(
          bcc: T::Array[String],
          cc: T::Array[String],
          from: String,
          reply_to: String
        ).returns(T.attached_class)
      end
      def self.new(
        # BCC addresses.
        bcc: nil,
        # CC addresses.
        cc: nil,
        # The From address.
        from: nil,
        # The Reply-to address.
        reply_to: nil
      )
      end

      sig do
        override.returns(
          {
            bcc: T::Array[String],
            cc: T::Array[String],
            from: String,
            reply_to: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
