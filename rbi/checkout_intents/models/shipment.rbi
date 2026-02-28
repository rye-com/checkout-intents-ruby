# typed: strong

module CheckoutIntents
  module Models
    module Shipment
      extend ::CheckoutIntents::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped,
            ::CheckoutIntents::Shipment::DeliveredShipment,
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed,
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery,
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered,
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled
          )
        end

      class WithStatusBaseShipmentWithTrackingShipped < ::CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :checkout_intent_id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :external_id

        sig { returns(Time) }
        attr_accessor :shipped_at

        sig do
          returns(
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(::CheckoutIntents::ShipmentTracking) }
        attr_reader :tracking

        sig { params(tracking: ::CheckoutIntents::ShipmentTracking::OrHash).void }
        attr_writer :tracking

        sig do
          returns(
            T::Array[
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent
            ]
          )
        end
        attr_accessor :tracking_events

        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            checkout_intent_id: String,
            created_at: Time,
            external_id: String,
            shipped_at: Time,
            status:
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status::OrSymbol,
            tracking: ::CheckoutIntents::ShipmentTracking::OrHash,
            tracking_events:
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::OrHash
              ],
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          checkout_intent_id:,
          created_at:,
          external_id:,
          shipped_at:,
          status:,
          tracking:,
          tracking_events:,
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              checkout_intent_id: String,
              created_at: Time,
              external_id: String,
              shipped_at: Time,
              status:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status::TaggedSymbol,
              tracking: ::CheckoutIntents::ShipmentTracking,
              tracking_events:
                T::Array[
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent
                ],
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Status
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SHIPPED =
            T.let(
              :shipped,
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TrackingEvent < ::CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent,
                ::CheckoutIntents::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_accessor :display_date

          sig { returns(T.nilable(String)) }
          attr_accessor :display_time

          sig do
            returns(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location
            )
          end
          attr_reader :location

          sig do
            params(
              location:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location::OrHash
            ).void
          end
          attr_writer :location

          sig do
            params(
              description: T.nilable(String),
              display_date: T.nilable(String),
              display_time: T.nilable(String),
              location:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location::OrHash
            ).returns(T.attached_class)
          end
          def self.new(description:, display_date:, display_time:, location:)
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                display_date: T.nilable(String),
                display_time: T.nilable(String),
                location:
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location
              }
            )
          end
          def to_hash
          end

          class Location < ::CheckoutIntents::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped::TrackingEvent::Location,
                  ::CheckoutIntents::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :city

            sig { returns(T.nilable(String)) }
            attr_accessor :country

            sig { returns(T.nilable(String)) }
            attr_accessor :province

            sig do
              params(
                city: T.nilable(String),
                country: T.nilable(String),
                province: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(city: nil, country: nil, province: nil)
            end

            sig do
              override.returns(
                {
                  city: T.nilable(String),
                  country: T.nilable(String),
                  province: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      class DeliveredShipment < ::CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::Shipment::DeliveredShipment,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :checkout_intent_id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(Time) }
        attr_accessor :delivered_at

        sig { returns(String) }
        attr_accessor :external_id

        sig { returns(Time) }
        attr_accessor :shipped_at

        sig do
          returns(
            ::CheckoutIntents::Shipment::DeliveredShipment::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(::CheckoutIntents::ShipmentTracking) }
        attr_reader :tracking

        sig { params(tracking: ::CheckoutIntents::ShipmentTracking::OrHash).void }
        attr_writer :tracking

        sig do
          returns(
            T::Array[
              ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent
            ]
          )
        end
        attr_accessor :tracking_events

        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            checkout_intent_id: String,
            created_at: Time,
            delivered_at: Time,
            external_id: String,
            shipped_at: Time,
            status:
              ::CheckoutIntents::Shipment::DeliveredShipment::Status::OrSymbol,
            tracking: ::CheckoutIntents::ShipmentTracking::OrHash,
            tracking_events:
              T::Array[
                ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::OrHash
              ],
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          checkout_intent_id:,
          created_at:,
          delivered_at:,
          external_id:,
          shipped_at:,
          status:,
          tracking:,
          tracking_events:,
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              checkout_intent_id: String,
              created_at: Time,
              delivered_at: Time,
              external_id: String,
              shipped_at: Time,
              status:
                ::CheckoutIntents::Shipment::DeliveredShipment::Status::TaggedSymbol,
              tracking: ::CheckoutIntents::ShipmentTracking,
              tracking_events:
                T::Array[
                  ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent
                ],
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Status
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::Shipment::DeliveredShipment::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DELIVERED =
            T.let(
              :delivered,
              ::CheckoutIntents::Shipment::DeliveredShipment::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::Shipment::DeliveredShipment::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TrackingEvent < ::CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent,
                ::CheckoutIntents::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_accessor :display_date

          sig { returns(T.nilable(String)) }
          attr_accessor :display_time

          sig do
            returns(
              ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::Location
            )
          end
          attr_reader :location

          sig do
            params(
              location:
                ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::Location::OrHash
            ).void
          end
          attr_writer :location

          sig do
            params(
              description: T.nilable(String),
              display_date: T.nilable(String),
              display_time: T.nilable(String),
              location:
                ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::Location::OrHash
            ).returns(T.attached_class)
          end
          def self.new(description:, display_date:, display_time:, location:)
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                display_date: T.nilable(String),
                display_time: T.nilable(String),
                location:
                  ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::Location
              }
            )
          end
          def to_hash
          end

          class Location < ::CheckoutIntents::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ::CheckoutIntents::Shipment::DeliveredShipment::TrackingEvent::Location,
                  ::CheckoutIntents::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :city

            sig { returns(T.nilable(String)) }
            attr_accessor :country

            sig { returns(T.nilable(String)) }
            attr_accessor :province

            sig do
              params(
                city: T.nilable(String),
                country: T.nilable(String),
                province: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(city: nil, country: nil, province: nil)
            end

            sig do
              override.returns(
                {
                  city: T.nilable(String),
                  country: T.nilable(String),
                  province: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      class WithStatusBaseShipmentWithTrackingDelayed < ::CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :checkout_intent_id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :external_id

        sig { returns(Time) }
        attr_accessor :shipped_at

        sig do
          returns(
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(::CheckoutIntents::ShipmentTracking) }
        attr_reader :tracking

        sig { params(tracking: ::CheckoutIntents::ShipmentTracking::OrHash).void }
        attr_writer :tracking

        sig do
          returns(
            T::Array[
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent
            ]
          )
        end
        attr_accessor :tracking_events

        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            checkout_intent_id: String,
            created_at: Time,
            external_id: String,
            shipped_at: Time,
            status:
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status::OrSymbol,
            tracking: ::CheckoutIntents::ShipmentTracking::OrHash,
            tracking_events:
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::OrHash
              ],
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          checkout_intent_id:,
          created_at:,
          external_id:,
          shipped_at:,
          status:,
          tracking:,
          tracking_events:,
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              checkout_intent_id: String,
              created_at: Time,
              external_id: String,
              shipped_at: Time,
              status:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status::TaggedSymbol,
              tracking: ::CheckoutIntents::ShipmentTracking,
              tracking_events:
                T::Array[
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent
                ],
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Status
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DELAYED =
            T.let(
              :delayed,
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TrackingEvent < ::CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent,
                ::CheckoutIntents::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_accessor :display_date

          sig { returns(T.nilable(String)) }
          attr_accessor :display_time

          sig do
            returns(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location
            )
          end
          attr_reader :location

          sig do
            params(
              location:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location::OrHash
            ).void
          end
          attr_writer :location

          sig do
            params(
              description: T.nilable(String),
              display_date: T.nilable(String),
              display_time: T.nilable(String),
              location:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location::OrHash
            ).returns(T.attached_class)
          end
          def self.new(description:, display_date:, display_time:, location:)
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                display_date: T.nilable(String),
                display_time: T.nilable(String),
                location:
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location
              }
            )
          end
          def to_hash
          end

          class Location < ::CheckoutIntents::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed::TrackingEvent::Location,
                  ::CheckoutIntents::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :city

            sig { returns(T.nilable(String)) }
            attr_accessor :country

            sig { returns(T.nilable(String)) }
            attr_accessor :province

            sig do
              params(
                city: T.nilable(String),
                country: T.nilable(String),
                province: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(city: nil, country: nil, province: nil)
            end

            sig do
              override.returns(
                {
                  city: T.nilable(String),
                  country: T.nilable(String),
                  province: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      class WithStatusBaseShipmentWithTrackingOutForDelivery < ::CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :checkout_intent_id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :external_id

        sig { returns(Time) }
        attr_accessor :shipped_at

        sig do
          returns(
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(::CheckoutIntents::ShipmentTracking) }
        attr_reader :tracking

        sig { params(tracking: ::CheckoutIntents::ShipmentTracking::OrHash).void }
        attr_writer :tracking

        sig do
          returns(
            T::Array[
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent
            ]
          )
        end
        attr_accessor :tracking_events

        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            checkout_intent_id: String,
            created_at: Time,
            external_id: String,
            shipped_at: Time,
            status:
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status::OrSymbol,
            tracking: ::CheckoutIntents::ShipmentTracking::OrHash,
            tracking_events:
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::OrHash
              ],
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          checkout_intent_id:,
          created_at:,
          external_id:,
          shipped_at:,
          status:,
          tracking:,
          tracking_events:,
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              checkout_intent_id: String,
              created_at: Time,
              external_id: String,
              shipped_at: Time,
              status:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status::TaggedSymbol,
              tracking: ::CheckoutIntents::ShipmentTracking,
              tracking_events:
                T::Array[
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent
                ],
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Status
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OUT_FOR_DELIVERY =
            T.let(
              :out_for_delivery,
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TrackingEvent < ::CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent,
                ::CheckoutIntents::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_accessor :display_date

          sig { returns(T.nilable(String)) }
          attr_accessor :display_time

          sig do
            returns(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location
            )
          end
          attr_reader :location

          sig do
            params(
              location:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location::OrHash
            ).void
          end
          attr_writer :location

          sig do
            params(
              description: T.nilable(String),
              display_date: T.nilable(String),
              display_time: T.nilable(String),
              location:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location::OrHash
            ).returns(T.attached_class)
          end
          def self.new(description:, display_date:, display_time:, location:)
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                display_date: T.nilable(String),
                display_time: T.nilable(String),
                location:
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location
              }
            )
          end
          def to_hash
          end

          class Location < ::CheckoutIntents::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ::CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery::TrackingEvent::Location,
                  ::CheckoutIntents::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :city

            sig { returns(T.nilable(String)) }
            attr_accessor :country

            sig { returns(T.nilable(String)) }
            attr_accessor :province

            sig do
              params(
                city: T.nilable(String),
                country: T.nilable(String),
                province: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(city: nil, country: nil, province: nil)
            end

            sig do
              override.returns(
                {
                  city: T.nilable(String),
                  country: T.nilable(String),
                  province: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      class WithStatusBaseShipmentOrdered < ::CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :checkout_intent_id

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            checkout_intent_id: String,
            created_at: Time,
            status:
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered::Status::OrSymbol,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          checkout_intent_id:,
          created_at:,
          status:,
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              checkout_intent_id: String,
              created_at: Time,
              status:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered::Status::TaggedSymbol,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Status
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ORDERED =
            T.let(
              :ordered,
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class WithStatusBaseShipmentCanceled < ::CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :checkout_intent_id

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(
            ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            checkout_intent_id: String,
            created_at: Time,
            status:
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled::Status::OrSymbol,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          checkout_intent_id:,
          created_at:,
          status:,
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              checkout_intent_id: String,
              created_at: Time,
              status:
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled::Status::TaggedSymbol,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Status
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CANCELED =
            T.let(
              :canceled,
              ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[::CheckoutIntents::Shipment::Variants]) }
      def self.variants
      end
    end
  end
end
