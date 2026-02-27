# frozen_string_literal: true

module CheckoutIntents
  [
    ::CheckoutIntents::Internal::Type::BaseModel,
    *::CheckoutIntents::Internal::Type::BaseModel.subclasses
  ].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, ::CheckoutIntents::Internal::AnyHash) } }
  end

  ::CheckoutIntents::Internal::Util.walk_namespaces(::CheckoutIntents::Models).each do |mod|
    case mod
    in ::CheckoutIntents::Internal::Type::Enum | ::CheckoutIntents::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  ::CheckoutIntents::Internal::Util.walk_namespaces(::CheckoutIntents::Models)
                                   .lazy
                                   .grep(::CheckoutIntents::Internal::Type::Union)
                                   .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  BaseCheckoutIntent = ::CheckoutIntents::Models::BaseCheckoutIntent

  Betas = ::CheckoutIntents::Models::Betas

  BillingGetBalanceParams = CheckoutIntents::Models::BillingGetBalanceParams

  BillingListTransactionsParams = CheckoutIntents::Models::BillingListTransactionsParams

  BillingGetBalanceParams = ::CheckoutIntents::Models::BillingGetBalanceParams

  BillingListTransactionsParams = ::CheckoutIntents::Models::BillingListTransactionsParams

  BrandRetrieveParams = ::CheckoutIntents::Models::BrandRetrieveParams

  Buyer = ::CheckoutIntents::Models::Buyer

  CheckoutIntent = ::CheckoutIntents::Models::CheckoutIntent

  CheckoutIntentAddPaymentParams = ::CheckoutIntents::Models::CheckoutIntentAddPaymentParams

  CheckoutIntentConfirmParams = ::CheckoutIntents::Models::CheckoutIntentConfirmParams

  CheckoutIntentCreateParams = ::CheckoutIntents::Models::CheckoutIntentCreateParams

  CheckoutIntentListParams = ::CheckoutIntents::Models::CheckoutIntentListParams

  CheckoutIntentPurchaseParams = ::CheckoutIntents::Models::CheckoutIntentPurchaseParams

  CheckoutIntentRetrieveParams = ::CheckoutIntents::Models::CheckoutIntentRetrieveParams

  CheckoutSession = ::CheckoutIntents::Models::CheckoutSession

  Money = ::CheckoutIntents::Models::Money

  Offer = ::CheckoutIntents::Models::Offer

  PaymentMethod = ::CheckoutIntents::Models::PaymentMethod

  Product = ::CheckoutIntents::Models::Product

  ProductAvailability = ::CheckoutIntents::Models::ProductAvailability

  ProductImage = ::CheckoutIntents::Models::ProductImage

  ProductLookupParams = ::CheckoutIntents::Models::ProductLookupParams

  VariantSelection = ::CheckoutIntents::Models::VariantSelection
end
