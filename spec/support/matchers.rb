RSpec::Matchers.define :have_title do |title|
	match do |page|
		page.should have_selector('title', text: title)
	end
end

RSpec::Matchers.define :have_h1 do |h1|
	match do |page|
		page.should have_selector('h1', text: h1)
	end
end

RSpec::Matchers.define :have_li do |li|
	match do |page|
		page.should have_selector('li', text: li)
	end
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :have_welcome_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-success', text: message)
	end
end
