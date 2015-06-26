

# Install Supporting Services
%w[WAS-WindowsActivationService WAS-NetFxEnvironment WAS-ConfigurationAPI IIS-LoggingLibraries IIS-HttpTracing IIS-HttpCompressionDynamic IIS-ManagementScriptingTools IIS-IIS6ManagementCompatibility IIS-BasicAuthentication IIS-ManagementService IIS-FTPSvc IIS-FTPSvc IIS-FTPExtensibility WCF-HTTP-Activation IIS-WindowsAuthentication IIS-DigestAuthentication IIS-ClientCertificateMappingAuthentication  IIS-IISCertificateMappingAuthentication IIS-URLAuthorization IIS-IPSecurity].each do |feature|
  windows_feature feature do
    action :install
  end
end

# Install Roles Features
%w[IIS-WebServerRole IIS-WebServer NetFx3].each do |feature|
  windows_feature feature do
    action :install
    all true
  end
end

# Install Roles Features
%w[ServicesForNFS-ServerAndClient ServerForNFS-Infrastructure ClientForNFS-Infrastructure NFS-Administration CoreFileServer].each do |feature|
  windows_feature feature do
    action :install
    all true
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