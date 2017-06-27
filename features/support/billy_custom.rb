Before '@proxy' do
  proxy.stub('http://www.google.com/').and_return(text: 'I am faker website!')
end
