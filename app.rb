#repositorio onde se encontra a documentação https://github.com/rmagick/rmagick
#importando biblioteca do sinatra
require 'sinatra'

IMG_DIR = {}
Dir['./public/escudos_*'].each do |pasta|
	pasta_sem_pub = pasta.gsub('./public/','')
	IMG_DIR[pasta_sem_pub] = pasta
end

get '/' do	
	@img_dirs = IMG_DIR
	erb :index
end

get '/:tamanho' do
	if IMG_DIR.keys.include? params[:tamanho]

		@classe_tamanho = params[:tamanho]

		@nome_escudos = Dir["#{IMG_DIR[params[:tamanho]]}/*png"].map do |filename|
			filename.gsub!('./public/','')		 

			{				
				nome: filename.gsub("#{params[:tamanho]}/", ""),
				img: filename
			}
		
		end	

		erb :escudos
	else
	  "Nao existe este tamanho - #{params[:tamanho]}"
	end
end





