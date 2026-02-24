# typed: strong

module CheckoutIntents
  module Internal
    class CursorPagination
      include ::CheckoutIntents::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :data

      sig { returns(PageInfo) }
      attr_accessor :page_info

      # @api private
      sig { returns(String) }
      def inspect
      end

      class PageInfo < ::CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(PageInfo, ::CheckoutIntents::Internal::AnyHash) }

        sig { returns(T.nilable(String)) }
        attr_accessor :end_cursor

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_next_page

        sig { params(has_next_page: T::Boolean).void }
        attr_writer :has_next_page

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_previous_page

        sig { params(has_previous_page: T::Boolean).void }
        attr_writer :has_previous_page

        sig { returns(T.nilable(String)) }
        attr_accessor :start_cursor

        sig do
          params(
            end_cursor: T.nilable(String),
            has_next_page: T::Boolean,
            has_previous_page: T::Boolean,
            start_cursor: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          end_cursor: nil,
          has_next_page: nil,
          has_previous_page: nil,
          start_cursor: nil
        )
        end

        sig do
          override.returns(
            {
              end_cursor: T.nilable(String),
              has_next_page: T::Boolean,
              has_previous_page: T::Boolean,
              start_cursor: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
