# frozen_string_literal: true

require_relative "../../test_helper"

class CheckoutIntents::Test::Resources::CheckoutIntents::ShipmentsTest < CheckoutIntents::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @checkout_intents.checkout_intents.shipments.list("id")

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
