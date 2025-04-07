module Docs
  class Symfony
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        at_css('h1').text.strip
      end

      def get_type
        crumbs = []

        css('.breadcrumb-item a').each_with_index do |node, index|
          next if index < 2
          crumbs << node.text.strip
        end

        if crumbs.length == 0
          'Symfony'
        else
          crumbs.join '/'
        end
      end

      def additional_entries
        css('.list-of-contents').each_with_object [] do |node, entries|
          type = node.at_css('h2').text

          node.css('li a').each do |n|
            entries << [n.text.strip, n['id'], node.text.strip]
          end
        end
      end
    end
  end
end
