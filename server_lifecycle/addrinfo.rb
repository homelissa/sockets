require 'socket'

server = Socket.new(:INET, :STREAM)

addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(Socket::SOMAXCONN)
connection, _ = server.accept

print 'Connection class: '
p connection.class 

print 'Server fileno: '
p server.fileno 

print 'Connection fileno: '
p connection.fileno 

print 'Local address: '
p connection.local_address 

print 'Remote address: '
p connection.remote_address 

# echo ohai | nc localhost 4481
# Connection class: Socket
# Server fileno: 7
# Connection fileno: 8
# Local address: #<Addrinfo: 127.0.0.1:4481 TCP>
# Remote address: #<Addrinfo: 127.0.0.1:50846 TCP>