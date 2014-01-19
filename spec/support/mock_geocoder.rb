require 'geocoder/results/base'

module MockGeocoder
  def self.included(base)
    base.before :each do
      ::Geocoder.stubs(:search).raises(RuntimeError.new 'Use "mock_geocoding!" in your tests!')
    end
  end
  
  def mock_geocoding!(options={})
    options.reverse_merge!(address: 'Address', coordinates: [1,2])
    
    MockResult.new.tap do |result|
      result.stubs options
      Geocoder.stubs search: [result]
    end
  end
  
  class MockResult < ::Geocoder::Result::Base
    def initialize(data = [])
      super(data)
    end
  end
end
