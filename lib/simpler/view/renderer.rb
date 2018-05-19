module Simpler
  class View
    class Renderer

      def initialize(env)
        @env = env
      end

      def render; end

      private

      def controller
        @env['simpler.controller']
      end

      def action
        @env['simpler.action']
      end

      def template
        @env['simpler.template']
      end

    end
  end
end
