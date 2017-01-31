class SymbolTable
  def initialize(label_table:, variable_table:)
    @label_table = label_table
    @variable_table = variable_table
  end

  def address(symbol)
    label_table.fetch(symbol) { variable_table.address(symbol) }
  end

  private

  attr_reader :label_table, :variable_table
end
