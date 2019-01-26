require 'socket'

server = Socket.new(:INET, :STREAM)

# create a C struct to hold the address for listening 
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(Socket::SOMAXCONN)

loop do 
    connection, _ = server.accept
    connection.close_write 
    connection.close_read
end 

# the above can be abstracted away to the following
server = TCPServer.new(4481)

Socket.accept_loop(server) do |connection|
    # handle connection
    connection.close
end 

Socket.tcp_server_loop(4481) do |connection|
    # handle connection 
    connection.close 
end 