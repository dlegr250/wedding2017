#======================================================================
# Starting in Rails 5+, this is a base class all models should inherit
# from, similar to how controllers inherit from ApplicationController.
#======================================================================
class ApplicationRecord < ActiveRecord::Base
  include ::Modules::Uuid

  self.abstract_class = true
end
