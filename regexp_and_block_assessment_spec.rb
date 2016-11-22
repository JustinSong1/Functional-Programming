require_relative "regexp_and_block_assessment"

describe "password_hider" do
  it "Replaces a password with '*****'" do
    sentence = "34bac and 98jse are both valid passords."
    expect(password_hider(sentence)).to eq("***** and ***** are both valid passords.")
  end
end
describe "class_schedule" do
  it "Returns a hash of classes containing a given student" do
    classes = {1 => ["john", "mindy", "craig"],
               2 => ["melissa", "michelle", "sarah"],
               3 => ["savana", "craig", "bernard"]}
    expect(class_schedule(classes, "craig")).to eq({1 => ["john", "mindy", "craig"],
                                           3 => ["savana", "craig", "bernard"]})
  end
end
describe "animal_sorter" do
  it "Returns a hash of animals that do not start with the given letter and are above the minimum height." do
    animals = {"cat" => 1, "giraffe" => 18, "rhino" => 7, "gorilla" => 8}
    expect(animal_sorter(animals, "g", 5)).to eq({"rhino" => 7})
  end
end
describe "capitalizer" do
  it "Capitalizes words with 5 or more characters, and lowercases words with fewer than 5 characters." do
    words = ["Chocolate", "Pie", "Custard", "Cake", "Cookies", "Candy"]
    expect(capitalizer(words)).to eq(["CHOCOLATE", "pie", "CUSTARD", "cake", "COOKIES", "CANDY"])
  end
end
describe "password_finder" do
  it "Finds all valid passwords" do
    sentence = "1234-12-23, 85376428, 2736.23.23, and 8593(23)(59) are all passwords."
    expect(password_finder(sentence)).to eq(["1234-12-23", "85376428", "2736.23.23", "8593(23)(59)"])
  end
end
describe "password_formatter" do
  it "Reformats every password into the format xxxx-xx-xx" do
    sentence = "1234-12-23, 85376428, 2736.23.23, and 8593(23)(59) are all passwords."
    expect(password_formatter(sentence)).to eq("1234-12-23, 8537-64-28, 2736-23-23, and 8593-23-59 are all passwords.")
  end
end
describe "greeter" do
  it "Greets each person in the array" do
    expect {greeter(["Martin", "Becky", "Sharon"])}.to output("Hi Martin, nice to meet you!\n" + 
                                                              "Hi Becky, nice to meet you!\n" + 
                                                              "Hi Sharon, nice to meet you!\n").to_stdout
  end
end