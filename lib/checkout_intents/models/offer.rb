# frozen_string_literal: true

module CheckoutIntents
  module Models
    class Offer < ::CheckoutIntents::Internal::Type::BaseModel
      # @!attribute cost
      #
      #   @return [::CheckoutIntents::Models::Offer::Cost]
      required :cost, -> { ::CheckoutIntents::Offer::Cost }

      # @!attribute shipping
      #
      #   @return [::CheckoutIntents::Models::Offer::Shipping]
      required :shipping, -> { ::CheckoutIntents::Offer::Shipping }

      # @!attribute applied_promo_codes
      #
      #   @return [Array<String>, nil]
      optional :applied_promo_codes,
               ::CheckoutIntents::Internal::Type::ArrayOf[String],
               api_name: :appliedPromoCodes

      # @!method initialize(cost:, shipping:, applied_promo_codes: nil)
      #   @param cost [::CheckoutIntents::Models::Offer::Cost]
      #   @param shipping [::CheckoutIntents::Models::Offer::Shipping]
      #   @param applied_promo_codes [Array<String>]

      # @see ::CheckoutIntents::Models::Offer#cost
      class Cost < ::CheckoutIntents::Internal::Type::BaseModel
        # @!attribute subtotal
        #
        #   @return [::CheckoutIntents::Models::Money]
        required :subtotal, -> { ::CheckoutIntents::Money }

        # @!attribute total
        #
        #   @return [::CheckoutIntents::Models::Money]
        required :total, -> { ::CheckoutIntents::Money }

        # @!attribute discount
        #
        #   @return [::CheckoutIntents::Models::Money, nil]
        optional :discount, -> { ::CheckoutIntents::Money }

        # @!attribute shipping
        #
        #   @return [::CheckoutIntents::Models::Money, nil]
        optional :shipping, -> { ::CheckoutIntents::Money }

        # @!attribute surcharge
        #
        #   @return [::CheckoutIntents::Models::Money, nil]
        optional :surcharge, -> { ::CheckoutIntents::Money }

        # @!attribute tax
        #
        #   @return [::CheckoutIntents::Models::Money, nil]
        optional :tax, -> { ::CheckoutIntents::Money }

        # @!method initialize(subtotal:, total:, discount: nil, shipping: nil, surcharge: nil, tax: nil)
        #   @param subtotal [::CheckoutIntents::Models::Money]
        #   @param total [::CheckoutIntents::Models::Money]
        #   @param discount [::CheckoutIntents::Models::Money]
        #   @param shipping [::CheckoutIntents::Models::Money]
        #   @param surcharge [::CheckoutIntents::Models::Money]
        #   @param tax [::CheckoutIntents::Models::Money]
      end

      # @see ::CheckoutIntents::Models::Offer#shipping
      class Shipping < ::CheckoutIntents::Internal::Type::BaseModel
        # @!attribute available_options
        #
        #   @return [Array<::CheckoutIntents::Models::Offer::Shipping::AvailableOption>]
        required :available_options,
                 -> {
                   ::CheckoutIntents::Internal::Type::ArrayOf[::CheckoutIntents::Offer::Shipping::AvailableOption]
                 },
                 api_name: :availableOptions

        # @!attribute selected_option_id
        #
        #   @return [String, nil]
        optional :selected_option_id, String, api_name: :selectedOptionId

        # @!method initialize(available_options:, selected_option_id: nil)
        #   @param available_options [Array<::CheckoutIntents::Models::Offer::Shipping::AvailableOption>]
        #   @param selected_option_id [String]

        class AvailableOption < ::CheckoutIntents::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute cost
          #
          #   @return [::CheckoutIntents::Models::Money]
          required :cost, -> { ::CheckoutIntents::Money }

          # @!attribute delivery_estimate
          #   Estimated range of dates that items will be delivered in. At least one of
          #   `earliest` or `latest` are guaranteed to be set.
          #
          #   Interpretation:
          #
          #   - If both `earliest` and `latest` are set, then the delivery estimate is the
          #     range between the two dates.
          #   - If only `earliest` is set, then the delivery estimate is any date after that
          #     date.
          #   - If only `latest` is set, then the delivery estimate is any date before that
          #     date.
          #
          #   @return [::CheckoutIntents::Models::Offer::Shipping::AvailableOption::DeliveryEstimate, nil]
          optional :delivery_estimate,
                   -> { ::CheckoutIntents::Offer::Shipping::AvailableOption::DeliveryEstimate },
                   api_name: :deliveryEstimate,
                   nil?: true

          # @!attribute discount
          #
          #   @return [::CheckoutIntents::Models::Money, nil]
          optional :discount, -> { ::CheckoutIntents::Money }

          # @!method initialize(id:, cost:, delivery_estimate: nil, discount: nil)
          #   Some parameter documentations has been truncated, see
          #   {::CheckoutIntents::Models::Offer::Shipping::AvailableOption} for more details.
          #
          #   @param id [String]
          #
          #   @param cost [::CheckoutIntents::Models::Money]
          #
          #   @param delivery_estimate [::CheckoutIntents::Models::Offer::Shipping::AvailableOption::DeliveryEstimate, nil] Estimated range of dates that items will be delivered in. At least one of
          #
          #   @param discount [::CheckoutIntents::Models::Money]

          # @see ::CheckoutIntents::Models::Offer::Shipping::AvailableOption#delivery_estimate
          class DeliveryEstimate < ::CheckoutIntents::Internal::Type::BaseModel
            # @!attribute earliest
            #   Earliest date that items will be delivered by.
            #
            #   @return [Time, nil]
            optional :earliest, Time

            # @!attribute latest
            #   Latest date that items will be delivered by.
            #
            #   @return [Time, nil]
            optional :latest, Time

            # @!method initialize(earliest: nil, latest: nil)
            #   Estimated range of dates that items will be delivered in. At least one of
            #   `earliest` or `latest` are guaranteed to be set.
            #
            #   Interpretation:
            #
            #   - If both `earliest` and `latest` are set, then the delivery estimate is the
            #     range between the two dates.
            #   - If only `earliest` is set, then the delivery estimate is any date after that
            #     date.
            #   - If only `latest` is set, then the delivery estimate is any date before that
            #     date.
            #
            #   @param earliest [Time] Earliest date that items will be delivered by.
            #
            #   @param latest [Time] Latest date that items will be delivered by.
          end
        end
      end
    end
  end
end
