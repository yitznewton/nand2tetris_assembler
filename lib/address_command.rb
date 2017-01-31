class AddressCommand
  PREFIX = '0'

  def initialize(assembly, symbol_table)
    @assembly = assembly
    @symbol_table = symbol_table
  end

  def to_hack
    PREFIX + address
  end

  private

  attr_reader :assembly, :symbol_table

  def address
    binary_address.rjust(15, '0')
  end

  def binary_address
    raw_address.to_i.to_s(2)
  end

  def raw_address
    symbol? ? symbol_table.address(assembly) : assembly
  end

  def symbol?
    assembly[0] < '0' || assembly[0] > '9'
  end
end
