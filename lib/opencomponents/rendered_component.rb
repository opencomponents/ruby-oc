module OpenComponents
  class RenderedComponent < Component
    attr_reader :html

    def load
      @html = response_data['html']

      super
    end

    private

    def accept_header
      nil
    end
  end
end
