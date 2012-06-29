require 'sprockets-jsnamespace/namespace_declarer'
require 'execjs'

describe Sprockets::Jsnamespace::NamespaceDeclarer do

  #Converts the given javascript to a ruby object for comparison
  def js_to_ruby_object declaration
    ExecJS.exec("var window = {}; #{declaration} return window;")
  end

  it "should return a valid javascript declaration for a namespace" do
    js_to_ruby_object(subject.namespace('Woot')).should eql({'Woot' => {}})
    js_to_ruby_object(subject.namespace('Woot.Stuff')).should eql({'Woot' => {'Stuff' => {}}})
    js_to_ruby_object(subject.namespace('Woot.Stuff.Things')).should eql({'Woot' => {'Stuff' => {"Things" => {}}}})
  end

end
