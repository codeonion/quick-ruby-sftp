require 'net/sftp'

host = '<sftp host>'
exception_message = ""
uri = URI.parse('sftp://' + host)

begin
    Net::SFTP.start(uri.host,"<username>",:host_key => "ssh-dss",:password=>"<password>",:port=>22) do |sftp|
        puts "Connected to SFTP"
    end

rescue => exception
    puts "Exception: " + exception.to_s
    exception_message =  exception.to_s
    puts "Aborting because of SFTP Connection failure"
    abort("/!\\ Aborting because of SFTP Connection failure /!\\")
end
