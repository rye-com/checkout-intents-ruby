# frozen_string_literal: true

module CheckoutIntents
  module Internal
    # @generic Elem
    #
    # @example
    #   if cursor_pagination.has_next?
    #     cursor_pagination = cursor_pagination.next_page
    #   end
    #
    # @example
    #   cursor_pagination.auto_paging_each do |checkout_intent|
    #     puts(checkout_intent)
    #   end
    class CursorPagination
      include ::CheckoutIntents::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :data

      # @return [PageInfo]
      attr_accessor :page_info

      # @return [Boolean]
      def next_page?
        !data.to_a.empty? && (!page_info&.start_cursor.to_s.empty? || !page_info&.end_cursor.to_s.empty?)
      end

      # @raise [::CheckoutIntents::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = ::CheckoutIntents::Internal::Util.deep_merge(
          @req,
          {query: page_info&.start_cursor.nil? ? {after: page_info&.end_cursor} : {before: page_info&.start_cursor}}
        )
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.data&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [::CheckoutIntents::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {data: Array => data}
          @data = data.map { ::CheckoutIntents::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        case page_data
        in {pageInfo: Hash | nil => page_info}
          @page_info =
            ::CheckoutIntents::Internal::Type::Converter.coerce(
              ::CheckoutIntents::Internal::CursorPagination::PageInfo,
              page_info
            )
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = ::CheckoutIntents::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)}>"
      end

      class PageInfo < ::CheckoutIntents::Internal::Type::BaseModel
        # @!attribute end_cursor
        #
        #   @return [String, nil]
        optional :end_cursor, String, api_name: :endCursor, nil?: true

        # @!attribute has_next_page
        #
        #   @return [Boolean, nil]
        optional :has_next_page, ::CheckoutIntents::Internal::Type::Boolean, api_name: :hasNextPage

        # @!attribute has_previous_page
        #
        #   @return [Boolean, nil]
        optional :has_previous_page, ::CheckoutIntents::Internal::Type::Boolean, api_name: :hasPreviousPage

        # @!attribute start_cursor
        #
        #   @return [String, nil]
        optional :start_cursor, String, api_name: :startCursor, nil?: true

        # @!method initialize(end_cursor: nil, has_next_page: nil, has_previous_page: nil, start_cursor: nil)
        #   @param end_cursor [String, nil]
        #   @param has_next_page [Boolean]
        #   @param has_previous_page [Boolean]
        #   @param start_cursor [String, nil]
      end
    end
  end
end
