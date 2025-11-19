# 👣 Primeiros Passos com Terraform e Huawei Cloud

🔙 Voltar ao [README](../README.pt.md).

🌐 **Idioma**: [English](./FIRST_STEPS.md) | **Português**

- [👣 Primeiros Passos com Terraform e Huawei Cloud](#-primeiros-passos-com-terraform-e-huawei-cloud)
  - [💿 Instalação do Terraform](#-instalação-do-terraform)
    - [Windows](#windows)
    - [Ubuntu/Debian](#ubuntudebian)
  - [🔑 Criando uma chave de acesso (AK e SK)](#-criando-uma-chave-de-acesso-ak-e-sk)
  - [👩‍💻 Comandos principais do Terraform](#-comandos-principais-do-terraform)
  - [😣 Diagnóstico de problemas](#-diagnóstico-de-problemas)

## 💿 Instalação do Terraform

Instale o Terraform: <https://developer.hashicorp.com/terraform/install>

### Windows

Abra o PowerShell e execute o comando `winget install HashiCorp.Terraform`.

```plain
PS C:\> winget install HashiCorp.Terraform
Found HashiCorp Terraform [Hashicorp.Terraform] Version 1.13.5
This application is licensed to you by its owner.
Microsoft is not responsible for, nor does it grant any licenses to, third-party packages.
Downloading https://releases.hashicorp.com/terraform/1.13.5/terraform_1.13.5_windows_amd64.zip
  ██████████████████████████████  28.9 MB / 28.9 MB
Successfully verified installer hash
Extracting archive...
Successfully extracted archive
Starting package install...
Path environment variable modified; restart your shell to use the new value.
Command line alias added: "terraform"
Successfully installed
PS C:\>
```

Feche o PowerShell, abra-o novamente, e o comando `terraform` deve estar
disponível. Execute o comando `terraform version` para confirmar que o
Terraform está instalado. Você deve ver algo como:

```plain
PS C:\> terraform version
Terraform v1.13.5
on windows_amd64
PS C:\>
```

### Ubuntu/Debian

Execute os seguintes comandos:

```sh
sudo apt update && sudo apt install -y gnupg software-properties-common

wget -O - https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install -y terraform
```

Execute o comando `terraform version` para confirmar que o Terraform foi
instalado. Você deve ver algo assim:

```plain
$ terraform version
Terraform v1.13.5
on linux_amd64
```

## 🔑 Criando uma chave de acesso (AK e SK)

Uma chave de acesso é composta por uma **access key ID (AK)** e uma
**secret access key (SK)**, e é usada como uma credencial de identidade de
longo prazo para assinar suas requisições para as APIs da Huawei Cloud (feitas
pelo provider do Terraform). O AK é usado junto com o SK para assinar
requisições criptograficamente, garantindo que as requisições sejam secretas,
completas, e corretas. Para mais detalhes, consulte a
[documentação de Chaves de Acesso](https://support.huaweicloud.com/intl/en-us/usermanual-ca/ca_01_0003.html)

Para criar uma chave de acesso para sua conta Huawei Cloud, faça primeiro o
login no [Console da Huawei Cloud](https://console-intl.huaweicloud.com/).

1. Passe o mouse em cima do seu nome de usuário no canto superior direito (A)
   e clique em "My Credentials" (B) no menu dropdown;

    ![Opção "My Credentials" (B) abaixo do nome de usuário (A)](img/my-credentials.png)

2. No menu à esquerda, clique em "Access Keys" e em seguida clique em "Create
   Access Key";

    ![Opção "Access Keys" (C) no menu à esquerda e botão "Create Access Key" (D)](img/create-access-key.jpg)

3. Forneça uma descrição (optional) (E) e depois clique em "OK" (F);

    ![Forneça uma descrição (optional) (E) e depois clique em "OK" (F)](img/new-access-key-modal.jpg)

4. Clique em "Download" (G) na mensagem seguinte. Um arquivo chamado
  `credentials.csv` será baixado;

   ![Botão "Download" (G) mostrado após criar a chave de acesso](img/access-key-download.jpg)

5. Abra o arquivo `credentials.csv` no Bloco de Notas. Ele deve ter o seguinte
   layout:

    ```plain
    User Name,Access Key Id,Secret Access Key
    "username",**********,##########
    ```

6. Na segunda linha, a segunda parte é a Access Key (AK), e a terceira parte é
   a Secret Key (SK).

## 👩‍💻 Comandos principais do Terraform

`terraform init` - Inicializa o provider e os módulos do Terraform

`terraform fmt` - Formata o código automaticamente

`terraform validate` - Verifica se o código está correto

`terraform plan` - Verificar o que será executado pelo Terraform

`terraform apply` - Executa as modificações na infraestrutura

`terraform graph > graph.txt` - Gera uma descrição da infraestrutura em formato
de grafo (DOT language), e salva no arquivo `graph.txt`. Você pode usar o site
<https://dreampuf.github.io/GraphvizOnline/> para visualizar o grafo.

## 😣 Diagnóstico de problemas

Caso você encontre alguma mensagem de erro que não seja clara, ou se você
identificou algum problema durante o uso do provider, é possível fazer com que
o Terraform gere logs para debug ao configurar as variáveis de ambiente
`TF_LOG` e `TF_LOG_PATH`.

Se estiver usando Windows, execute os seguintes comandos no PowerShell:

```powershell
$Env:TF_LOG="DEBUG"
$Env:TF_LOG_PATH="tf_log.txt"
```

Se estiver usando Linux, execute os seguintes comandos no Shell:

```bash
export TF_LOG="DEBUG"
export TF_LOG_PATH="tf_log.txt"
```

Em seguida, execute o comando Terraform novamente. Os logs para debug serão
salvos no arquivo `tf_log.txt`. Note que essa configuração de debug só se
aplica para o mesmo terminal no qual as variáveis de ambiente foram
configuradas.
