# frozen_string_literal: true

module Courier
  module Models
    class EmailFooter < Courier::Internal::Type::BaseModel
      # @!attribute inherit_default
      #
      #   @return [Boolean, nil]
      optional :inherit_default, Courier::Internal::Type::Boolean, api_name: :inheritDefault, nil?: true

      # @!attribute markdown
      #   The footer body, as markdown. This is the field the API returns and accepts; it
      #   is omitted entirely when no footer body is set. Sending null is accepted and
      #   treated as no footer body.
      #
      #   @return [String, nil]
      optional :markdown, String, nil?: true

      # @!attribute social
      #   Social links rendered in the email footer.
      #
      #   @return [Courier::Models::EmailFooter::Social, nil]
      optional :social, -> { Courier::EmailFooter::Social }, nil?: true

      # @!method initialize(inherit_default: nil, markdown: nil, social: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::EmailFooter} for more details.
      #
      #   @param inherit_default [Boolean, nil]
      #
      #   @param markdown [String, nil] The footer body, as markdown. This is the field the API returns and accepts; it
      #
      #   @param social [Courier::Models::EmailFooter::Social, nil] Social links rendered in the email footer.

      # @see Courier::Models::EmailFooter#social
      class Social < Courier::Internal::Type::BaseModel
        # @!attribute facebook
        #
        #   @return [Courier::Models::EmailFooter::Social::Facebook, nil]
        optional :facebook, -> { Courier::EmailFooter::Social::Facebook }, nil?: true

        # @!attribute instagram
        #
        #   @return [Courier::Models::EmailFooter::Social::Instagram, nil]
        optional :instagram, -> { Courier::EmailFooter::Social::Instagram }, nil?: true

        # @!attribute linkedin
        #
        #   @return [Courier::Models::EmailFooter::Social::Linkedin, nil]
        optional :linkedin, -> { Courier::EmailFooter::Social::Linkedin }, nil?: true

        # @!attribute medium
        #
        #   @return [Courier::Models::EmailFooter::Social::Medium, nil]
        optional :medium, -> { Courier::EmailFooter::Social::Medium }, nil?: true

        # @!attribute twitter
        #
        #   @return [Courier::Models::EmailFooter::Social::Twitter, nil]
        optional :twitter, -> { Courier::EmailFooter::Social::Twitter }, nil?: true

        # @!method initialize(facebook: nil, instagram: nil, linkedin: nil, medium: nil, twitter: nil)
        #   Social links rendered in the email footer.
        #
        #   @param facebook [Courier::Models::EmailFooter::Social::Facebook, nil]
        #   @param instagram [Courier::Models::EmailFooter::Social::Instagram, nil]
        #   @param linkedin [Courier::Models::EmailFooter::Social::Linkedin, nil]
        #   @param medium [Courier::Models::EmailFooter::Social::Medium, nil]
        #   @param twitter [Courier::Models::EmailFooter::Social::Twitter, nil]

        # @see Courier::Models::EmailFooter::Social#facebook
        class Facebook < Courier::Internal::Type::BaseModel
          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String, nil?: true

          # @!method initialize(url: nil)
          #   @param url [String, nil]
        end

        # @see Courier::Models::EmailFooter::Social#instagram
        class Instagram < Courier::Internal::Type::BaseModel
          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String, nil?: true

          # @!method initialize(url: nil)
          #   @param url [String, nil]
        end

        # @see Courier::Models::EmailFooter::Social#linkedin
        class Linkedin < Courier::Internal::Type::BaseModel
          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String, nil?: true

          # @!method initialize(url: nil)
          #   @param url [String, nil]
        end

        # @see Courier::Models::EmailFooter::Social#medium
        class Medium < Courier::Internal::Type::BaseModel
          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String, nil?: true

          # @!method initialize(url: nil)
          #   @param url [String, nil]
        end

        # @see Courier::Models::EmailFooter::Social#twitter
        class Twitter < Courier::Internal::Type::BaseModel
          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String, nil?: true

          # @!method initialize(url: nil)
          #   @param url [String, nil]
        end
      end
    end
  end
end
