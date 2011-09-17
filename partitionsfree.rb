partname = nil
partfree = nil
output   = { }

partitionlist = %x[df -h]

partitionlist.each do |part|

  unless /filesystem/i =~part.chomp!
    partarr= part.split(" ")
    partname = partarr[0] and partfree = partarr[3]

    if partname != nil && partfree != nil
      output[partname + "_Available"] = partfree

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




