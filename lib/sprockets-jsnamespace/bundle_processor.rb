require 'tilt'

module Sprockets
  module Jsnamespace
    # Inserts any registered namespaces into the top of the bundle output
    #
    class BundleProcessor < Tilt::Template
      def prepare
      end

      def evaluate(context, locals, &block)
        Sprockets::Jsnamespace::NamespaceRegistry.instance.declare() + data
      end
    end
  end
end
