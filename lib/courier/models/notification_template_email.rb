# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplateEmail < Courier::Internal::Type::BaseModel
      # @!attribute bcc
      #   BCC addresses.
      #
      #   @return [Array<String>, nil]
      optional :bcc, Courier::Internal::Type::ArrayOf[String]

      # @!attribute cc
      #   CC addresses.
      #
      #   @return [Array<String>, nil]
      optional :cc, Courier::Internal::Type::ArrayOf[String]

      # @!attribute from
      #   The From address.
      #
      #   @return [String, nil]
      optional :from, String

      # @!attribute reply_to
      #   The Reply-to address.
      #
      #   @return [String, nil]
      optional :reply_to, String

      # @!method initialize(bcc: nil, cc: nil, from: nil, reply_to: nil)
      #   Email header fields for the template's email channel: the From, Reply-to, CC and
      #   BCC values set in the Studio email channel settings. Each value may use template
      #   variables, such as `{{data.cc}}`, which are resolved at send time. Reads omit
      #   `email` when no header is set, and omit each unset field. Writes treat it as
      #   optional, with three meanings. Omit it to keep the stored headers. Send null to
      #   clear all four. Send an object to replace all four: a field the object leaves
      #   out is cleared. Other email channel settings, such as the subject, are kept
      #   either way. Headers only apply while `content` has an email channel; with no
      #   email channel they are not stored.
      #
      #   @param bcc [Array<String>] BCC addresses.
      #
      #   @param cc [Array<String>] CC addresses.
      #
      #   @param from [String] The From address.
      #
      #   @param reply_to [String] The Reply-to address.
    end
  end
end
