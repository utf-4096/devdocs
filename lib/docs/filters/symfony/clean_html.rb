module Docs
  class Symfony
    class CleanHtmlFilter < Filter
      def call
        @doc = at_css('#main-content')

        css('aside.sidebar-right').remove
        css('.admonition-screencast').remove
        css('.doc-sidebar-search').remove
        css('.doc-alternative-selector').remove
        css('.doc-index-highlights').remove
        css('.doc-index-extra-resources').remove
        css('.content>.d-md-flex.align-items-start.justify-content-between').remove
        css('#doc-mobile-shortcuts-bar').remove
        css('.codeblock-lines').remove
        css('.content-edit').remove

        doc
      end
    end
  end
end
