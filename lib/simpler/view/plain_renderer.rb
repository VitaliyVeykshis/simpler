module Simpler
  class View
    class PlainRenderer < Renderer

      def render(*)
        template[:plain]
      end

    end
  end
end
