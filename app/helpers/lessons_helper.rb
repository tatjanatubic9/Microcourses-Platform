module LessonsHelper
    def embed(youtubeurl)
        
        youtube_id = parse_youtube youtubeurl
        content_tag(:iframe,nil, src: "//www.youtube.com/embed/#{youtube_id}", class: "embed-responsive-item")
    end
    
    def parse_youtube url
       regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
       url.match(regex)[1]
    end
end
