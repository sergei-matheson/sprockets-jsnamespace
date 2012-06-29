module Sprockets
  class DirectiveProcessor

    class << self
      attr_accessor :namespacer
    end

    def process_jsnamespace_directive full_namespace
      self.class.namespacer = Sprockets::Jsnamespace::NamespaceDeclarer.new unless self.class.namespacer
      declaration = self.class.namespacer.namespace(full_namespace)
      @result << declaration if declaration
    end

  end
end
