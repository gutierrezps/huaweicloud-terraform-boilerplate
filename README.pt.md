# Huawei Cloud Terraform Boilerplate

🌐 **Idioma**: [English](./README.md) | **Português**

<!-- markdownlint-disable MD033 -->
<a href="https://www.huaweicloud.com/intl/pt-br" target="_blank">
  <img src="https://console-static.huaweicloud.com/static/authui/20210202115135/public/custom/images/logo-en.svg"
    alt="Huawei Cloud" width="450px" height="102px">
</a>

Este projeto contém uma estrutura mínima para projetos [Terraform][terraform]
usando o provider da [Huawei Cloud][hwc], seguindo algumas práticas e
referências encontrada na internet (listadas ao final).

Veja a [documentação do provider Terraform da Huawei Cloud][hwc-provider] para
saber quais recursos estão disponíveis e como usá-los.

- [Huawei Cloud Terraform Boilerplate](#huawei-cloud-terraform-boilerplate)
  - [👣 Primeiros Passos](#-primeiros-passos)
  - [📋 Estrutura](#-estrutura)
  - [✒ Convenções de Estilo](#-convenções-de-estilo)
  - [🔍 Referências](#-referências)

## [👣 Primeiros Passos](./doc/FIRST_STEPS.pt.md)

Se você está começando com Terraform agora, leia os
[Primeiros Passos](./doc/FIRST_STEPS.pt.md).

Após baixar este repositório ou cloná-lo para sua máquina, faça uma cópia do
arquivo `terraform.tfvars.example`, renomeando-o para `terraform.tfvars`, e
atualize os valores das variáveis (`hwc_access_key`, `hwc_secret_key` e
`default_password`).

Se desejar armazenar o arquivo de estado remotamente, consulte a seção
**Primeiros Passos** da documentação
[Configuração de Estado Remoto](./doc/remote_state.pt.md).

Após configurar o armazenamento remoto de estado, carregue as variáveis de
ambiente de acordo com o seu sistema operacional:

- Se estiver no Windows, execute `..\Set-EnvVars.ps1`;
- Se estiver no Linux, execute `. set-env-vars.sh`;

Caso contrário, se não desejar usar o armazenamento remoto de estado, remova a
pasta `modules/obs-remote-state` e o arquivo `remote-state.tf`.

Finalmente, execute os comandos `terraform plan` / `terraform apply`.

## 📋 Estrutura

- `main.tf` - arquivo principal;
- `variables.tf` - definições de variáveis (variable);
- `outputs.tf` - definições de saídas (output);
- `providers.tf` - lista os providers utilizados, versões e configurações;
- `remote-state.tf` - Arquivo de configuração do Terraform para
  [armazenamento remoto de estado](./doc/remote_state.md), que requer
  variáveis de ambiente definidas pelo arquivo `.env` (derivado do arquivo
  `.env.example`);
- `terraform.tfvars` - derivado do arquivo `terraform.tfvars.example`, contém
  valores para as variáveis. Este arquivo não é registrado no repositório.

## ✒ Convenções de Estilo

De forma a manter a consistência entre os diferentes arquivos do projeto, siga
algumas convenções:

- Use 2 espaços para indentação;
- Alinhe os sinais de igual (=) dentro de um bloco;
- Use linhas vazias para separar blocos;
- Use apenas letras minúsculas, dígitos e underscores (`_`) nos identificadores
  dos blocos. Não use hífens (`-`).

Com exceção dos identificadores, todas as outras convenções são aplicadas
automaticamente ao executar o comando `terraform fmt`.

## 🔍 Referências

- Terraform's [Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- Digital Ocean's [How To Structure a Terraform Project](https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project)
- Terraform's [Style Conventions](https://developer.hashicorp.com/terraform/language/syntax/style)
- Google Cloud's [Best practices for using Terraform](https://cloud.google.com/docs/terraform/best-practices-for-terraform)

[terraform]: <https://developer.hashicorp.com/terraform/docs>
[hwc]: <https://www.huaweicloud.com/intl/pt-br>
[hwc-provider]: <https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs>
