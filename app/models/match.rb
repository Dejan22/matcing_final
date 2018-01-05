require_relative 'pair.rb'
require_relative 'user.rb'

class Match < ApplicationRecord


  private

  def set_defaults
    self.matches ||= []
  end
end
