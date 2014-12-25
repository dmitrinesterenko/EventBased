#
#  Be sure to run `pod spec lint EventBased.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "EventBased"
  s.version      = "0.0.1"
  s.summary      = "A very simple event module for registering and triggering events."

  s.description  = <<-DESC
  Example
  =======
   Initialize an event marshall somewhere on high in your application stack.	
   ```swift
   class EventBased{
	let events = Marshall()
   }
   ```
   Anywhere where you want to listen and react to events such as network request complete:
   ```swift
   class View < EventBased {
    init(){
	events.on("data_json.ready", instance: self, method: View.update)
    }
    ...
    // Please call this method when you are done downloading the data 
    func update(data:JSON){
           
    }
   }
   ```
   Trigger the event when you are ready:

   ```swift
   import swiftHTTP

   class DataGetter < EventBased{
        var request = HTTPTask()
	func get(url){
	   request.GET(url, parameters: nil,
            success: {
                (response: HTTPResponse) in
                if let data = response.responseObject as? NSData! {
                    var json : JSON
                    json = JSON(data:data)
                    events.trigger("data_json.ready", parameters:json) 
                }
            },
            failure: {
                (error: NSError, response: HTTPResponse?) in
                println("error: \(error)")
            }
        )  		
        }

   } 
   ```
   
  Reasoning
  =======

	I looked for a very basic event dispatch system in pure Swift. The pattern I had ended up with prior to this was passing around callbacks. This works fine when there is only one callback with each action. An example of this is fetch data from a url then call a method to refresh a view with the JSON data. But what if I want to map the JSON to a model first and only after call the view? Well that's fine but the model mapping will have to be done in the same place as the success handler of the url fetch operation. It was becoming too entangled where the url fetcher would then "know" about building of each data model.
 
  Attribution
  ===========
  This is a completely basterdized simplification of the target action pattern that I read about through [this](http://oleb.net/blog/2014/07/swift-instance-methods-curried-functions/) amazing blog post by Ole Begemann.     

DESC

  s.homepage     = "http://github.com/dmitrinesterenko/EventBased"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  #s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "dmitrinesterenko" => "dmitri.nesterenko@gmail.com" }
  # Or just: s.author    = "dmitrinesterenko"
  # s.authors            = { "dmitrinesterenko" => "dmitri.nesterenko@gmail.com" }
  # s.social_media_url   = "http://twitter.com/dmitrinesterenko"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "http://github.com/dmitrinesterenko/EventBased.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any h, m, mm, c & cpp files. For header
  #  files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
