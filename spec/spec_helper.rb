# frozen_string_literal: true

require_relative '../lib/exchange_it'
require_relative '../lib/string_calculator'
require_relative '../lib/factorial_calculator'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/specs.txt'
  #config.define_derived_metadata(file_path: /exchange_it\/utils/) do |meta|
  #  meta[:fast] = true
  #end
end