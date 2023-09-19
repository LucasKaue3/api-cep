# encode: UTF-8

class Cep

  # Método para realizar a autenticação do token

 ########## REQUEST ##########

 def request_autenticar_token
   $request = {
     data: {
          email: "admin@email.com",
          password: "password"
        }
   }
 end

 ########## END REQUEST ##########

 ########## POST ##########

 def post_autenticar_token
   $response = HTTParty.post(
      $url_cep[$env] + '/api/v1/access_tokens',
      body: $request.to_json,
      headers: { "Content-Type": "application/json", Authorization: "CepApi-Token api_key=1:zip_api_key" }
    )
    if $response.code == 200
      # Simulando o retorno do token e armazenando na váriavel global $token para que eu possa chamar em qualquer método durante a execução
      $token = response.parsed_response['data']['token']
      return $token
    else
      raise StandardError, "Erro ao autenticar o token: #{$response.code}"
    end

 end

 ########## END POST ##########

 ########## GET ##########

 # Método para realizar uma solicitação GET para consultar um CEP válido
 def get_consulta_cep(cep)
   $response = HTTParty.get(
      $url_cep[$env] + "/api/v1/zip_accesses/#{cep}",
      body: $request.to_json,
      headers: { "Content-Type": "application/json", Authorization: "Bearer #{$token}" }
    )

    if $response.code == 200
      # O CEP foi encontrado, pode processar a resposta aqui
      return $response.parsed_response
    elsif response.code == 404
      # O CEP não foi encontrado
      p "CEP #{cep} não foi encontrado"
      return nil
    else
      raise StandardError, "Erro ao consultar o CEP: #{$response.code}"
    end
 end

 # Método para listar os endereços consultados
 def get_listar_enderecos_consultados
   $response = HTTParty.get(
      $url_cep[$env] + '/api/v1/zip_accesses',
      body: $request.to_json,
      headers: { "Content-Type": "application/json", Authorization: "Bearer #{$token}" }
    )

    if $response.code == 200
      # Os endereços foram listados com sucesso, pode processar a resposta aqui
      return $response.parsed_response
    else
      raise StandardError, "Erro ao listar endereços consultados: #{$response.code}"
    end
 end

 # Método para listar os endereços consultados com filtros por bairro
 def listar_enderecos_filtrados_por_bairro(dado)
   $response = HTTParty.get(
      $url_cep[$env] + "/api/v1/zip_accesses/?q[neighborhood_start]=#{dado}",
      body: $request.to_json,
      headers: { "Content-Type": "application/json", Authorization: "Bearer #{$token}" }
    )

    if $response.code == 200
      # Os endereços foram listados com sucesso, pode processar a resposta aqui
      return $response.parsed_response
    else
      raise StandardError, "Erro ao listar endereços por bairro: #{$response.code}"
    end
 end

 # Método para listar os endereços consultados com paginação
 def listar_enderecos_com_paginacao(pagina, resultados_por_pagina)
   $response = HTTParty.get(
      $url_cep[$env] + "/api/v1/zip_accesses",
      body: $request.to_json,
      headers: { "Content-Type": "application/json", Authorization: "Bearer #{$token}" },
      query: { "page": pagina, "per": resultados_por_pagina }
    )

    if $response.code == 200
      return $response.parsed_response
    else
      raise StandardError, "Erro ao listar endereços paginados: #{$response.code}"
    end
 end

end
