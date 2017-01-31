require_relative 'address_command'
require_relative 'computation_command'

class Command
  def self.parse(assembly, lookup_table)
    if assembly[0] == '@'
      AddressCommand.new(assembly[1..-1], lookup_table)
    else
      ComputationCommand.new(assembly)
    end
  end
end
