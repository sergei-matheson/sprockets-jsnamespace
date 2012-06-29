require 'multi_json'
require 'singleton'
module Sprockets
  module Jsnamespace
    class NamespaceRegistry

      include Singleton

      attr_reader :namespace_tree

      def initialize
        @namespace_tree = {}
      end

      def namespace(namespace)
        tree_pointer = @namespace_tree

        namespace.split('.').each do |element|
          tree_pointer[element] = {} unless tree_pointer[element]
          tree_pointer = tree_pointer[element]
        end
        nil
      end

      def declare
        rv = ''
        @namespace_tree.each do |key, value|
          rv << 'window['+MultiJson.dump(key)+']='+MultiJson.dump(value)+';'
        end
        @namespace_tree.clear()
        rv
      end
    end
  end
end
