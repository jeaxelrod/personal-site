class Blog < ActiveRecord::Base
	default_scope -> { order ('created_at DESC') }
end

##
# contents  string
# title  string
# tags string