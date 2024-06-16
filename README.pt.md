# Huawei Cloud Terraform Boilerplate

<!-- markdownlint-disable MD033 -->
<a href="https://www.huaweicloud.com/intl/pt-br" target="_blank">
  <img src="https://console-static.huaweicloud.com/static/authui/20210202115135/public/custom/images/logo-en.svg"
    alt="Huawei Cloud" width="450px" height="102px">
</a>

🌐 **Idioma**: [English](./README) | **Português**

Este projeto contém uma estrutura mínima para projetos Terraform usando o
provider da Huawei Cloud, seguindo algumas práticas e referências encontradas
na internet (listadas ao final).

Veja a [documentação do provider Terraform da Huawei Cloud](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs)
para saber quais recursos estão disponíveis e como usá-los.

## [👣 Primeiros Passos](./doc/FIRST_STEPS.pt)

Se você está começando com Terraform agora, leia os
[Primeiros Passos](./doc/FIRST_STEPS.pt).

## 📃 Estrutura

- `main.tf` - arquivo principal
- `variables.tf` - definições de variáveis (variable)
- `outputs.tf` - definições de saídas (output)
- `providers.tf` - lista os providers utilizados, versões e configurações
- `terraform.tfvars` - derivado do arquivo `terraform.tfvars.example`, contém
  valores para as variáveis. Este arquivo não é registrado no repositório.

## ✒ Convenção de Estilo

De forma a manter a consistência entre os diferentes arquivos do projeto, siga
algumas convenções:

- Use 2 espaços para indentação;
- Alinhe os sinais de igual (=) dentro de um bloco;
- Use linhas vazias para separar blocos;
- Use apenas letras minúsculas, dígitos e underscores (`_`) nos identificadores
  dos recursos. Não use hífens (`-`).

Com exceção dos identificadores, todas as outras convenções são aplicadas
automaticamente ao executar o comando `terraform fmt`.

## 🔍 Referências

- Terraform's [Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- Digital Ocean's [How To Structure a Terraform Project](https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project)
- Terraform's [Style Conventions](https://developer.hashicorp.com/terraform/language/syntax/style)
- Google Cloud's [Best practices for using Terraform](https://cloud.google.com/docs/terraform/best-practices-for-terraform)
