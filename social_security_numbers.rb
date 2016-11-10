# Look at the tests in `spec/social_security_numbers_spec.rb`
# to see a description of how these methods should behave.


# Determine whether a string contains a Social Security Number.
def has_ssn?(string)
	results = string =~ /\d\d\d(-)\d\d(-)\d\d\d\d/
	if(results != nil) 
		return true
	end
	return false
end

# Find and return a Social Security Number.
def grab_ssn(string)
	index = string =~ /\d\d\d(-)\d\d(-)\d\d\d\d/
	if(index != nil)
		return string[index..index+10]
	end
	return ""
end


# Find and return all Social Security Numbers.
def grab_all_ssns(string)
	array = []
	until (string =~ /\d\d\d(-)\d\d(-)\d\d\d\d/) == nil
		index = string =~ /\d\d\d(-)\d\d(-)\d\d\d\d/
		array << string[index..index+10]
		string[index..index+10] = ""
	end
	return array
end

# Obfuscate all Social Security Numbers. Example: XXX-XX-4430.
def hide_all_ssns(string)
	until (string =~ /\d\d\d(-)\d\d(-)\d\d\d\d/) == nil
		index = string =~ /\d\d\d(-)\d\d(-)\d\d\d\d/
		string[index..index+2] = 'XXX'
		string[index+4..index+5] = 'XX'
	end
	return string
end


# Format all Social Security Numbers to use single dashes for delimiters:
# '480014430', '480.01.4430', and '480--01--4430' would all be formatted '480-01-4430'.
def format_ssns(string)
	return string.gsub(/(\d{3})[^\d]*(\d{2})[^\d]*(\d{4})/, '\1-\2-\3')
end