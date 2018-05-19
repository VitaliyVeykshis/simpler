require 'json'
require_relative 'view'

module Simpler
  class Controller

    attr_reader :name, :request, :response

    def initialize(env)
      @name = extract_name
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
    end

    def make_response(action)
      @request.env['simpler.controller'] = self
      @request.env['simpler.action'] = action

      send(action)
      write_response

      @response.finish
    end

    private

    def extract_name
      self.class.name.match('(?<name>.+)Controller')[:name].downcase
    end

    def write_response
      body = render_body

      @response.write(body)
    end

    def render_body
      template = @request.env['simpler.template']
      renderer = View.get_renderer(template)
      @response['Content-Type'] = View.get_header(template)

      renderer.new(@request.env).render(binding)
    end

    def params
      @request.env['simpler.params'].update(@request.params)
    end

    def render(template)
      @request.env['simpler.template'] = template
    end

    def status(code)
      @response.status = code
    end

    def header
      @response
    end

  end
end
