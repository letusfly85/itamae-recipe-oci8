package "libaio1" do
    action :install
end

client_prefix  = "instantclient"
oracle_version = "12.1.0.2.0"
client_dist    = "linux.x64"
client_root    = "/opt/oracle/"
client_dir     = "/opt/oracle/instantclient_12_1"

lib_12_1 = "libclntsh.so.12.1"
lib_11_1 = "libclntsh.so.11.1"

%w{basic sqlplus sdk odbc tools}.each do |pkg|
   execute "unzip clients" do
        zip_file = "#{client_prefix}" + "-" + pkg + "-" + "#{client_dist}" + "-" + "#{oracle_version}" + ".zip"

        Itamae::Logger::info zip_file
        command <<-EOS
            cd   cookbooks/oci8/files
            unzip #{zip_file} -d #{client_root}/
            touch #{client_dir}/#{pkg}_hoge
        EOS
   end
end

#link "#{client_dir}/#{lib_12_1}" do
#    to "#{client_dir}/#{lib_11_1}"
#end


#instantclient-tools-linux.x64-12.1.0.2.0.zip
#instantclient-sqlplus-linux.x64-12.1.0.2.0.zip
#instantclient-sdk-linux.x64-12.1.0.2.0.zip
#instantclient-odbc-linux.x64-12.1.0.2.0.zip
#instantclient-basic-linux.x64-12.1.0.2.0.zip
