require "spec_helper"
require "pretty_hash"

describe String do
  it "print_length" do
    expect("にほんごabc".print_length).to eq 11
  end

  it "rpad" do
    expect("a".rpad(5)).to eq "a    "
    expect("a".rpad(5, "-")).to eq "a----"
    expect("日本".rpad(5, "#")).to eq "日本#"
  end
  it "lpad" do
    expect("a".lpad(5)).to eq "    a"
    expect("a".lpad(5, "-")).to eq "----a"
    expect("日本".lpad(5, "#")).to eq "#日本"
  end
  it "auto detect padding" do
    expect("aa".padding(6)).to eq "aa    "
    expect("120".padding(6)).to eq "000120"
    expect("120.0".padding(6)).to eq "0120.0"
  end
  it "width over" do
    expect{"abcdef".rpad(5)}.to raise_error(ArgumentError)
    expect{"日本語".rpad(5)}.to raise_error(ArgumentError)
  end
end

