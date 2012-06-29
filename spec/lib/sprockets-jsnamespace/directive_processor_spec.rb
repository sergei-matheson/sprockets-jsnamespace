require 'sprockets-jsnamespace'
require 'execjs'

describe Sprockets::DirectiveProcessor do
  
  # Returns the specified fixture file
  def fixture_file file
    File.join(File.dirname(__FILE__), '..', '..', 'fixtures', file)
  end
  
  # Runs the js code in the given file through the processor, then compiles it into a js context.
  def compile_fixture file
    response = @server.({'PATH_INFO' => file})
    response[0].should eql 200
    ExecJS.compile("var window = {}; #{response[2].to_s}")
  end

  before :all do
    Sprockets::DirectiveProcessor.namespacer = nil
    @server = Sprockets::Environment.new(File.join(File.dirname(__FILE__), '..', '..'))
    @server.append_path('fixtures')
  end

  before :each do
    #All assets are stale
    #Sprockets::Asset.any_instance.stub(:fresh?) { false }
    #Sprockets::ProcessedAsset.any_instance.stub(:fresh?) { false }
    #Sprockets::BundledAsset.any_instance.stub(:fresh?) { false }
  end

  context "when inline namespacing" do

    it "should properly create namespaces" do
      js = compile_fixture('woot.js')
      js.eval('window.Woot.Stuff.greeting("World")').should eql('Hello World')

    end

    it "should properly handle namespace within required files" do
      js = compile_fixture('with_requires.js')
      js.eval('window').should eql({"Root" => {"First" => {"value" => 1}, "Second" => {"value" => 2}}})
    end

  end

  context "when bundle namespacing" do

    before :all do
      Sprockets::DirectiveProcessor.namespacer = Sprockets::Jsnamespace::NamespaceRegistry.instance
      @server.register_bundle_processor 'application/javascript', Sprockets::Jsnamespace::BundleProcessor
    end

    it "should default to using the inline namespace declarer unless overridden" do
      js = compile_fixture('woot.js')
      js.eval('window.Woot.Stuff.greeting("World")').should eql('Hello World')
    end

    it "should default to using the inline namespace declarer unless overridden" do
      js = compile_fixture('with_requires.js')
      js.eval('window').should eql({"Root" => {"First" => {"value" => 1}, "Second" => {"value" => 2}}})
    end

  end

end
