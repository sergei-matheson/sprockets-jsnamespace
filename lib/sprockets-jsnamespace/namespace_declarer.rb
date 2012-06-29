require 'multi_json'
module Sprockets
  module Jsnamespace
    class NamespaceDeclarer

      def namespace full_namespace
        namespace_array = full_namespace.split('.')

        <<-eos
(function() {
  var index, components = #{MultiJson.dump(namespace_array)}, pointer = window, current;
  for(index=0; index<#{namespace_array.length}; index++) {
    current = components[index];
    if (!pointer[current])
      pointer[current] = {}
    pointer=pointer[current];
}})();
        eos
      end
    end
  end
end
