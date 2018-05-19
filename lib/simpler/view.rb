require 'erb'
require_relative 'view/renderer'
require_relative 'view/html_renderer'
require_relative 'view/json_renderer'
require_relative 'view/plain_renderer'

module Simpler
  class View

    RENDERERS = {
      json: JsonRenderer,
      plain: PlainRenderer,
      html: HtmlRenderer
    }.freeze

    HEADERS = {
      json: 'application/json',
      plain: 'text/plain',
      html: 'text/html'
    }.freeze

    def self.get_renderer(template)

      if template.is_a?(Hash)
        RENDERERS[template.keys.first]
      else
        RENDERERS[:html]
      end
    end

    def self.get_header(template)
      if template.is_a?(Hash)
        HEADERS[template.keys.first]
      else
        HEADERS[:html]
      end
    end

  end
end
