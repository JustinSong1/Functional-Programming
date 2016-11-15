# Look at the tests in `spec/social_security_numbers_spec.rb`
# to see a description of how these methods should behave.


# Determine whether a string contains a Social Security Number.
def has_ssn?(string)
	results = string =~ /\d\d\d(-)\d\d(-)\d\d\d\d/
	results == nil ? false : true
end

# Find and return a Social Security Number.
def grab_ssn(string)
	return string.match(/\d\d\d-\d\d-\d\d\d\d/).to_s
end


# Find and return all Social Security Numbers.
def grab_all_ssns(string)	
	return string.scan(/\d\d\d-\d\d-\d\d\d\d/)
end

# Obfuscate all Social Security Numbers. Example: XXX-XX-4430.
def hide_all_ssns(string)
	return string.gsub(/(\d{3})-(\d{2})-(\d{4})/, 'XXX-XX-\3')
end


# Format all Social Security Numbers to use single dashes for delimiters:
# '480014430', '480.01.4430', and '480--01--4430' would all be formatted '480-01-4430'.
def format_ssns(string)
	return string.gsub(/(\d{3})[^\d]*(\d{2})[^\d]*(\d{4})/, '\1-\2-\3')
end