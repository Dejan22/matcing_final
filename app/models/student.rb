require_relative 'pair.rb'
require_relative 'user.rb'
class Student < ApplicationRecord

  def set_defaults
    self.matches ||= []
  end
end
