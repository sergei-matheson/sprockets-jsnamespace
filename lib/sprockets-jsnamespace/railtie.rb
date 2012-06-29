module Sprockets
  module Jsnamespace
    class Railtie < Rails::Engine
      initializer :setup_js_namespaces do |app|
        unless app.config.assets.debug
          Sprockets::DirectiveProcessor.namespacer = Sprockets::Jsnamespace::NamespaceRegistry.instance 
          app.assets.register_bundle_processor 'application/javascript', Sprockets::Jsnamespace::BundleProcessor
        end
      end
    end
  end
end
