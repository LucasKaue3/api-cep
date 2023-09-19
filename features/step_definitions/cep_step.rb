Dado('que realize a autenticação do token') do
  cep.request_autenticar_token
  cep.post_autenticar_token
end

Dado('que o usuário faz uma solicitação GET para consultar um CEP {string} válido') do |cep|
  cep.get_consulta_cep(cep)
end

Dado('que o usuário faz uma solicitação GET para consultar um CEP {string} inválido') do |cep|
  cep.get_consulta_cep(cep)
end

Quando('o usuário faz uma solicitação GET para listar os endereços consultados') do
  cep.get_listar_enderecos_consultados
end

Quando('o usuário faz uma solicitação GET para listar os endereços consultados com filtros por bairro {string}') do |dado|
  cep.listar_enderecos_filtrados_por_bairro(dado)
end

Quando('o usuário faz uma solicitação GET para listar os endereços consultados com paginação {string} com {string} resultados por página') do |pagina, resultados_por_pagina|
  cep.listar_enderecos_com_paginacao(pagina, resultados_por_pagina)
end
