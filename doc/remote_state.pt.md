# Configurando Armazenamento de Estado Remoto no Terraform

🔙 Voltar ao [README](../README.pt.md).

🌐 **Idioma**: [English](./remote_state.md) | **Português**

- [Configurando Armazenamento de Estado Remoto no Terraform](#configurando-armazenamento-de-estado-remoto-no-terraform)
  - [Introdução](#introdução)
  - [Primeiros Passos](#primeiros-passos)
    - [Bucket do OBS e credenciais de acesso](#bucket-do-obs-e-credenciais-de-acesso)
    - [Carregamento de variáveis de ambiente](#carregamento-de-variáveis-de-ambiente)
  - [Como está implementado neste boilerplate](#como-está-implementado-neste-boilerplate)
  - [Quero armazenar meu arquivo de estado localmente](#quero-armazenar-meu-arquivo-de-estado-localmente)
  - [Referências](#referências)

## Introdução

Por padrão, o Terraform armazena o estado localmente em um arquivo chamado
`terraform.tfstate` (Terraform state file). Ao trabalhar com o Terraform em
equipe, o uso de um arquivo local torna o uso do Terraform complicado, pois
cada usuário deve garantir que sempre tenha os dados de estado mais recentes
antes de executar o Terraform e garantir que ninguém mais execute o Terraform
ao mesmo tempo.

Com o estado remoto, o Terraform grava os dados de estado em um armazenamento
de dados remoto, que pode ser compartilhado entre todos os membros da equipe.
O Terraform suporta armazenar o estado no Terraform Cloud, HashiCorp Consul,
Amazon S3, Azure Blob Storage, Google Cloud Storage, etcd e mais.

Como o [Huawei Cloud OBS][obs] (Object Storage Service) pode ser compatível
com a interface AWS S3, e o back-end Amazon S3 suporta endpoints
personalizados, podemos usar o back-end S3 para armazenar arquivos de estado
no Huawei Cloud OBS.

## Primeiros Passos

Se é a primeira vez que você está implementando o boilerplate, faça o seguinte:

### Bucket do OBS e credenciais de acesso

Se você já tem um bucket do OBS e credenciais de acesso:

1. Faça uma cópia do arquivo `.env.example` chamado `.env` e atualize com o
   Access Key (AK) e a Secret Access Key (SK) com permissões de
   leitura/gravação no bucket do OBS;
2. Atualize o arquivo `remote-state.tf` com os detalhes do seu bucket OBS.

Caso contrário, se desejar criar um novo bucket do OBS para armazenar o
arquivo de estado:

1. Temporariamente altere a extensão do arquivo `remote-state.tf` para
   outra coisa, para que ele não seja processado na primeira execução do
   Terraform;
2. Escolha um nome de bucket do OBS globalmente único para armazenar seu
   arquivo de estado e atualize o valor da variável
   `obs_remote_state_bucket_name` no arquivo `terraform.tfvars`;
3. Execute `terraform init` e `terraform apply` para criar o bucket do OBS e
   a AK/SK para acessá-lo;
4. Faça uma cópia do arquivo `.env.example` chamado `.env` e atualize a
   Access Key (AK) e a Secret Access Key (SK) com os valores gravados no
   arquivo `output/obs-credentials.csv`;
5. Desfaça a alteração da extensão do arquivo `remote-state.tf` e atualize-o
   com os detalhes do seu bucket OBS.

### Carregamento de variáveis de ambiente

Após configurar o armazenamento de estado remoto de acordo com as etapas da
seção anterior, carregue as variáveis de ambiente dependendo do seu sistema
operacional:

- Se estiver no Windows, execute `..\Set-EnvVars.ps1`;
- Se estiver no Linux, execute `. set-env-vars.sh`;

Após carregar as variáveis de ambiente, execute os comandos `terraform` como
de costume.

## Como está implementado neste boilerplate

O arquivo `remote-state.tf` contém a configuração necessária para armazenar o
arquivo de estado do Terraform em um bucket do Huawei Cloud OBS.

As variáveis de ambiente necessárias são definidas usando o arquivo `.env`,
que deve ser derivado do arquivo `.env.example`.

O módulo `obs-remote-state` cria os recursos necessários do Huawei Cloud:

- Usuário IAM com acesso programático;
- Arquivo de credenciais `output/obs-credentials.csv` com AK/SK deste
  usuário IAM;
- Bucket do OBS para armazenamento do arquivo de estado remoto do Terraform;
- Política de bucket do OBS permitindo permissão de leitura/gravação para o
  usuário IAM criado.

Se você já tem um bucket do OBS e uma AK/SK para ler/gravar arquivos no bucket,
basta remover a pasta `modules/obs-remote-state` e também remover o código do
módulo do `remote-state.tf`.

## Quero armazenar meu arquivo de estado localmente

Nesse caso, basta remover a pasta `modules/obs-remote-state` e o arquivo
`remote-state.tf`.

## Referências

Configurar Back-end de Estado Remoto para HuaweiCloud:
<https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/guides/remote-state-backend>

[obs]: <https://support.huaweicloud.com/intl/en-us/obs/index.html>
