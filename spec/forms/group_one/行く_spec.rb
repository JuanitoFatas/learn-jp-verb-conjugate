RSpec.describe "活用形 行く" do
  def answer
    @_answer ||= load_verb type: "forms", group: "one", name: "行く"
  end

  def verb
    @_verb ||= Harune.conjugate("行く")
  end

  it "dictionary form" do
    expect(verb.dictionary).to eq answer.dictionary
  end

  it "masu form" do
    expect(verb.masu).to eq answer.masu
  end

  it "conjunctive form" do
    expect(verb.conjunctive).to eq answer.conjunctive
  end

  it "not form" do
    expect(verb.not).to eq answer.not
  end

  it "ta form" do
    expect(verb.ta).to eq answer.ta
  end

  it "te form" do
    expect(verb.te).to eq answer.te
  end
end
