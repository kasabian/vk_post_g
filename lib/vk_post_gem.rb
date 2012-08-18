require "vk_post_gem/version"
#require 'rubygems'
require 'mechanize'
require 'hpricot'


module VkPostGem
 
     class VK
        attr_reader :agent, :avt  
       def initialize
           @agent= Mechanize.new
            
       end

       
       def avtorize (name,pass)
        raise ArgumentError  if (name == nil)||(pass == nil) 
        raise ArgumentError if (name.class != String)||(pass.class != String)
        #***************Если все норм пытаюсь авторизоваться*****************************
        page = @agent.get 'http://m.vk.com'
        form = page.forms.first # первая форма, которая встретится на странице
	form.email = name.to_s # см. атрибут name в HTML
	form.pass = pass.to_s

	page = agent.submit form # отправляем

        	page.search("div[@class='warn'] b").each do |string|
                 return false  if string.inner_text.to_s == "Login failed." 
         	end

                
          page = @agent.get 'http://m.vk.com'
               page.search("a[@class='user']").each do |string|
                 return @avt=true  if string != 0 
         	end
  


       end

      def get_friend_id
         a=Array.new
         page = @agent.get 'http://m.vk.com/friends'
        
          page.search("div[@class='cont'] a[@class='user']").each do |string|
             temp1= /\">/ =~ string.to_s
             a.push(string.to_s[23,temp1-23])
            
          end      



       return a
      end


       def get_post (id)
         
         raise ArgumentError  if (id == nil)
         raise ArgumentError if (id.class != String)
         #return "no avtorize" if @avt != true
         a=["","",""]
         
         url="http://m.vk.com/"+id 
 #*****************ловлю ошибки если нет тяну инфу с поста********************      
         begin
          page = @agent.get url

   a[0]=page.search("div[@class='cont'] div[@class='ch'] div a").first.inner_text
   a[1]=page.search("div[@class='cont'] div[@class='cc'] div[@class='text']").first.inner_text
   a[2]=page.search("div[@class='cont'] div[@class='cc'] div[@class='info'] a").first.inner_text
 
 
       return a


         rescue
          return false
         end
#*****************************************************
         # return a           
       end


      def set_post (id,text)
        raise ArgumentError  if (id == nil)||(text == nil) 
        raise ArgumentError if (id.class != String)||(text.class != String)
  	
        begin
          a = agent.get 'http://m.vk.com/'+id
		  form = a.forms.first 
          form.message=text
          agent.submit form
          return true       
rescue
  return false
end        

         
 
      end 



    end
   
end




 
