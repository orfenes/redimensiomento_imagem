require 'sinatra'

IMG_DIR = '/Users/ottohenrique/Dropbox/pics'

get '/:id/:metodo' do
  if params[:metodo] == 'excluir'
    "vc quer apagar o #{params[:id]}"
  elsif params[:metodo] == 'editar'
    "vc quer editar o #{params[:id]}"
  else
    "vc nao sabe o que quer"
  end
end

get '/' do
  files = Dir["#{IMG_DIR}/*.jpg"].join('<br>')

  "<html><body>#{files}</body></html>"
end
