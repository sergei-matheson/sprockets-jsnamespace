require 'sprockets-jsnamespace/namespace_registry'

describe Sprockets::Jsnamespace::NamespaceRegistry do

  subject {Sprockets::Jsnamespace::NamespaceRegistry.instance}
  
  #Converts the given javascript to a ruby object for comparison
  def js_to_ruby_object declaration
    ExecJS.exec("var window = {}; #{declaration} return window;")
  end

  it "should add namespaces to a global registry when registered" do
    subject.namespace('Woot.Stuff')
    subject.namespace('Woot.Things')
    subject.namespace('Other.Stuff')
    subject.namespace_tree.should eql({'Woot' => {'Stuff' => {}, 'Things' => {}}, 'Other' => {'Stuff' => {}}})
  end

  it "should properly declare registered namespaces when asked" do
    subject.namespace('Woot.Stuff')
    subject.namespace('Woot.Things')
    subject.namespace('Other.Stuff')
    js_to_ruby_object(subject.declare).should eql({'Woot' => {'Stuff' => {}, 'Things' => {}}, 'Other' => {'Stuff' => {}}})
  end

end
