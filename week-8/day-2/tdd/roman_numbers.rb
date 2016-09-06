require 'minitest/autorun'

ARABIC_TO_ROMAN = [
  # Breakpoint
  [100, "C"],

  # Special case
  [90, "XC"],

  # Breakpoint
  [50, "L"],

  # Special case
  [40, "XL"],

  # ...
  [10, "X"],
  [9,  "IX"],
  [5,  "V"],
  [4,  "IV"],
  [1,  "I"],
]

def arabic_to_roman(arabic)
  # Romans had no zero (guard clause)
  return "" if arabic == 0

  arabic_number, roman_number = ARABIC_TO_ROMAN.find { |arabic_number, roman_number| arabic_number <= arabic }

  roman_number + arabic_to_roman(arabic - arabic_number)
end

describe "Arabic to Roman Numerals" do
  it "converts arabic to roman numerals" do
    tests = [
      [0, ""],
      [1, "I"],
      [2, "II"],
      [3, "III"],
      [4, "IV"],
      [5, "V"],
      [6, "VI"],
      [7, "VII"],
      [8, "VIII"],
      [9, "IX"],
      [10, "X"],
      [11, "XI"],
      [12, "XII"],
      [13, "XIII"],
      [14, "XIV"],
      [15, "XV"],
      [16, "XVI"],
      [17, "XVII"],
      [18, "XVIII"],
      [19, "XIX"],
      [20, "XX"],
      [40, "XL"],
      [50, "L"],
      [51, "LI"],
      [90, "XC"],
      [91, "XCI"],
      [97, "XCVII"],
      [100, "C"]
    ]

    tests.each do |arabic, expected_roman|
      computed_roman = arabic_to_roman(arabic)

      assert_equal expected_roman, computed_roman,
        "When converting #{arabic} expected #{expected_roman} got #{computed_roman}"
    end
  end
end
