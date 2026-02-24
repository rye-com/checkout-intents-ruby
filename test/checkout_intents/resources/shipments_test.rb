# frozen_string_literal: true

require_relative "../test_helper"

class CheckoutIntents::Test::Resources::ShipmentsTest < CheckoutIntents::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @checkout_intents.shipments.retrieve("id")

    assert_pattern do
      response => CheckoutIntents::Shipment
    end

    assert_pattern do
      case response
      in CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped
      in CheckoutIntents::Shipment::DeliveredShipment
      in CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed
      in CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery
      in CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered
      in CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled
      end
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @checkout_intents.shipments.list

    assert_pattern do
      response => CheckoutIntents::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => CheckoutIntents::Shipment
    end

    assert_pattern do
      case row
      in CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingShipped
      in CheckoutIntents::Shipment::DeliveredShipment
      in CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingDelayed
      in CheckoutIntents::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery
      in CheckoutIntents::Shipment::WithStatusBaseShipmentOrdered
      in CheckoutIntents::Shipment::WithStatusBaseShipmentCanceled
      end
    end
  end
end
