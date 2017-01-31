require_relative 'computation'
require_relative 'destination'
require_relative 'jump'

class ComputationCommand
  PREFIX = '111'

  def initialize(assembly)
    @assembly = assembly
  end

  def to_hack
    PREFIX + source + computation + destination + jump
  end

  private

  attr_reader :assembly

  def source
    right_side.include?('M') ? '1' : '0'
  end

  def computation
    Computation.new(assembly).to_hack
  end

  def destination
    Destination.new(left_side).to_hack
  end

  def jump
    Jump.new(assembly[-3..-1]).to_hack
  end

  def left_side
    return '' unless assembly.include?('=')
    assembly[0...assembly.index('=')]
  end

  def right_side
    return '' unless assembly.include?('=')
    assembly[(assembly.index('=') + 1)..-1]
  end
end
