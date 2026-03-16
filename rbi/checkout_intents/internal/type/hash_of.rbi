# typed: strong

module CheckoutIntents
  module Internal
    module Type
      # @api private
      #
      # Hash of items of a given type.
      class HashOf
        include ::CheckoutIntents::Internal::Type::Converter
        include ::CheckoutIntents::Internal::Util::SorbetRuntimeSupport

        abstract!

        Elem = type_member(:out)

        sig do
          params(
            type_info:
              T.any(
                ::CheckoutIntents::Internal::AnyHash,
                T.proc.returns(
                  ::CheckoutIntents::Internal::Type::Converter::Input
                ),
                ::CheckoutIntents::Internal::Type::Converter::Input
              ),
            spec: ::CheckoutIntents::Internal::AnyHash
          ).returns(T.attached_class)
        end
        def self.[](type_info, spec = {})
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ===(other)
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ==(other)
        end

        sig { returns(Integer) }
        def hash
        end

        # @api private
        sig do
          override
            .params(
              value: T.any(T::Hash[T.anything, T.anything], T.anything),
              state: ::CheckoutIntents::Internal::Type::Converter::CoerceState
            )
            .returns(T.any(::CheckoutIntents::Internal::AnyHash, T.anything))
        end
        def coerce(value, state:)
        end

        # @api private
        sig do
          override
            .params(
              value: T.any(T::Hash[T.anything, T.anything], T.anything),
              state: ::CheckoutIntents::Internal::Type::Converter::DumpState
            )
            .returns(T.any(::CheckoutIntents::Internal::AnyHash, T.anything))
        end
        def dump(value, state:)
        end

        # @api private
        sig { returns(T.anything) }
        def to_sorbet_type
        end

        # @api private
        sig { returns(Elem) }
        protected def item_type
        end

        # @api private
        sig { returns(T::Boolean) }
        protected def nilable?
        end

        # @api private
        sig do
          params(
            type_info:
              T.any(
                ::CheckoutIntents::Internal::AnyHash,
                T.proc.returns(
                  ::CheckoutIntents::Internal::Type::Converter::Input
                ),
                ::CheckoutIntents::Internal::Type::Converter::Input
              ),
            spec: ::CheckoutIntents::Internal::AnyHash
          ).void
        end
        def initialize(type_info, spec = {})
        end

        # @api private
        sig { params(depth: Integer).returns(String) }
        def inspect(depth: 0)
        end
      end
    end
  end
end
