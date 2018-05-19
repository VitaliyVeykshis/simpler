module Simpler
  class View
    class JsonRenderer < Renderer

      def render(*)
        template[:json].to_json
      end

    end
  end
end
