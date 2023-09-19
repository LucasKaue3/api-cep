# Projeto de Exemplo Cucumber Ruby

Este é um projeto de exemplo em Ruby que utiliza o framework Cucumber para automação de testes de API. Este projeto demonstra como configurar e executar testes automatizados em Ruby com Cucumber, vale lembrar que esse projeto é só um modelo baseado em um sistema de busca de cep de uma prova realizada e não foi executado de fato os testes.

## Pré-requisitos

- Ruby 3.1.3p185: Certifique-se de que você tenha o Ruby instalado em sua máquina com a versão 3.1.3p185. Você pode verificar a versão do Ruby com o seguinte comando:

ruby -v

- Bundler: É altamente recomendável que você tenha o Bundler instalado para gerenciar as dependências do Ruby. Você pode instalar o Bundler com o seguinte comando:

gem install bundler

## Configuração do Projeto

1. Clone este repositório em sua máquina local:

git clone <URL do repositório>

2. Navegue até o diretório do projeto:

cd api_cep

3. Instale as dependências do projeto usando o Bundler:

bundle install

## Executando os Testes

Para executar os testes automatizados, você pode usar os perfis definidos em seu projeto. Aqui estão alguns exemplos de como executar os testes com diferentes perfis, lembrando que esses comandos também geram relatórios no fim da execução:

- **Ambiente de Desenvolvimento (Dev):**

cucumber -p api_dev

- **Ambiente de Qualidade (QA):**

cucumber -p api_qa

Você também pode controlar a execução de cenários específicos usando tags. Por exemplo, se você deseja executar apenas os cenários marcados com a tag `@cep_valido`, você pode fazer o seguinte:

cucumber -p api_qa --tags @cep_valido
