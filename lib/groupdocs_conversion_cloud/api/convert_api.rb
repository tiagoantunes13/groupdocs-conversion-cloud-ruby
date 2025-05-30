# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="convert.rb">
#   Copyright (c) 2003-2022 Aspose Pty Ltd
# </copyright>
# <summary>
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
# </summary>
# -----------------------------------------------------------------------------------

require 'uri'
require 'date'

module GroupDocsConversionCloud
  #
  # GroupDocs.Conversion Cloud API
  #
  class ConvertApi
    attr_accessor :config

    #make ConvertApi.new private 
    private_class_method :new

    # Initializes new instance of ConvertApi
    #
    # @param [config] Configuration 
    # @return [ConvertApi] New instance of ConvertApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      @access_token = nil
    end

    # Initializes new instance of ConvertApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [ConvertApi] New instance of ConvertApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of ConvertApi
    #
    # @param [config] Configuration 
    # @return [ConvertApi] New instance of ConvertApi
    def self.from_config(config)
      return new(config)
    end

    # Converts specified input document to format specified in the convertSettings with specified options
    # 
    # @param request convert_document_request
    # @return [Array<StoredConvertedResult>]
    def convert_document(request)
      data, _status_code, _headers = convert_document_with_http_info(request)
      data
    end

    # Converts specified input document to format specified in the convertSettings with specified options
    # 
    # @param request convert_document_request
    # @return [Array<(Array<StoredConvertedResult>, Fixnum, Hash)>]
    # Array<StoredConvertedResult> data, response status code and response headers
    def convert_document_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? ConvertDocumentRequest

      @api_client.config.logger.debug 'Calling API: ConversionApi.convert_document ...' if @api_client.config.debugging
      # verify the required parameter 'convert_settings' is set
      raise ArgumentError, 'Missing the required parameter convert_settings when calling ConversionApi.convert_document' if @api_client.config.client_side_validation && request.convert_settings.nil?
      # resource path
      local_var_path = '/conversion'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.convert_settings)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: if request.convert_settings.output_path.nil? then 'File' else 'Array<StoredConvertedResult>' end)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        ConversionApi#convert_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end


    # Converts input document file to format specified
    # 
    # @param request convert_document_direct_request
    # @return [File]
    def convert_document_direct(request)
      data, _status_code, _headers = convert_document_direct_with_http_info(request)
      data
    end

    # Converts input document file to format specified
    # 
    # @param request convert_document_direct_request
    # @return [Array<(File, Fixnum, Hash)>]
    # File data, response status code and response headers
    def convert_document_direct_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? ConvertDocumentDirectRequest

      @api_client.config.logger.debug 'Calling API: ConvertApi.convert_document_direct ...' if @api_client.config.debugging
      # verify the required parameter 'format' is set
      raise ArgumentError, 'Missing the required parameter format when calling ConvertApi.convert_document_direct' if @api_client.config.client_side_validation && request.format.nil?
      # verify the required parameter 'file' is set
      raise ArgumentError, 'Missing the required parameter file when calling ConvertApi.convert_document_direct' if @api_client.config.client_side_validation && request.file.nil?
      # resource path
      local_var_path = '/conversion'

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('format')] = request.format

      if local_var_path.include? ('{' + downcase_first_letter('fromPage') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('fromPage') + '}', request.from_page.to_s)
      else
        query_params[downcase_first_letter('fromPage')] = request.from_page unless request.from_page.nil?
      end
      if local_var_path.include? ('{' + downcase_first_letter('pagesCount') + '}')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('pagesCount') + '}', request.pages_count.to_s)
      else
        query_params[downcase_first_letter('pagesCount')] = request.pages_count unless request.pages_count.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params[downcase_first_letter('File')] = request.file
      form_params[downcase_first_letter('loadOptions')] = @api_client.object_to_http_body(request.load_options) unless request.load_options.nil?
      form_params[downcase_first_letter('convertOptions')] = @api_client.object_to_http_body(request.convert_options) unless request.convert_options.nil?

      # http body (model)
      post_body = nil
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        ConvertApi#convert_document_direct\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    #
    # Helper method to convert first letter to downcase
    #
    private def downcase_first_letter(str)
      value = str[0].downcase + str[1..-1]
      value
    end
                 
    #
    # Retrieves access token
    #
    private def get_access_token
        if @access_token.nil? then
          request_access_token
        end
        
        @access_token  
    end

    #
    # Gets a access token from server
    #
    private def request_access_token
        auth_config = Configuration.new(@config.app_sid, @config.app_key)
        auth_config.api_base_url = @config.api_base_url
        auth_config.debugging = @config.debugging
        auth_config.logger = @config.logger
        auth_config.temp_folder_path = @config.temp_folder_path
        auth_config.client_side_validation = @config.client_side_validation
        auth_config.api_version = ''

        auth_api_client = ApiClient.new(auth_config)

        request_url = "/connect/token"
        post_data = "grant_type=client_credentials&client_id=#{@config.app_sid}&client_secret=#{@config.app_key}"

        data, _status_code, _header = auth_api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object')
        
        @access_token = data[:access_token]

        expires_in_seconds = data[:expires_in].to_i - 5 * 60 
        expires_in_days = Rational(expires_in_seconds, 60 * 60 * 24)
        @access_token_expires_at = DateTime.now + expires_in_days
    end
    
    # requires all files inside a directory from current dir
    # @param _dir can be relative path like '/lib' or "../lib"
    private def require_all(_dir)
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/*.rb"].each do |file|
        require file
      end
    end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="convert_document_request.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
 # </copyright>
 # <summary>
 #  Permission is hereby granted, free of charge, to any person obtaining a copy
 #  of this software and associated documentation files (the "Software"), to deal
 #  in the Software without restriction, including without limitation the rights
 #  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 #  copies of the Software, and to permit persons to whom the Software is
 #  furnished to do so, subject to the following conditions:
 # 
 #  The above copyright notice and this permission notice shall be included in all
 #  copies or substantial portions of the Software.
 # 
 #  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 #  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 #  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 #  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 #  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 #  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 #  SOFTWARE.
 # </summary>
 # --------------------------------------------------------------------------------------------------------------------
 #

module GroupDocsConversionCloud

  #
  # Request model for convert_document operation.
  #
  class ConvertDocumentRequest

        # Gets or sets convert_settings
        attr_accessor :convert_settings
	
        #
        # Initializes a new instance.
        # @param convert_settings 
        def initialize(convert_settings)
           self.convert_settings = convert_settings
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="convert_document_direct_request.rb">
 #   Copyright (c) 2003-2022 Aspose Pty Ltd
 # </copyright>
 # <summary>
 #  Permission is hereby granted, free of charge, to any person obtaining a copy
 #  of this software and associated documentation files (the "Software"), to deal
 #  in the Software without restriction, including without limitation the rights
 #  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 #  copies of the Software, and to permit persons to whom the Software is
 #  furnished to do so, subject to the following conditions:
 # 
 #  The above copyright notice and this permission notice shall be included in all
 #  copies or substantial portions of the Software.
 # 
 #  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 #  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 #  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 #  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 #  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 #  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 #  SOFTWARE.
 # </summary>
 # --------------------------------------------------------------------------------------------------------------------
 #

module GroupDocsConversionCloud

  #
  # Request model for convert_document_direct operation.
  #
  class ConvertDocumentDirectRequest

        # Requested conversion format
        attr_accessor :format
        # Input file to convert
        attr_accessor :file
        # Page start conversion from
        attr_accessor :from_page
        # Number of pages to convert
        attr_accessor :pages_count
        # Input file load options
        attr_accessor :load_options
        # Conversion options
        attr_accessor :convert_options
	
        #
        # Initializes a new instance.
        # @param format Requested conversion format
        # @param file Input file to convert
        # @param from_page Page start conversion from
        # @param pages_count Number of pages to convert
        # @param load_options Input file load options
        # @param convert_options Conversion options
        def initialize(format, file, from_page = nil, pages_count = nil, load_options = nil, convert_options = nil)
           self.format = format
           self.file = file
           self.from_page = from_page
           self.pages_count = pages_count
           self.load_options = load_options
           self.convert_options = convert_options
        end
  end
end
