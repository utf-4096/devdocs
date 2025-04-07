module Docs
  class Symfony < UrlScraper
    self.type = 'simple'
    self.release = '7.2'
    self.base_url = "https://symfony.com/doc/current/"
    self.root_path = 'index.html'
    self.links = {
      home: 'https://symfony.com/',
      code: 'https://github.com/symfony/symfony'
    }

    html_filters.push 'symfony/entries', 'symfony/clean_html'

	# options[:container] = '#main-content'
    options[:attribution] = <<-HTML
      &copy; 2004&ndash;2025 Fabien Potencier<br>
      Licensed under the MIT License.
    HTML

    def get_latest_version(opts)
      get_latest_github_release('symfony', 'symfony', opts)
    end
  end
end
