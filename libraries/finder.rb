def finder
  nodes = search(:node, 'some:stuff')
  results = []
  nodes.each do |pnode|
    ret = system("ping -c 1 -w 2 #{pnode[:ipaddress]} > /dev/null")
    if ret
      results << pnode[:ipaddress]
    end
  end
  results
end
