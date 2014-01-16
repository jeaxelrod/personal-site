class Admin < ActiveRecord::Base
	has_secure_password
end

##
# :password_digest  string
# :username    string
##