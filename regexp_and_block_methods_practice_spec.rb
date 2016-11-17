#To run this file type:
#   rspec -fd regexp_and_block_methods_practice_spec.rb

require_relative "regexp_and_block_methods_practice.rb"

describe "happy_maker" do
  it "Changes every instance of 'sad' to 'happy'" do
    expect(happy_maker("sad turtle is sad.")).to eq("happy turtle is happy.")
  end
end
describe "team_sorter" do
  it "Returns a hash of teams only with a member count less than or equal to max_members" do
    result = team_sorter({"tigers" => ["mary", "beth", "steven"],
                          "panthers" => ["keith", "ben", "melissa", "betsy"],
                          "lions" => ["samantha", "grace", "sam", "sean", "melvin"]}, 4)
    expect(result).to eq({"tigers" => ["mary", "beth", "steven"],
                          "panthers" => ["keith", "ben", "melissa", "betsy"]})
  end
end
describe "number_scrambler" do
  it "Doubles odd numbers and turns even numbers into the number 100" do
    numbers = number_scrambler([1, 4, 11, 3, 6, 8, 7])
    expect(numbers).to eq([2, 100, 22, 6, 100, 100, 14])
  end
end
describe "phone_number_counter" do
  it "Returns the number of time a phone number occurs" do
    sentence = "Some phone numbers are (650)235-8458, 414-345-1224, and 2948547364"
    expect(phone_number_counter(sentence)).to eq(3)
  end
end
describe "happy_maker_2" do
  it "Changes every instance of 'sad' to 'happy'" do
    expect(happy_maker_2("sad turtle is sad")).to eq("happy turtle is happy")
  end
end