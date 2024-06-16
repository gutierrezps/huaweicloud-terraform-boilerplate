# 👣 Primeiros Passos com Huawei Cloud Terraform

🔙 Voltar ao [README](../README.pt.md).

🌐 **Idioma**: [English](./FIRST_STEPS.md) | **Português**

## Instalação

Instale o Terraform: <https://developer.hashicorp.com/terraform/install>

### Windows

1. Baixe o arquivo zip;
2. Extraia o arquivo `terraform.exe` nesta pasta, na pasta `C:\Windows` (ou em
   outra pasta que esteja no path do sistema operacional);
3. Abra o Prompt de Comando ou o PowerShell e execute `terraform.exe -version`
   para confirmar que foi instalado com sucesso.

## Ubuntu/Debian

Execute os seguintes comandos:

```sh
sudo apt update && sudo apt install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install -y terraform
```

Verifique se o Terraform foi instalado:

```sh
terraform -version
```

## Criando uma chave de acesso (AK e SK)

Uma chave de acesso compreende uma **access key ID (AK)** e uma
**secret access key (SK)**, e é usado como uma credencial de identidade de
longo prazo para assinar suas requisições para as APIs da Huawei Cloud (usadas
pelo provider do Terraform). O AK é usado junto com o SK para assinar
requisições criptograficamente, garantindo que as requisições sejam secretas,
completas, e corretas. Para mais detalhes, consulte a
[documentação de Chaves de Acesso](https://support.huaweicloud.com/intl/en-us/usermanual-ca/ca_01_0003.html)

Para criar uma chave de acesso para sua conta, primeiro realize o login no
[Console da Huawei Cloud](https://console-intl.huaweicloud.com/).

1. Passe o mouse em cima do seu nome de usuário no canto superior direito (A)
   e clique em "My Credentials" (B) no menu dropdown;

    ![Opção "My Credentials" (B) abaixo do nome de usuário (A)](img/my-credentials.jpg)

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
