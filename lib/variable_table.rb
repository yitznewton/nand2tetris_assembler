class VariableTable
  BUILT_INS = {
    'SP' => 0,
    'LCL' => 1,
    'ARG' => 2,
    'THIS' => 3,
    'THAT' => 4,
    'R0' => 0,
    'R1' => 1,
    'R2' => 2,
    'R3' => 3,
    'R4' => 4,
    'R5' => 5,
    'R6' => 6,
    'R7' => 7,
    'R8' => 8,
    'R9' => 9,
    'R10' => 10,
    'R11' => 11,
    'R12' => 12,
    'R13' => 13,
    'R14' => 14,
    'R15' => 15,
    'SCREEN' => 16384,
    'KBD' => 24576
  }

  STARTING_CUSTOM_POSITION = 16

  def initialize
    @custom_symbols = []
  end

  def address(symbol)
    BUILT_INS.fetch(symbol) { for_custom(symbol) }
  end

  private

  attr_reader :custom_symbols

  def for_custom(symbol)
    return custom_symbols.index(symbol) + STARTING_CUSTOM_POSITION if custom_symbols.include?(symbol)

    custom_symbols << symbol
    STARTING_CUSTOM_POSITION + custom_symbols.length - 1
  end
end
