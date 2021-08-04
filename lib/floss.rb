# frozen_string_literal: true

require_relative 'floss/version'

# * Main
require_relative 'floss/main'
require_relative 'floss/project_info'
require_relative 'floss/projects'

# * Actions
require_relative 'floss/actions/archive'
require_relative 'floss/actions/grab'

# * Services
require_relative 'floss/services/utils'

# Manage FLOSS Projects repositories.
module Floss
end
