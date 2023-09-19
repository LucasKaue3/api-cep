def verificar_status_resposta(status_code)
  raise ArgumentError, "Código esperado #{status_code}, código obtido #{$response.code}" if status_code != $response.response.code
end
