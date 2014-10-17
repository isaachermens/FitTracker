OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '78703659744-0893uouj4nr62qnhdvpd3i33n4bhsokl.apps.googleusercontent.com',
           ENV['GOOGLE_SECRET'], {client_options: {ssl: {ca_file: Rails.root.join('cacert.pem').to_s}}}

  provider :github, '05f20139fc736ad00717', ENV['GITHUB_SECRET'],
           {client_options: {ssl: {ca_file: Rails.root.join('cacert.pem').to_s}}}
end