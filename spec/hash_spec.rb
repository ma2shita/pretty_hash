require "spec_helper"
require "pretty_hash"

describe Hash do
  describe "to_pp_table" do
    let(:h1) { {"a" => "abcde", "bbb" =>  "a"} }
    it "pp print" do
      expect(h1.to_pp_table).to eq <<-EOT
---|-----
  a|abcde
bbb|a
---|-----
    EOT
    end

    let(:h2) { {:ccc => "aa", "dddd" =>  "a"} }
    it "symbol key" do
      expect(h2.to_pp_table).to eq <<-EOT
----|--
:ccc|aa
dddd|a
----|--
    EOT
    end

    let(:h3) { {:k1 => Struct.new(:name).new("hoge"), :k2 => Struct.new(:name).new("foo")} }
    it "use proc" do
      expect(h3.to_pp_table).to eq <<-EOT
---|---------------------
:k1|#<struct name="hoge">
:k2|#<struct name="foo">
---|---------------------
    EOT
      expect(h3.to_pp_table(Proc.new{|c|c.name})).to eq <<-EOT
---|----
:k1|hoge
:k2|foo
---|----
    EOT
    end

    let(:h4) { {:ccc => "日本語講座", "dddd" =>  "a"} }
    it "multibyte" do
      expect(h4.to_pp_table).to eq <<-EOT
----|----------
:ccc|日本語講座
dddd|a
----|----------
    EOT
    end

  end
end

