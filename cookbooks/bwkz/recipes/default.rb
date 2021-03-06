

# Install Supporting Services
if node['osysflav'] != "windows"
  %w[WAS-WindowsActivationService WAS-NetFxEnvironment WAS-ConfigurationAPI IIS-LoggingLibraries IIS-HttpTracing IIS-HttpCompressionDynamic IIS-ManagementScriptingTools IIS-IIS6ManagementCompatibility IIS-BasicAuthentication IIS-ManagementService IIS-FTPSvc IIS-FTPSvc IIS-FTPExtensibility WCF-HTTP-Activation IIS-WindowsAuthentication IIS-DigestAuthentication IIS-ClientCertificateMappingAuthentication  IIS-IISCertificateMappingAuthentication IIS-URLAuthorization IIS-IPSecurity].each do |feature|
    windows_feature feature do
      action :install
    end
  end
end

if node['osysflav'] != "windows"
  %w[RSAT-RDS-Tools].each do |feature|
    windows_feature feature do
      action :remove
      all true
    end
  end
end

# Install Roles Features
if node['osysflav'] != "windows"
  %w[IIS-WebServerRole IIS-WebServer NetFx3].each do |feature|
    windows_feature feature do
      action :install
      all true
    end
  end
end

# Install Roles Features
if node['osysflav'] != "windows"
  %w[ServicesForNFS-ServerAndClient ServerForNFS-Infrastructure ClientForNFS-Infrastructure NFS-Administration CoreFileServer].each do |feature|
    windows_feature feature do
      action :install
    end
  end
end 


# Install IIS Features
if node['osysflav'] != "windows"
  %w[IIS-ApplicationDevelopment IIS-NetFxExtensibility IIS-ISAPIExtensions IIS-ISAPIFilter IIS-ASPNET IIS-HttpRedirect IIS-ASP IIS-HealthAndDiagnostics IIS-Security IIS-WebServerManagementTools IIS-FTPServer IIS-Performance].each do |feature|
    windows_feature feature do
      action :install
    end
  end
end

# stop and delete the default site
if node['osysflav'] != "windows"
  iis_site 'Default Web Site' do
    action [:stop, :delete]
  end
end

# creates a new app pool


# do the same but map to testfu.chef.io domain
if node['bwkzrole'] == "webserver"
  %w[awstest1 awstest2 awstest3].each do |bwkzsite|
    iis_pool bwkzsite do
      runtime_version "2.0"
      pipeline_mode :Integrated
      action :add
    end
    iis_site bwkzsite do
      bindings "http/*:80:#{node['host_headers']["#{bwkzsite}"]}"
      protocol :http
      port 80
      application_pool "#{bwkzsite}"
      path "\\\\172.26.64.169\\smbmount\\public\\clients\\#{bwkzsite}\\webroot"
      action [:add,:start,:config]
    end
  end
end
