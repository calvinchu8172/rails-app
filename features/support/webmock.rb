require 'webmock/cucumber'

WebMock.allow_net_connect!

Before '@webmock' do
  stub_request(:post, /url-1/).to_return(body: 'success')
  stub_request(:post, /url-2/).to_return{ |request|
  }
end
