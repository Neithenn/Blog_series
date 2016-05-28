class Contact < MailForm::Base

  
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,      :validate => true
  attribute :name,      :validate => true
  attribute :username,      :captche => true

  	def headers 
		  {
		  	:subject => "Juego de teorias",
		  	:to => "ezequiel.r26@gmail.com",
		  	:from => %("#(name)"<#{email}>)

		  } 
	end

end