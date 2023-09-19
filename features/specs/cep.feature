#language: pt

@cep
Funcionalidade: Busca de cep

Contexto:
  Dado que realize a autenticação do token

  @cep_valido
  Esquema do Cenario: Consulta de CEP Válido
    Dado que o usuário faz uma solicitação GET para consultar um CEP <cep> válido
    Então o status da resposta deve ser <status_code>

  Exemplos:
    |    cep      | status_code |
    | "06414000"  | "200"       |

  @cep_invalido
  Esquema do Cenario: Consulta de CEP Inválido
    Dado que o usuário faz uma solicitação GET para consultar um CEP <cep> inválido
    Então o status da resposta deve ser <status_code>
  Exemplos:
    |    cep      | status_code |
    | "06414000"  | "404"       |

  @consulta_enderecos_consultados
  Esquema do Cenario: Consulta de Endereços Consultados
    Quando o usuário faz uma solicitação GET para listar os endereços consultados
    E o status da resposta deve ser <status_code>
  Exemplos:
    | status_code |
    | "200"       |

  @filtro_enderecos_consultados
  Esquema do Cenario: Filtro de Endereços Consultados
    Quando o usuário faz uma solicitação GET para listar os endereços consultados com filtros por bairro <bairro>
    E o status da resposta deve ser <status_code>
  Exemplos:
    | status_code | bairro    |
    | "200"       | "Jardim"  |

  @paginacao_enderecos_consultados
  Esquema do Cenario: Paginação de Endereços Consultados
    Quando o usuário faz uma solicitação GET para listar os endereços consultados com paginação <paginas> com <resultados> resultados por página
    E o status da resposta deve ser <status_code>
  Exemplos:
    | status_code | paginas | resultados |
    | "200"       | "2"     | "10"       |
