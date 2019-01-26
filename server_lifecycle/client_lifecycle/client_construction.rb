require 'socket'

socket = Socket.new(:INET, :STREAM)

# initiate a connection to google.com on port 80
remote_addr = Socket.pack_sockaddr_in(80, 'google.com')
socket.connect(remote_addr)

#syntatic sugar
socket = TCPSocket.new('google.com', 80) do |connection|
    connection.write "GET / HTTP/1.1\r\n"
    connection.close
end 