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