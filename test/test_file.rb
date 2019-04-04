#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_file.rb">
#    Copyright (c) 2003-2019 Aspose Pty Ltd
# </copyright>
# <summary>
#   Permission is hereby granted, free of charge, to any person obtaining a copy
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
    class TestFile
        attr_accessor :file_name;
        attr_accessor :folder;
        attr_accessor :password;
        
        def path
            folder + file_name
        end

        def file_info
            info = FileInfo.new
            info.file_path = path
            info.password = password
            info
        end        

        def self.one_page_docx
            f = TestFile.new
            f.file_name = "one-page.docx"
            f.folder = "words\\docx\\"
            f
        end

        def self.not_exist
            f = TestFile.new
            f.file_name = "notexist.docx"
            f.folder = "some-folder\\"
            f
        end

        def self.password_protected_docx
            f = TestFile.new
            f.file_name = "password-protected.docx"
            f.folder = "words\\docx\\"
            f.password = "password"
            f
        end

        def self.two_hidden_pages_vsd
            f = TestFile.new
            f.file_name = "two-hidden-pages.vsd"
            f.folder = "diagram\\vsd\\"
            f
        end

        def self.with_hidden_rows_and_columns
            f = TestFile.new
            f.file_name = "with-hidden-rows-and-columns.xlsx"
            f.folder = "cells\\xlsx\\"
            f
        end        

        def self.three_layouts_dwf
            f = TestFile.new
            f.file_name = "three-layouts.dwf"
            f.folder = "cad\\dwf\\"    
            f
        end

        def self.project_mpp
            f = TestFile.new
            f.file_name = "sample.mpp"
            f.folder = "project\\mpp\\"
            f
        end

        def self.uses_custom_font_pptx
            f = TestFile.new
            f.file_name = "uses-custom-font.pptx"
            f.folder = "slides\\pptx\\"
            f
        end

        def self.font_ttf
            f = TestFile.new
            f.file_name = "foo.ttf"
            f.folder = "font\\ttf\\"
            f
        end

        def self.four_pages_docx
            f = TestFile.new
            f.file_name = "four-pages.docx"
            f.folder = "words\\docx\\"
            f
        end


        def self.test_files_list
            [
                self.one_page_docx,
                self.password_protected_docx,
                self.two_hidden_pages_vsd,
                self.with_hidden_rows_and_columns,
                self.three_layouts_dwf,
                self.project_mpp,
                self.uses_custom_font_pptx,
                self.font_ttf,
                self.four_pages_docx
            ]        
        end
    end
end