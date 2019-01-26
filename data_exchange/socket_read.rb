require 'socket'

one_kb = 1024 # bytes 

Socket.tcp_server_loop(4481) do |connection|
    # read data in chunks of 1 kb
    while data = connection.readpartial(one_kb) do 
        puts data 
    end

    connection.close 
end 

# client connection 
client = TCPSocket.new('localhost', 4481)
client.write('gekko')
client.close # send EOF event