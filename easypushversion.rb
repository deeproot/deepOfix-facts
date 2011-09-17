require 'facter/lsb'
   
   Facter.add(:easypushversion) do
       setcode do
         File.readlines("/var/easypush/etc/version").to_a.last
       end
   end

