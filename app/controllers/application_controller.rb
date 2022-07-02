class ApplicationController < ActionController::Base
    def hello
        render html: "hello, ruby!"
    end 
end
