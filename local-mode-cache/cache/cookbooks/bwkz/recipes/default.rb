
# Install Roles Features
%w[IIS-WebServerRole IIS-WebServer AppServer].each do |feature|
  windows_feature feature do
    action :install
  end
end

# Install IIS Features
%w[IIS-ApplicationDevelopment IIS-NetFxExtensibility IIS-ISAPIExtensions IIS-ISAPIFilter IIS-ASPNET IIS-HttpRedirect IIS-ASP IIS-HealthAndDiagnostics IIS-Security IIS-WebServerManagementTools IIS-FTPServer IIS-Performance].each do |feature|
  windows_feature feature do
    action :install
  end
end

# stop and delete the default site
iis_site 'Default Web Site' do
  action [:stop, :delete]
end

# do the same but map to testfu.chef.io domain
iis_site 'Testfu Site' do
  protocol :http
  port 80
  path "#{node['iis']['docroot']}/testfu"
  host_header "testfu.chef.io"
  action [:add,:start]
end