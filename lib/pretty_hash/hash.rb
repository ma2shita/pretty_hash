class Hash
  def to_pp_table(p = Proc.new{|c|c})
    k_max_w = self.keys.map{|i|i.is_a?(Symbol) ? i.to_s.print_length+1 : i.to_s.print_length}.sort{|a ,b|b <=> a}.first
    v_max_w = self.values.map{|i|p.call(i).to_s.print_length}.sort{|a, b| b <=> a }.first
    header = ["-"*k_max_w, "|", "-"*v_max_w].join + "\n"
    s = ""
    s << header
    self.each do |i|
      k = i.first.is_a?(Symbol) ? ":#{i.first}" : i.first.to_s
      s << [k.lpad(k_max_w), "|", p.call(i.last).to_s].join + "\n"
    end
    s << header
    s
  end
end
