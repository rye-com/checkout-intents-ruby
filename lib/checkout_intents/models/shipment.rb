# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Shipments#retrieve
    module Shipment
      extend CheckoutIntents::Internal::Type::Union

      variant -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped }

      variant -> { CheckoutIntents::Shipment::DeliveredShipment }

      variant -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed }

      variant -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery }

      variant -> { CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered }

      variant -> { CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled }

      class WithStatusBaseShipmentWithTrackingShipped < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checkout_intent_id
        #
        #   @return [String]
        required :checkout_intent_id, String, api_name: :checkoutIntentId

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute external_id
        #   The external ID is provided by the marketplace and matches the shipment to their
        #   system.
        #
        #   @return [String]
        required :external_id, String, api_name: :externalId

        # @!attribute shipped_at
        #
        #   @return [Time]
        required :shipped_at, Time, api_name: :shippedAt

        # @!attribute status
        #
        #   @return [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status]
        required :status,
                 enum: -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status }

        # @!attribute tracking
        #
        #   @return [CheckoutIntents::Models::ShipmentTracking]
        required :tracking, -> { CheckoutIntents::ShipmentTracking }

        # @!attribute tracking_events
        #
        #   @return [Array<CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent>]
        required :tracking_events,
                 -> {
                   CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent]
                 },
                 api_name: :trackingEvents

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, checkout_intent_id:, created_at:, external_id:, shipped_at:, status:, tracking:, tracking_events:, updated_at:)
        #   Some parameter documentations has been truncated, see
        #   {CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped}
        #   for more details.
        #
        #   @param id [String]
        #
        #   @param checkout_intent_id [String]
        #
        #   @param created_at [Time]
        #
        #   @param external_id [String] The external ID is provided by the marketplace and matches the shipment to their
        #
        #   @param shipped_at [Time]
        #
        #   @param status [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status]
        #
        #   @param tracking [CheckoutIntents::Models::ShipmentTracking]
        #
        #   @param tracking_events [Array<CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent>]
        #
        #   @param updated_at [Time]

        # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped#status
        module Status
          extend CheckoutIntents::Internal::Type::Enum

          SHIPPED = :shipped

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class TrackingEvent < CheckoutIntents::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute location
          #
          #   @return [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location]
          required :location,
                   -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location }

          # @!attribute timestamp
          #
          #   @return [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Timestamp, nil]
          required :timestamp,
                   -> {
                     CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Timestamp
                   },
                   nil?: true

          # @!method initialize(description:, location:, timestamp:)
          #   @param description [String, nil]
          #   @param location [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location]
          #   @param timestamp [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Timestamp, nil]

          # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent#location
          class Location < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute city
            #
            #   @return [String, nil]
            optional :city, String, nil?: true

            # @!attribute country
            #
            #   @return [String, nil]
            optional :country, String, nil?: true

            # @!attribute province
            #
            #   @return [String, nil]
            optional :province, String, nil?: true

            # @!method initialize(city: nil, country: nil, province: nil)
            #   @param city [String, nil]
            #   @param country [String, nil]
            #   @param province [String, nil]
          end

          # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent#timestamp
          class Timestamp < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute local
            #   ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @return [String]
            required :local, String

            # @!attribute utc
            #   UTC timestamp
            #
            #   @return [Time]
            required :utc, Time

            # @!method initialize(local:, utc:)
            #   @param local [String] ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @param utc [Time] UTC timestamp
          end
        end
      end

      class DeliveredShipment < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checkout_intent_id
        #
        #   @return [String]
        required :checkout_intent_id, String, api_name: :checkoutIntentId

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute delivered_at
        #
        #   @return [Time]
        required :delivered_at, Time, api_name: :deliveredAt

        # @!attribute external_id
        #   The external ID is provided by the marketplace and matches the shipment to their
        #   system.
        #
        #   @return [String]
        required :external_id, String, api_name: :externalId

        # @!attribute shipped_at
        #
        #   @return [Time]
        required :shipped_at, Time, api_name: :shippedAt

        # @!attribute status
        #
        #   @return [Symbol, CheckoutIntents::Models::Shipment::DeliveredShipment::Status]
        required :status, enum: -> { CheckoutIntents::Shipment::DeliveredShipment::Status }

        # @!attribute tracking
        #
        #   @return [CheckoutIntents::Models::ShipmentTracking]
        required :tracking, -> { CheckoutIntents::ShipmentTracking }

        # @!attribute tracking_events
        #
        #   @return [Array<CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent>]
        required :tracking_events,
                 -> {
                   CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent]
                 },
                 api_name: :trackingEvents

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, checkout_intent_id:, created_at:, delivered_at:, external_id:, shipped_at:, status:, tracking:, tracking_events:, updated_at:)
        #   Some parameter documentations has been truncated, see
        #   {CheckoutIntents::Models::Shipment::DeliveredShipment} for more details.
        #
        #   @param id [String]
        #
        #   @param checkout_intent_id [String]
        #
        #   @param created_at [Time]
        #
        #   @param delivered_at [Time]
        #
        #   @param external_id [String] The external ID is provided by the marketplace and matches the shipment to their
        #
        #   @param shipped_at [Time]
        #
        #   @param status [Symbol, CheckoutIntents::Models::Shipment::DeliveredShipment::Status]
        #
        #   @param tracking [CheckoutIntents::Models::ShipmentTracking]
        #
        #   @param tracking_events [Array<CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent>]
        #
        #   @param updated_at [Time]

        # @see CheckoutIntents::Models::Shipment::DeliveredShipment#status
        module Status
          extend CheckoutIntents::Internal::Type::Enum

          DELIVERED = :delivered

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class TrackingEvent < CheckoutIntents::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute location
          #
          #   @return [CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent::Location]
          required :location, -> { CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::Location }

          # @!attribute timestamp
          #
          #   @return [CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent::Timestamp, nil]
          required :timestamp,
                   -> { CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::Timestamp },
                   nil?: true

          # @!method initialize(description:, location:, timestamp:)
          #   @param description [String, nil]
          #   @param location [CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent::Location]
          #   @param timestamp [CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent::Timestamp, nil]

          # @see CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent#location
          class Location < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute city
            #
            #   @return [String, nil]
            optional :city, String, nil?: true

            # @!attribute country
            #
            #   @return [String, nil]
            optional :country, String, nil?: true

            # @!attribute province
            #
            #   @return [String, nil]
            optional :province, String, nil?: true

            # @!method initialize(city: nil, country: nil, province: nil)
            #   @param city [String, nil]
            #   @param country [String, nil]
            #   @param province [String, nil]
          end

          # @see CheckoutIntents::Models::Shipment::DeliveredShipment::TrackingEvent#timestamp
          class Timestamp < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute local
            #   ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @return [String]
            required :local, String

            # @!attribute utc
            #   UTC timestamp
            #
            #   @return [Time]
            required :utc, Time

            # @!method initialize(local:, utc:)
            #   @param local [String] ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @param utc [Time] UTC timestamp
          end
        end
      end

      class WithStatusBaseShipmentWithTrackingDelayed < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checkout_intent_id
        #
        #   @return [String]
        required :checkout_intent_id, String, api_name: :checkoutIntentId

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute external_id
        #   The external ID is provided by the marketplace and matches the shipment to their
        #   system.
        #
        #   @return [String]
        required :external_id, String, api_name: :externalId

        # @!attribute shipped_at
        #
        #   @return [Time]
        required :shipped_at, Time, api_name: :shippedAt

        # @!attribute status
        #
        #   @return [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status]
        required :status,
                 enum: -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status }

        # @!attribute tracking
        #
        #   @return [CheckoutIntents::Models::ShipmentTracking]
        required :tracking, -> { CheckoutIntents::ShipmentTracking }

        # @!attribute tracking_events
        #
        #   @return [Array<CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent>]
        required :tracking_events,
                 -> {
                   CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent]
                 },
                 api_name: :trackingEvents

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, checkout_intent_id:, created_at:, external_id:, shipped_at:, status:, tracking:, tracking_events:, updated_at:)
        #   Some parameter documentations has been truncated, see
        #   {CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed}
        #   for more details.
        #
        #   @param id [String]
        #
        #   @param checkout_intent_id [String]
        #
        #   @param created_at [Time]
        #
        #   @param external_id [String] The external ID is provided by the marketplace and matches the shipment to their
        #
        #   @param shipped_at [Time]
        #
        #   @param status [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status]
        #
        #   @param tracking [CheckoutIntents::Models::ShipmentTracking]
        #
        #   @param tracking_events [Array<CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent>]
        #
        #   @param updated_at [Time]

        # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed#status
        module Status
          extend CheckoutIntents::Internal::Type::Enum

          DELAYED = :delayed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class TrackingEvent < CheckoutIntents::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute location
          #
          #   @return [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location]
          required :location,
                   -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location }

          # @!attribute timestamp
          #
          #   @return [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Timestamp, nil]
          required :timestamp,
                   -> {
                     CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Timestamp
                   },
                   nil?: true

          # @!method initialize(description:, location:, timestamp:)
          #   @param description [String, nil]
          #   @param location [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location]
          #   @param timestamp [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Timestamp, nil]

          # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent#location
          class Location < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute city
            #
            #   @return [String, nil]
            optional :city, String, nil?: true

            # @!attribute country
            #
            #   @return [String, nil]
            optional :country, String, nil?: true

            # @!attribute province
            #
            #   @return [String, nil]
            optional :province, String, nil?: true

            # @!method initialize(city: nil, country: nil, province: nil)
            #   @param city [String, nil]
            #   @param country [String, nil]
            #   @param province [String, nil]
          end

          # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent#timestamp
          class Timestamp < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute local
            #   ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @return [String]
            required :local, String

            # @!attribute utc
            #   UTC timestamp
            #
            #   @return [Time]
            required :utc, Time

            # @!method initialize(local:, utc:)
            #   @param local [String] ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @param utc [Time] UTC timestamp
          end
        end
      end

      class WithStatusBaseShipmentWithTrackingOutForDelivery < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checkout_intent_id
        #
        #   @return [String]
        required :checkout_intent_id, String, api_name: :checkoutIntentId

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute external_id
        #   The external ID is provided by the marketplace and matches the shipment to their
        #   system.
        #
        #   @return [String]
        required :external_id, String, api_name: :externalId

        # @!attribute shipped_at
        #
        #   @return [Time]
        required :shipped_at, Time, api_name: :shippedAt

        # @!attribute status
        #
        #   @return [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status]
        required :status,
                 enum: -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status }

        # @!attribute tracking
        #
        #   @return [CheckoutIntents::Models::ShipmentTracking]
        required :tracking, -> { CheckoutIntents::ShipmentTracking }

        # @!attribute tracking_events
        #
        #   @return [Array<CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent>]
        required :tracking_events,
                 -> {
                   CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent]
                 },
                 api_name: :trackingEvents

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, checkout_intent_id:, created_at:, external_id:, shipped_at:, status:, tracking:, tracking_events:, updated_at:)
        #   Some parameter documentations has been truncated, see
        #   {CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery}
        #   for more details.
        #
        #   @param id [String]
        #
        #   @param checkout_intent_id [String]
        #
        #   @param created_at [Time]
        #
        #   @param external_id [String] The external ID is provided by the marketplace and matches the shipment to their
        #
        #   @param shipped_at [Time]
        #
        #   @param status [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status]
        #
        #   @param tracking [CheckoutIntents::Models::ShipmentTracking]
        #
        #   @param tracking_events [Array<CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent>]
        #
        #   @param updated_at [Time]

        # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery#status
        module Status
          extend CheckoutIntents::Internal::Type::Enum

          OUT_FOR_DELIVERY = :out_for_delivery

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class TrackingEvent < CheckoutIntents::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute location
          #
          #   @return [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location]
          required :location,
                   -> { CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location }

          # @!attribute timestamp
          #
          #   @return [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Timestamp, nil]
          required :timestamp,
                   -> {
                     CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Timestamp
                   },
                   nil?: true

          # @!method initialize(description:, location:, timestamp:)
          #   @param description [String, nil]
          #   @param location [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location]
          #   @param timestamp [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Timestamp, nil]

          # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent#location
          class Location < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute city
            #
            #   @return [String, nil]
            optional :city, String, nil?: true

            # @!attribute country
            #
            #   @return [String, nil]
            optional :country, String, nil?: true

            # @!attribute province
            #
            #   @return [String, nil]
            optional :province, String, nil?: true

            # @!method initialize(city: nil, country: nil, province: nil)
            #   @param city [String, nil]
            #   @param country [String, nil]
            #   @param province [String, nil]
          end

          # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent#timestamp
          class Timestamp < CheckoutIntents::Internal::Type::BaseModel
            # @!attribute local
            #   ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @return [String]
            required :local, String

            # @!attribute utc
            #   UTC timestamp
            #
            #   @return [Time]
            required :utc, Time

            # @!method initialize(local:, utc:)
            #   @param local [String] ISO 8601 string with timezone offset, e.g. "2025-02-05T17:02:00.000-05:00"
            #
            #   @param utc [Time] UTC timestamp
          end
        end
      end

      class WithStatusBaseShipmentOrdered < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checkout_intent_id
        #
        #   @return [String]
        required :checkout_intent_id, String, api_name: :checkoutIntentId

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute status
        #
        #   @return [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentOrdered::Status]
        required :status, enum: -> { CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered::Status }

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, checkout_intent_id:, created_at:, status:, updated_at:)
        #   @param id [String]
        #   @param checkout_intent_id [String]
        #   @param created_at [Time]
        #   @param status [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentOrdered::Status]
        #   @param updated_at [Time]

        # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentOrdered#status
        module Status
          extend CheckoutIntents::Internal::Type::Enum

          ORDERED = :ordered

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class WithStatusBaseShipmentCanceled < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checkout_intent_id
        #
        #   @return [String]
        required :checkout_intent_id, String, api_name: :checkoutIntentId

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute status
        #
        #   @return [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentCanceled::Status]
        required :status, enum: -> { CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled::Status }

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, checkout_intent_id:, created_at:, status:, updated_at:)
        #   @param id [String]
        #   @param checkout_intent_id [String]
        #   @param created_at [Time]
        #   @param status [Symbol, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentCanceled::Status]
        #   @param updated_at [Time]

        # @see CheckoutIntents::Models::Shipment::WithStatusBaseShipmentCanceled#status
        module Status
          extend CheckoutIntents::Internal::Type::Enum

          CANCELED = :canceled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped, CheckoutIntents::Models::Shipment::DeliveredShipment, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentOrdered, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentCanceled)]
    end
  end
end
