module Sprockets
  module Jsnamespace
    class Railtie < Rails::Engine
      initializer :setup_js_namespaces do |app|
        if Rails.application.config.assets.compile and not Rails.application.config.assets.debug?
          Sprockets::DirectiveProcessor.namespacer = Sprockets::Jsnamespace::NamespaceRegistry.instance 
        end
        app.assets.register_bundle_processor 'application/javascript', Sprockets::Jsnamespace::BundleProcessor
      end
    end
  end
end
