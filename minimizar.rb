#Para utiliar esta classe de redimensionamento de imagem é necessario ter o Rmagick
#segue o link no github , dentro dele tem a documentação de como 
#se utiliza a biblioteca


#importando bibliotaca
require "RMagick"
include Magick


#caminho dos arquivos 
#arquivo das imagens originais, descomente linha abaixo caso va utilizar este arquivo
#IMG_DIR = './escudos-footstats'

#arquivos de saida
#sempre crie uma pasta nova para saida, descomente a linha abaixo caso va utilizar este arquivo
#OUT_DIR  = './escudos_30'

#lista das imagens
array_imagem = []

#armazenando todos os escudos do time no array
Dir["#{IMG_DIR}/*png"].each {|x| array_imagem << "#{x}"}

array_imagem.each do |novo_escudo|
	#imagens que estao sendo resimensionada
	puts "#{IMG_DIR}/#{novo_escudo}"
	#iniciando o objeto rmagick
	imagem = ImageList.new("#{novo_escudo}")
	#escolhendo o tamanho do arquivo a ser redimensionado
	imagem_minimizada = imagem.resize(30, 30)	
	#tratamento para remover o caminho inicial da pasta
	novo_escudo = novo_escudo.gsub("./escudos-footstats/", "")
	#nome da nova imagem e ao mesmo tempo salva o novo arquivo
	imagem_minimizada.write("#{OUT_DIR}/#{novo_escudo}")
end




