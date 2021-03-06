require 'spec_helper'

RSpec.describe OpenComponents do
  describe '.configure' do
    context 'with a custom registry' do
      it 'sets the custom registry host within the configuration' do
        described_class.configure { |c| c.registry = 'http://foo.bar' }
        expect(described_class.config.registry).to eq('http://foo.bar')
      end
    end

    context 'without a custom registry' do
      it 'sets the default registry host' do
        described_class.configure { |_| } # No-op
        expect(described_class.config.registry).to eq('http://localhost:3030')
      end
    end

    context 'with a custom timeout' do
      it 'sets the custom timeout within the configuration' do
        described_class.configure { |c| c.timeout = 10 }
        expect(described_class.config.timeout).to eq 10
      end
    end

    context 'without a custom timeout' do
      it 'sets the default timeout' do
        described_class.configure { |_| } #No-op
        expect(described_class.config.timeout).to eq 5
      end
    end
  end
end
