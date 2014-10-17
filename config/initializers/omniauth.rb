OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '78703659744-0893uouj4nr62qnhdvpd3i33n4bhsokl.apps.googleusercontent.com',
           '_oZS3WavtVxG5w16N5RFEEQA', {client_options: {ssl: {ca_file: Rails.root.join('cacert.pem').to_s}}}

  provider :github, '05f20139fc736ad00717', 'e183ed5b5964b7a0cb7b7e504f68d9da6476d89c',
           {client_options: {ssl: {ca_file: Rails.root.join('cacert.pem').to_s}}}
end