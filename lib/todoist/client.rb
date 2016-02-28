require "fileutils"
require "json"
require "net/https"
require "uri"

module TdCLI
    TODOIST_API_URL = 'https://todoist.com/API/v6/sync'
    DATA_DIR = File.join(ENV['HOME'], '.tdcli/')

    class Client
        def initialize(token = nil)
            # initialize the client with a token
            if token.nil?
                @file_path = File.join(DATA_DIR, 'tdcli')
                if File.exist?(@file_path)
                    @todoist_token = File.open(@file_path, &:readline).strip
                else
                    newAPIToken()
                end
            else
                @todoist_token = token
            end
        end

        def newAPIToken
            # make sure the data dir exists
            if !File.directory?(DATA_DIR)
                FileUtils.mkdir(DATA_DIR)
            end
            puts 'Enter an API token:'
            token = gets.chomp
            # save token to file for later use
            File.open(@file_path, 'w') { |file| file.write(token) }
            @todoist_token = token

        end

        def sync(resource_types)
            options = {}
            options['token'] = @todoist_token
            options['seq_no'] = 0
            options['resource_types'] = JSON.generate resource_types

            uri = URI.parse(TODOIST_API_URL)
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            request = Net::HTTP::Post.new(uri.request_uri)
            request.set_form_data(options)

            response = http.request(request)

            data = JSON.parse response.body
            return data
        end
    end
end
