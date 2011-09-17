partname = nil
partused = nil
output   = { }

partitionlist = %x[df -h]

partitionlist.each do |part|

  unless /filesystem/i =~part.chomp!
    partarr= part.split(" ")
    partname = partarr[0] and partused = partarr[2]

    if partname != nil && partused != nil
      output[partname+"_used"] = partused

      partname = nil
      partused = nil
    end

  end

end

output.each{|name,fact|
  Facter.add(name) do
    setcode do
      fact
    end
  end
}

