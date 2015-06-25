require 'spec_helper'

RSpec.describe OpenComponents::PrerenderedComponent do
  describe '#load' do
    context 'for the latest component version' do
      context 'with request params' do
        before do
          stub_request(:get, "http://localhost:3030/foobar/").
            with(
              headers: {'Accept'=>'application/vnd.oc.prerendered+json', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'},
              query: {name: 'foobar'}
            ).
            to_return(status: 200, body: '{"href":"http://localhost:3030/foobar?name=foobar","type":"oc-component-local","version":"1.0.0","requestVersion":"","data":{"name":"foobar"},"template":{"src":"http://localhost:3030/foobar/1.0.0/static/template.js","type":"jade","key":"0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea"},"renderMode":"pre-rendered"}', headers: {})
        end

        subject { described_class.new('foobar', {name: 'foobar'}).load }

        it 'sets the component href' do
          expect(subject.href).to eq('http://localhost:3030/foobar?name=foobar')
        end

        it 'sets the component version' do
          expect(subject.version).to eq('1.0.0')
        end

        it 'sets the component request version' do
          expect(subject.request_version).to be nil
        end

        it 'sets the component type' do
          expect(subject.type).to eq 'oc-component-local'
        end

        it 'sets the component render mode' do
          expect(subject.render_mode).to eq 'pre-rendered'
        end

        it 'sets the component data' do
          expect(subject.data).to eq({'name' => 'foobar'})
        end

        it 'sets the component template' do
          expect(subject.template).to eq OpenComponents::Template.new(
            'http://localhost:3030/foobar/1.0.0/static/template.js',
            'jade',
            '0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea'
          )
        end
      end

      context 'without request params' do
        before do
          stub_request(:get, "http://localhost:3030/foobar/").
            with(
              headers: {'Accept'=>'application/vnd.oc.prerendered+json', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
            to_return(status: 200, body: '{"href":"http://localhost:3030/foobar","type":"oc-component-local","version":"1.0.0","requestVersion":"","data":{"name":"Todd"},"template":{"src":"http://localhost:3030/foobar/1.0.0/static/template.js","type":"jade","key":"0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea"},"renderMode":"pre-rendered"}', headers: {})
        end

        subject { described_class.new('foobar').load }

        it 'sets the component href' do
          expect(subject.href).to eq('http://localhost:3030/foobar')
        end

        it 'sets the component version' do
          expect(subject.version).to eq('1.0.0')
        end

        it 'sets the component request version' do
          expect(subject.request_version).to be nil
        end

        it 'sets the component type' do
          expect(subject.type).to eq 'oc-component-local'
        end

        it 'sets the component render mode' do
          expect(subject.render_mode).to eq 'pre-rendered'
        end

        it 'sets the component data' do
          expect(subject.data).to eq({'name' => 'Todd'})
        end

        it 'sets the component template' do
          expect(subject.template).to eq OpenComponents::Template.new(
            'http://localhost:3030/foobar/1.0.0/static/template.js',
            'jade',
            '0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea'
          )
        end
      end
    end

    context 'for a specific component version' do
      context 'with request params' do
        before do
          stub_request(:get, "http://localhost:3030/foobar/1.0.0").
            with(
              headers: {'Accept'=>'application/vnd.oc.prerendered+json', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'},
              query: {name: 'foobar'}
            ).
            to_return(status: 200, body: '{"href":"http://localhost:3030/foobar/1.0.0?name=foobar","type":"oc-component-local","version":"1.0.0","requestVersion":"1.0.0","data":{"name":"foobar"},"template":{"src":"http://localhost:3030/foobar/1.0.0/static/template.js","type":"jade","key":"0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea"},"renderMode":"pre-rendered"}', headers: {})
        end

        subject { described_class.new('foobar', {name: 'foobar'}, '1.0.0').load }

        it 'sets the component href' do
          expect(subject.href).to eq('http://localhost:3030/foobar/1.0.0?name=foobar')
        end

        it 'sets the component version' do
          expect(subject.version).to eq('1.0.0')
        end

        it 'sets the component request version' do
          expect(subject.request_version).to eq '1.0.0'
        end

        it 'sets the component type' do
          expect(subject.type).to eq 'oc-component-local'
        end

        it 'sets the component render mode' do
          expect(subject.render_mode).to eq 'pre-rendered'
        end

        it 'sets the component data' do
          expect(subject.data).to eq({'name' => 'foobar'})
        end

        it 'sets the component template' do
          expect(subject.template).to eq OpenComponents::Template.new(
            'http://localhost:3030/foobar/1.0.0/static/template.js',
            'jade',
            '0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea'
          )
        end
      end

      context 'without request params' do
        before do
          stub_request(:get, "http://localhost:3030/foobar/1.0.0").
            with(
              headers: {'Accept'=>'application/vnd.oc.prerendered+json', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
            to_return(status: 200, body: '{"href":"http://localhost:3030/foobar/1.0.0","type":"oc-component-local","version":"1.0.0","requestVersion":"1.0.0","data":{"name":"Todd"},"template":{"src":"http://localhost:3030/foobar/1.0.0/static/template.js","type":"jade","key":"0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea"},"renderMode":"pre-rendered"}', headers: {})
        end

        subject { described_class.new('foobar', {}, '1.0.0').load }

        it 'sets the component href' do
          expect(subject.href).to eq('http://localhost:3030/foobar/1.0.0')
        end

        it 'sets the component version' do
          expect(subject.version).to eq('1.0.0')
        end

        it 'sets the component request version' do
          expect(subject.request_version).to eq '1.0.0'
        end

        it 'sets the component type' do
          expect(subject.type).to eq 'oc-component-local'
        end

        it 'sets the component render mode' do
          expect(subject.render_mode).to eq 'pre-rendered'
        end

        it 'sets the component data' do
          expect(subject.data).to eq({'name' => 'Todd'})
        end

        it 'sets the component template' do
          expect(subject.template).to eq OpenComponents::Template.new(
            'http://localhost:3030/foobar/1.0.0/static/template.js',
            'jade',
            '0fe4b3fb2d6c0810f0d97a222a7e61eb91243bea'
          )
        end
      end
    end

    context 'for a missing component' do
      before do
        stub_request(:get, "http://localhost:3030/foo/").
          with(headers: {'Accept'=>'application/vnd.oc.prerendered+json', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
          to_return(status: 404, body: "", headers: {})
      end

      subject { described_class.new('foo').load }

      it 'raises an exception' do
        expect { subject }.to raise_exception(OpenComponents::ComponentNotFound)
      end
    end
  end
end
