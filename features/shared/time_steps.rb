Given /^"([^"]*)" days later$/ do |days|
  Timecop.travel(Time.now + days.to_i.days)
end

Given /^Time now is "([^"]*)"$/ do |time|
  Timecop.freeze(time.to_datetime)
end

Given /^Time is correct$/ do
  Timecop.return
end

When /^(?:|the .+ )wait for (.+) seconds$/ do |seconds|
  sleep seconds.to_f
end
