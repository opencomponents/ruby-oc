module OpenComponents
  class PrerenderedComponent < Component
    attr_accessor :data, :template

    def load
      template_data = response_data['template']

      @data     = response_data['data']
      @template = Template.new(
        template_data['src'], template_data['type'], template_data['key']
      )

      super
    end

    private

    def accept_header
      'application/vnd.oc.prerendered+json'
    end
  end
end
